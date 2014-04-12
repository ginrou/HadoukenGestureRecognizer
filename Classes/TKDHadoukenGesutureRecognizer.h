//
//  TKDHadoukenGesutureRecognizer.h
//  SVMTraning
//
//  Created by 武田 祐一 on 2014/04/12.
//  Copyright (c) 2014年 Yuichi Takeda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKDHadoukenGesutureRecognizer : NSObject
- (instancetype)initWithTarget:(id)target action:(SEL)action;
- (void)setTarget:(id)target action:(SEL)action;
- (void)removeTarget;
@end
