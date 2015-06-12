//
//  ViewController.m
//  UI_notification
//
//  Created by rimi on 15/6/12.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "RootViewController.h"
#import "DialViewController.h"

#pragma mark - 通知传值用在跨界面的回调,可以一对多进行注册,多界面可能很混乱

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#warning 第一步注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hangdleEvent:) name:OverNotificationName object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callingNumberNotification:) name:@"callHistory" object:nil];
    
}
#warning 第二步实现通知的响应事件
- (void)hangdleEvent:(NSNotification *)notification {
    NSLog(@"%@",notification.object);

}

#warning 第四步：移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#warning 该方法更新数据源，单例传值
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic = [userdefaults objectForKey:@"array"];
    NSLog(@"%@",dic);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
