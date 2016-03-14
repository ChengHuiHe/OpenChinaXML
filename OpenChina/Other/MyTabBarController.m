//
//  MyTabBarController.m
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import "MyTabBarController.h"
#import "ZhongHeTableViewController.h"
#import "MoveMSGViewController.h"
#import "DiscoverViewController.h"
#import "MyTableViewController.h"
#import "MyGTabBar.h"
#import "MyNavgationController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [UINavigationBar appearance];
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    [self setupChildVc:[[ZhongHeTableViewController alloc] init] title:@"综合" image:@"info" selectedImage:@"rating"];
    [self setupChildVc:[[MoveMSGViewController alloc] init] title:@"动弹" image:@"userInfo" selectedImage:@"rating"];
    [self setupChildVc:[[DiscoverViewController alloc] init] title:@"发现" image:@"logo" selectedImage:@"rating"];
    [self setupChildVc:[[MyTableViewController alloc] init] title:@"我" image:@"account" selectedImage:@"rating"];
    
    [self setValue:[[MyGTabBar alloc] init] forKeyPath:@"tabBar"];

}



/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
    
    // 设置导航栏
    MyNavgationController *nav = [[MyNavgationController alloc] initWithRootViewController:vc];
    
    // 添加为子控制器
    [self addChildViewController:nav];
}

@end
