//
//  ViewController.m
//  BestPractice
//
//  Created by lizhu on 15/10/26.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#ifdef _APP_DEV_
    [self.button setTitle:@"我是开发环境" forState:UIControlStateNormal];
#endif
    
#ifdef _APP_TEST_
    [self.button setTitle:@"我是TEST环境" forState:UIControlStateNormal];
#endif
    
#ifdef _APP_RC_
    [self.button setTitle:@"我是RC环境" forState:UIControlStateNormal];
#endif
    
#ifdef _APP_APPSTORE_
    [self.button setTitle:@"我是APPSTORE环境" forState:UIControlStateNormal];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
