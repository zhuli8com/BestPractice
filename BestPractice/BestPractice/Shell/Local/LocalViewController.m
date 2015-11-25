//
//  LocalViewController.m
//  BestPractice
//
//  Created by lizhu on 15/11/25.
//  Copyright © 2015年 zhuli. All rights reserved.
//

#import "LocalViewController.h"

@interface LocalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation LocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.label.text=NSLocalizedStringFromTable(@"key", @"Local", @"我是注释");
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
