//
//  AppHttpMock.m
//  使用OHHTTPStubs伪造HTTP响应
//  OHHTTPStubs可以用来伪造HTTP响应，这样不依赖服务器端，iOS的开发人员就可以测试网络服务了
//
//  Created by lizhu on 15/10/30.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "AppHttpMock.h"
#import <OHHTTPStubs.h>
#import <OHPathHelpers.h>

@implementation AppHttpMock

+ (void)initMock{
    [self initJSONMock];
}

/**
 *  针对http://locahost/json请求的mock
 
 *  基本思路是：调用方法，通过2个回调（block）实现对指定HTTP请求的响应伪造
 *  1、是否是要拦截的请求
 *  2、拦截后创建一个响应
 */
+ (void)initJSONMock{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest * _Nonnull request) {
        return [request.URL.absoluteString rangeOfString:[NSString stringWithFormat:@"%@/json",_URL_HOST_]].location==0;
    } withStubResponse:^OHHTTPStubsResponse * _Nonnull(NSURLRequest * _Nonnull request) {
        NSString *fixture = OHPathForFileInBundle(@"test.json",[NSBundle mainBundle]);
        return [[OHHTTPStubsResponse responseWithFileAtPath:fixture statusCode:200 headers:@{@"Content-Type":@"text/json"}] requestTime:0 responseTime:0];
    }];
}

+ (void)initImageMock{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [[request.URL absoluteString] isEqualToString:@"http://www.sogou.com/images/logo/new/sogou.png"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        APPLogDebug(@"reqeust: %@",request);
        NSString* fixture = OHPathForFileInBundle(@"taobao.png",[NSBundle mainBundle]);
        return [[OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                 statusCode:200 headers:@{@"Content-Type":@"image/png"}
                 ]requestTime:0 responseTime:0];
    }];
}
@end
