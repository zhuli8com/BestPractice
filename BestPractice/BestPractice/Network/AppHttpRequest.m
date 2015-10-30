//
//  AppHttpRequest.m
//  网络层可能会用到AFN、ASI、MK等，所以需要此层作为过渡
//
//  Created by lizhu on 15/10/30.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "AppHttpRequest.h"
#import <AFNetworking.h>

@implementation AppHttpRequest

+ (void)sendGetRequestWithURL:(NSString *)url parameters:(NSDictionary *)parmas callback:(Callback)callback{
    //GET请求，获取JSON数据
    NSURL *baseURL=[NSURL URLWithString:_URL_HOST_];
    
    NSURLSessionConfiguration *sessionConfig=[NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager=[[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:sessionConfig];
    [manager GET:url parameters:parmas success:^(NSURLSessionDataTask *task, id responseObject) {
        if (callback) {
            callback(task,responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (callback) {
            callback(task,nil,error);
        }
    }];
}
@end
