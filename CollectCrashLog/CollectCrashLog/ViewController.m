//
//  ViewController.m
//  CollectCrashLog
//
//  Created by lwmini on 2019/1/11.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.backgroundColor = [UIColor yellowColor];
    [btn setFrame:CGRectMake(100, 100, 200, 200)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn setTitle:@"数组越界闪退" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnClick:(UIButton *)sender{
    NSArray *array = @[@"123"];
    NSString *str = array[2];//数组越界 crash日志收集
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
