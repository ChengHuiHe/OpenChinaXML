//
//  Address.h
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#ifndef Address_h
#define Address_h

/*************************综合***************************/
//参数 ：pageIndex当前页索引,pageSize每页数据条数
//接口地址 ：http://www.oschina.net/action/api/news_list?catalog=1&pageIndex=4&pageSize=20

// 到时拼接
#define KZhongHe_URL @"http://www.oschina.net/action/api/news_list"

/*************************新闻id***************************/
// 参数:id为上一个接口的新闻id
//详情接口:
//http://www.oschina.net/action/api/news_detail?id=44392
#define KNews_URL @"http://www.oschina.net/action/api/news_detail"

/*************************评论***************************/
//参数:
//catalog分类id,id新闻id,pageIndex当前页,pageSize每页条数
//评论接口
//http://www.oschina.net/action/api/comment_list?catalog=1&id=44392&pageIndex=0&pageSize=20

/*************************动弹接口***************************/
//动弹接口
//http://www.oschina.net/action/api/tweet_list?uid=0&pageIndex=0&pageSize=20

#define kDongTan_URL @"http://www.oschina.net/action/api/tweet_list?uid=0&pageIndex=0&pageSize=20"



#endif /* Address_h */
