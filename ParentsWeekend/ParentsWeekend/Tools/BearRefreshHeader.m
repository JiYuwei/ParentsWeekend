//
//  BearRefreshHeader.m
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/24.
//  Copyright © 2019 jyw. All rights reserved.
//

#import "BearRefreshHeader.h"

@implementation BearRefreshHeader
//Overwrite
-(void)prepare
{
    [super prepare];
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 0; i <= 8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"base_refresh_%zd", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 0; i <= 8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"base_refresh_%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    [self setTitle:@"正在加载数据" forState:MJRefreshStateRefreshing];
}

- (void)placeSubviews{
    
    [super placeSubviews];
//    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
