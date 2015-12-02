//
//  AppDelegate+MethodSwizzling.m
//  BestPractice
//
//  Created by lizhu on 15/12/1.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "AppDelegate+MethodSwizzling.h"
#import <objc/runtime.h>

@interface AppDelegate ()

@property (assign, nonatomic) NSString *associatedObject_assign;
@property (strong, nonatomic) NSString *associatedObject_retain;
@property (copy,   nonatomic) NSString *associatedObject_copy;
@end

@implementation AppDelegate (MethodSwizzling)

#pragma mark - life cycles
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class=[self class];
        
        SEL originalSelector=@selector(viewWillAppear:);
        SEL swizzledSelector=@selector(mrc_viewWillAppear:);
        
        Method originalMethod=class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod=class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success=class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }else{
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - method swizzling
- (void)mrc_viewWillAppear:(BOOL)animated{
    APPLogDebug(@"mrc_viewWillAppear");
}

#pragma mark - getters and setters
- (NSString *)associatedObject_assign {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAssociatedObject_assign:(NSString *)associatedObject_assign {
    objc_setAssociatedObject(self, @selector(associatedObject_assign), associatedObject_assign, OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)associatedObject_retain {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAssociatedObject_retain:(NSString *)associatedObject_retain {
    objc_setAssociatedObject(self, @selector(associatedObject_retain), associatedObject_retain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)associatedObject_copy {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAssociatedObject_copy:(NSString *)associatedObject_copy {
    objc_setAssociatedObject(self, @selector(associatedObject_copy), associatedObject_copy, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
