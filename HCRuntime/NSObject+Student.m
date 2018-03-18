//
//  NSObject+Student.m
//  HCRuntime
//
//  Created by HChong on 2018/3/17.
//  Copyright © 2018年 HChong. All rights reserved.
//

#import "NSObject+Student.h"
#import <objc/runtime.h>

@implementation NSObject (Student)

- (void)foo {
    NSLog(@"IMP: -[NSObject(Student) foo]");
}

- (NSString *)name {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
