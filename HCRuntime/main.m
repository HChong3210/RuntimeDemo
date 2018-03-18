//
//  main.m
//  HCRuntime
//
//  Created by HChong on 2018/3/15.
//  Copyright © 2018年 HChong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Student.h"
#import "NSObject+Student.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {

//        BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
//        BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
//        BOOL res3 = [(id)[Student class] isKindOfClass:[Student class]];
//        BOOL res4 = [(id)[Student class] isMemberOfClass:[Student class]];
//        NSLog(@"%d %d %d %d", res1, res2, res3, res4);
        
//        [NSObject foo];
//        [[NSObject new] foo];
        
        NSObject *student = [[NSObject alloc] init];
        [student setName:@"HC"];
        NSLog(@"%@", student.name);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
