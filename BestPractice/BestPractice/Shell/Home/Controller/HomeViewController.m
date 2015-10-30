//
//  HomeViewController.m
//  BestPractice
//
//  Created by lizhu on 15/10/30.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "HomeViewController.h"
#import "AppHttpRequest.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
