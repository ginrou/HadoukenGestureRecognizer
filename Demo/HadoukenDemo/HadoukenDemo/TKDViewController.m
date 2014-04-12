//
//  TKDViewController.m
//  HadoukenDemo
//
//  Created by 武田 祐一 on 2014/04/12.
//  Copyright (c) 2014年 Yuichi Takeda. All rights reserved.
//

#import "TKDViewController.h"
#import <TKDHadoukenGesutureRecognizer.h>

@interface TKDViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) TKDHadoukenGesutureRecognizer *hadoukenRecognzier;
@end

@implementation TKDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startRecognzing:(id)sender {
    self.hadoukenRecognzier = [[TKDHadoukenGesutureRecognizer alloc] initWithTarget:self action:@selector(hadoukenRecognized:)];
}

- (void)hadoukenRecognized:(id)sender {

    self.statusLabel.text = @"hadouken!!!";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.statusLabel.text = @"IDLE";
    });

}

@end
