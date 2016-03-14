//
//  DetailModel.h
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

@property (nonatomic,copy) NSString *iD;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *body;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *pubDate;
@property (nonatomic,copy) NSString *url;

@end
