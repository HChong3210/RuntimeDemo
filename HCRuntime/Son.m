//
//  Son.m
//  HCRuntime
//
//  Created by HChong on 2018/3/15.
//  Copyright © 2018年 HChong. All rights reserved.
//

#import "Son.h"

@implementation Son
- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}

@end
