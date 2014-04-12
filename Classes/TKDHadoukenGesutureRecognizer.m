//
//  TKDHadoukenGesutureRecognizer.m
//  SVMTraning
//
//  Created by 武田 祐一 on 2014/04/12.
//  Copyright (c) 2014年 Yuichi Takeda. All rights reserved.
//

@import CoreMotion;

#import "TKDHadoukenGesutureRecognizer.h"
#include "svm.h"

@interface TKDHadoukenGesutureRecognizer ()

@property (nonatomic, strong) CMMotionManager *motionManager;
@property (nonatomic, strong) NSOperationQueue *motionHandlingQueue;

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;

@property (nonatomic, assign) struct svm_model *model;
@property (nonatomic, assign) struct svm_node *node_array;
@property (nonatomic, strong) NSMutableArray *accelerometerDataList;

@end

static const NSTimeInterval kGestureUpdateInterval = 1.0/30.0; // 30[fps]
static const NSInteger kFrameCountForRecognition = 30; // 30*3 = 90 dimensional vector is used for gesture recognzie
static const double kHadoukenLabel = 1.0;

@implementation TKDHadoukenGesutureRecognizer

- (instancetype)init {
    self = [super init];
    if (self) {
        _motionManager = [CMMotionManager new];
        _motionManager.accelerometerUpdateInterval = kGestureUpdateInterval;
        _motionHandlingQueue = [NSOperationQueue new];

        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"HadoukenGestureRecognizer" ofType:@"bundle"];
        NSString *filePath = [[NSBundle bundleWithPath:bundlePath] pathForResource:@"hadouken-svm" ofType:@"model"];

        _model = svm_load_model([filePath cStringUsingEncoding:NSUTF8StringEncoding]);
        size_t node_array_size = kFrameCountForRecognition * 3 + 1;
        _node_array = malloc(sizeof(struct svm_node) * node_array_size);

        _accelerometerDataList = [NSMutableArray array];

    }
    return self;
}

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    self = [self init];
    if (self) {
        [self setTarget:target action:action];
    }
    return self;
}

- (void)dealloc {
    svm_free_and_destroy_model(&_model);
    free(_node_array);
}

- (void)setTarget:(id)target action:(SEL)action {

    NSAssert([target respondsToSelector:action], @"target must responds to action when use TKDHadoukenGesutureRecognizer");

    self.target = target;
    self.action = action;

    if (self.motionManager.isAccelerometerActive) {
        [self.motionManager stopAccelerometerUpdates];
    }

    [self.motionManager startAccelerometerUpdatesToQueue:self.motionHandlingQueue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {

        if (error) return;

        if (self.accelerometerDataList.count < kFrameCountForRecognition) {
            [self.accelerometerDataList addObject:accelerometerData];
        } else {
            [self.accelerometerDataList removeObjectAtIndex:0];
            [self.accelerometerDataList addObject:accelerometerData];

            // pack node_array
            for (int i = 0; i < self.accelerometerDataList.count; ++i) {

                CMAccelerometerData *data = self.accelerometerDataList[i];
                self.node_array[i*3+0].value = data.acceleration.x;
                self.node_array[i*3+0].index = i*3+1;

                self.node_array[i*3+1].value = data.acceleration.y;
                self.node_array[i*3+1].index = i*3+2;

                self.node_array[i*3+2].value = data.acceleration.z;
                self.node_array[i*3+2].index = i*3+3;

            }

            self.node_array[kFrameCountForRecognition*3].index = -1;

            // predict
            double predictedValue = svm_predict(self.model, self.node_array);

            // call handler if recognized
            if (fabs(predictedValue - kHadoukenLabel) < DBL_EPSILON) {
                [self.target performSelectorOnMainThread:self.action withObject:self waitUntilDone:NO];
            }

        }

    }];

}

- (void)removeTarget {
    [self.motionManager stopAccelerometerUpdates];
    [self.accelerometerDataList removeAllObjects];
}

@end
