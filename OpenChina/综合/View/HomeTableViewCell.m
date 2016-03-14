//
//  HomeTableViewCell.m
//  OpenChina
//
//  Created by Chenghui on 16/3/10.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *bodyDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;

@end
@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setHomeModel:(HomeModel *)homeModel
{
    _homeModel = homeModel;
    self.titleLabel.text = homeModel.title;
    self.bodyDescLabel.text = homeModel.body;
    self.authorLabel.text = homeModel.author;
    self.pubDateLabel.text = homeModel.pubDate;
    self.commentCountLabel.text = homeModel.commentCount;
}

@end
