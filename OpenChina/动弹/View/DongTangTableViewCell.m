//
//  DongTangTableViewCell.m
//  OpenChina
//
//  Created by Chenghui on 16/3/11.
//  Copyright © 2016年 Chenghui. All rights reserved.
//

#import "DongTangTableViewCell.h"

@interface DongTangTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userIconImage;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabe;
@property (weak, nonatomic) IBOutlet UILabel *origineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;

@end
@implementation DongTangTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(DongTanModel *)model
{
    _model = model;
    
    [self.userIconImage sd_setImageWithURL:[NSURL URLWithString:model.portrait] placeholderImage:[UIImage imageNamed:@"100"]];
    
    self.userNameLabel.text = model.author;
    self.contentLabel.text = model.body;
    self.dateLabe.text = model.pubDate;
    self.contentCountLabel.text = model.likeCount;
}

-(void)setLikeListModel:(LikeListModel *)likeListModel
{
    _likeListModel = likeListModel;
    
//   [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:likeListModel.portrait] placeholderImage:[UIImage imageNamed:@"014"];
    self.origineLabel.text = likeListModel.name;
}

@end
