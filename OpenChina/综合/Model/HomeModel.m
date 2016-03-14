//
//  HomeModel.m
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

/**
 利用kvc解析
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //找到和属性不一致名字的key，然后赋值给self的属性
    if ([key isEqualToString:@"id"]) {
        self.iD = value;
    }
}
-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}


@end
