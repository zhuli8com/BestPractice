//
//  AppLog.h
//  BestPractice
//
//  Created by lizhu on 15/10/27.
//  Copyright © 2015年 zhuli. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CocoaLumberjack.h>

//控制日志在DEBUG模式下开启，RELEASE模式下关闭
#ifdef DEBUG
static const int ddLogLevel = DDLogLevelDebug;
#else
static const int ddLogLevel = DDLogLevelOff;
#endif

//自定义日志的等级
#define APPLogError		DDLogError
#define APPLogWarn		DDLogWarn
#define APPLogInfo      DDLogInfo
#define APPLogDebug     DDLogDebug
#define APPLogVerbose	DDLogVerbose

@interface AppLog : NSObject

+ (void)configLog;
@end
