//
//  AppHttpRequest.h
//  BestPractice
//
//  Created by lizhu on 15/10/30.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Callback)(NSURLSessionTask *task,id obj,NSError *error);

@interface AppHttpRequest : NSObject


+ (void)sendGetRequestWithURL:(NSString *)url parameters:(NSDictionary *)parmas callback:(Callback)callback;
@end
