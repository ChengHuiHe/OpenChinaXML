//
//  UIBarButtonItem+MyGExtension.h
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MyGExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
