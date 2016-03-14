//
//  DongTangTableViewCell.h
//  OpenChina
//
//  Created by Chenghui on 16/3/11.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DongTanModel.h"
#import "LikeListModel.h"

@interface DongTangTableViewCell : UITableViewCell

@property(nonatomic,strong)DongTanModel *model;
@property(nonatomic,strong)LikeListModel *likeListModel;

@end
