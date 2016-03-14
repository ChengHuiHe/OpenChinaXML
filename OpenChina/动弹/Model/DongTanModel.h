//
//  DongTanModel.h
//  OpenChina
//
//  Created by Chenghui on 16/3/11.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DongTanModel : NSObject

/**
 *  头像
 */
@property (nonatomic,copy) NSString *portrait;

@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *body;
@property (nonatomic,copy) NSString *pubDate;

@property (nonatomic,copy) NSString *likeCount;

#pragma mark -- ????()
@property (nonatomic,copy) NSArray *likeList;


-(instancetype)initWithDongTanWithDict:(NSDictionary*)dict;
+(instancetype)dongTanhWithDict:(NSDictionary*)dict;

@end
