//
//  DialViewController.m
//  UI_notification
//
//  Created by rimi on 15/6/12.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "DialViewController.h"

NSString *const OverNotificationName = @"bitch！";


@interface DialViewController ()

@end


@implementation DialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)hangDownEvent:(id)sender {
#warning 第四步发送通知
    //创建数据源
    NSArray *array = @[@"中国移动",@"中国联通",@"中国联通",@"未知"];
    
    //产生随机数
    u_int32_t index = arc4random_uniform((u_int32_t)array.count);
    NSDictionary *dic = @{@"Operator":array[index],
                          @"time":@"00:00:00",
                          @"data":@"5月10号",
                          @"phoneNumber":@"12345"};
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:OverNotificationName object:dic];
    
#warning 单例传值 只需改变这里的第三步
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:dic forKey:@"dic"];
    //传递数组
    NSMutableArray *marray = [NSMutableArray arrayWithArray:[userDefaults objectForKey:@"array"]];
    
    [userDefaults removeObjectForKey:@"array"]; //把以前存的数组移除
    
    [marray addObject:dic];
    
    [userDefaults setObject:marray forKey:@"array"];
    
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
