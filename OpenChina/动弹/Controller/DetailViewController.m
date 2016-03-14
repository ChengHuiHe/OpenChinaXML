//
//  DetailViewController.m
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import "DetailViewController.h"
#import "GDataXMLNode.h"
#import "DetailModel.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollerViewDetail;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;


@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;

@property(nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation DetailViewController

-(NSMutableArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray =[NSMutableArray new];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    scrollerView.contentSize =CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    self.scrollerViewDetail.showsHorizontalScrollIndicator = NO;
    self.scrollerViewDetail = scrollerView;
    
    // 注册cell
//    [self.view registerNib:[UINib nibWithNibName:@"DetailViewController" bundle:nil] forCellReuseIdentifier:@"DetailViewController"];
    

    
    // 解析数据
    [self requestData];

}

#pragma mark -- 处理数据
-(void)requestData
{
    //http://www.oschina.net/action/api/news_detail?id=44392
    
    // XML--- 请求
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [_manager GET:[NSString stringWithFormat:@"%@?id=%@",KNews_URL,self.newsID] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //        NSLog(@"%@",responseObject);
        
        GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:responseObject options:0 error:nil];
        //4.获取user节点元素数组
        NSArray *userArray = [document nodesForXPath:@"/oschina/news" error:nil];

            for (GDataXMLElement *ele in userArray) {
                DetailModel *model = [[DetailModel alloc] init];
                model.iD = [[[ele elementsForName:@"id"] firstObject] stringValue];
                model.title = [[[ele elementsForName:@"title"] firstObject] stringValue];
                model.body = [[[ele elementsForName:@"body"] firstObject] stringValue];
                model.author = [[[ele elementsForName:@"author"] firstObject] stringValue];
                model.pubDate = [[[ele elementsForName:@"pubDate"] firstObject] stringValue];
                
                self.titleLabel.text = model.title;
                self.authorLabel.text = model.author;
                self.pubDateLabel.text = model.pubDate;
                
                self.bodyLabel.text = model.body;
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",[error description]);
    }];
    
}

@end
