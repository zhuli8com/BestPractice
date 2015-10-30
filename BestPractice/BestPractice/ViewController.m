//
//  ViewController.m
//  BestPractice
//
//  Created by lizhu on 15/10/26.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "ViewController.h"
#import "AppHttpRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    APPLogDebug(_URL_SCHEME_);
    // Do any additional setup after loading the view, typically from a nib.
    [AppHttpRequest sendGetRequestWithURL:@"/json" parameters:nil callback:^(NSURLSessionTask *task, id obj, NSError *error) {
        if (!error) {
            NSDictionary *dict=obj;
            APPLogDebug(@"test%@",dict[@"message"]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
