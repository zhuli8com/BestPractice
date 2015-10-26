//
//  AppDelegate+Log.m
//  BestPractice
//
//  Created by lizhu on 15/10/26.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "AppDelegate+Log.h"

@implementation AppDelegate (Log)
/**
 *  1、BestPractice-Prefix.pch中添加如下代码
    #import <CocoaLumberjack.h>
    static const int ddLogLevel = DDLogLevelDebug;
    
    2、AppDelegate+Log.m文件的load方法中调用如下代码
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
 
    3、使用的时候可以类似的调用如下代码
    DDLogDebug(@"debug");
 */
+ (void)load{
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}
@end
