//
//  MoveMSGViewController.m
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import"MoveMSGViewController.h"
#import "DongTangTableViewCell.h"
#import "DongTanModel.h"

@interface MoveMSGViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableViews;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MoveMSGViewController

-(NSMutableArray *)dataArray
{
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
}

#pragma mark-- UI
- (void)createUI
{
    self.tableViews = [[UITableView alloc] initWithFrame:self.view.bounds];
    
//    self.tableViews = tableView;
    self.tableViews.delegate = self;
    self.tableViews.dataSource = self;
    
    [self.view addSubview:self.tableViews];
    self.tableViews.rowHeight = 120;
    [self.navigationItem setTitle:@"动弹"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}];
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    // 
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"search" highImage:@"search" target:self action:@selector(tagClick)];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
 
    // 注册cell
    [self.tableViews registerNib:[UINib nibWithNibName:@"DongTangTableViewCell" bundle:nil] forCellReuseIdentifier:@"DongTangTableViewCell"];
    

}

- (void)tagClick{
}

#pragma mark --- 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    DongTangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DongTangTableViewCell"];
    
    return cell;
}

@end
