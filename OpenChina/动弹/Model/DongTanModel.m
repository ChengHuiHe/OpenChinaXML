//
//  DongTanModel.m
//  OpenChina
//
//  Created by Chenghui on 16/3/11.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import "DongTanModel.h"

@implementation DongTanModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@",key);
}

- (instancetype)initWithDongTanWithDict:(NSDictionary *)dict
{

    if (self = [super init]) {
        
    }
    return self;
}

+(instancetype)dongTanhWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDongTanWithDict:dict];
}

@end
