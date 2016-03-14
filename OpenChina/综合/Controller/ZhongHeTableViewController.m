//
//  ZhongHeTableViewController.m
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import "ZhongHeTableViewController.h"
#import "DetailViewController.h"
#import "HomeTableViewCell.h"
#import "GDataXMLNode.h"


@interface ZhongHeTableViewController ()

@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,assign)int page;
@end

@implementation ZhongHeTableViewController

- (void)viewWillAppear:(BOOL)animated
{
//    自动进入刷新状态
//    [self.tableView headerBeginRefreshing];
    
//    [self.tableView footerBeginRefreshing];
    
}

-(NSMutableArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray =[NSMutableArray new];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 设置导航栏标题
    self.title = @"综合";

       // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeTableViewCell"];
    

    self.tableView.rowHeight = 100;
    
    self.page = 1;

    // UI
    [self createUI];
    // 刷新
    [self refreashData];

    // 解析数据
    [self requestData];
}

#pragma mark-- UI
- (void)createUI
{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}];
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"search" highImage:@"search" target:self action:@selector(tagClick)];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    

}

#pragma mark- 上下拉刷新相关
-(void)refreashData
{
    //添加上下拉刷新
    __weak typeof(self) weakSelf = self;

    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //下拉刷新
        weakSelf.page = 1;
        [weakSelf requestData];
        
    }];

    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //上拉刷新
        weakSelf.page++;
        [weakSelf requestData];
        
        
    }];
    
}

#pragma mark -- 处理数据
-(void)requestData
{
    // http://www.oschina.net/action/api/news_list?catalog=1&pageIndex=4&pageSize=20
    
    // XML--- 请求
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [_manager GET:[NSString stringWithFormat:@"%@?catalog=1&pageIndex=%d&pageSize=20",KZhongHe_URL,self.page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"%@",responseObject);

        GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:responseObject options:0 error:nil];
        //4.获取user节点元素数组
        NSArray *userArray = [document nodesForXPath:@"/oschina/newslist" error:nil];
        //5.遍历数组
        for (GDataXMLElement *news in  userArray) {
            
            NSArray * shiArr = [news elementsForName:@"news"];
            
            for (GDataXMLElement *ele in shiArr) {
                HomeModel *model = [[HomeModel alloc] init];
                model.iD = [[[ele elementsForName:@"id"] firstObject] stringValue];
                model.title = [[[ele elementsForName:@"title"] firstObject] stringValue];
                model.body = [[[ele elementsForName:@"body"] firstObject] stringValue];
                model.commentCount = [[[ele elementsForName:@"commentCount"] firstObject] stringValue];
                model.author = [[[ele elementsForName:@"author"] firstObject] stringValue];
                model.pubDate = [[[ele elementsForName:@"pubDate"] firstObject] stringValue];

                [_dataArray addObject:model];
            }
        }
    
        // 刷新数据
        [self.tableView reloadData];
        
        //结束刷新状态
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",[error description]);
    }];

}

- (void)tagClick
{

}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
    
    HomeModel *model = self.dataArray[indexPath.row];
    [cell setHomeModel:model];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    
    HomeModel *model = self.dataArray[indexPath.row];
    detailVC.newsID = model.iD;
    
    NSLog(@"%@",detailVC.newsID);
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
