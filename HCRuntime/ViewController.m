//
//  ViewController.m
//  HCRuntime
//
//  Created by HChong on 2018/3/15.
//  Copyright © 2018年 HChong. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id cls = [Student class];
    void *obj = &cls;
    [(__bridge id)obj speak];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
