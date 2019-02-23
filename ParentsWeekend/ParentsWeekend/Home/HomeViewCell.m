//
//  HomeViewCell.m
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/23.
//  Copyright © 2019 jyw. All rights reserved.
//

#import "HomeViewCell.h"

@interface HomeViewCell ()

@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *saleLabel;

@end

@implementation HomeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self layoutAllViews];
    }
    return self;
}

#pragma mark - AutoLayout

-(void)layoutAllViews
{
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self).offset(-70);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).offset(5);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self).offset(-30);
    }];
    
    [self.saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self).offset(-5);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).offset(-45);
        make.left.equalTo(self).offset(0);
        make.size.mas_equalTo(CGSizeMake(100, 35));
    }];
}

#pragma mark - Overwrite Setter & Getter

-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.backgroundColor = [UIColor blueColor];
        [self addSubview:_imgView];
    }
    return _imgView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor lightGrayColor];
        _titleLabel.text = @"This is Title";
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.backgroundColor = [UIColor redColor];
        _priceLabel.text = @"$ 100";
        [self addSubview:_priceLabel];
    }
    return _priceLabel;
}

-(UILabel *)saleLabel
{
    if (!_saleLabel) {
        _saleLabel = [[UILabel alloc] init];
        _saleLabel.backgroundColor = [UIColor greenColor];
        _saleLabel.text = @"sale";
        [self addSubview:_saleLabel];
    }
    return _saleLabel;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
