//
//  ViewController+MethodSwizzling.m
//  HCRuntime
//
//  Created by HChong on 2018/3/17.
//  Copyright © 2018年 HChong. All rights reserved.
//

#import "ViewController+MethodSwizzling.h"
#import "objc/runtime.h"

@implementation ViewController (MethodSwizzling)

+ (void)load {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        Class class = [self class];
        //这里需要注意, 如果要Swizzling类方法则要获取当前类的原类, 因为根据objc_msgSend, 实例方法我们从对象的isa也就是对象所在的类中开始找, 类方法则是从类的isa也就是类的原类中开始找. object_getClass((id)self) 与 [self class] 返回的结果类型都是 Class, 但前者为元类, 后者为其本身.
        // Class class = object_getClass((id)self);
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        //我们先把要替换的类添加到category中
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            //class_replaceMethod相当于直接调用class_addMethod向类中添加该方法的实现
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            //交换IMP, IMP是函数指针, 直接指向方法的内存地址
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
    NSLog(@"%@ viewWillAppear", self);
}
@end
