//
//  AppLog.m
//  BestPractice
//
//  Created by lizhu on 15/10/27.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "AppLog.h"

@implementation AppLog

+ (void)configLog{
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:[UIColor whiteColor] forFlag:DDLogFlagDebug];
}
@end
