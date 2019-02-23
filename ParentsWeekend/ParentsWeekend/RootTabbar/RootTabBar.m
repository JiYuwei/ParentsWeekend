//
//  RootTabBar.m
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/23.
//  Copyright © 2019 jyw. All rights reserved.
//

#import "RootTabBar.h"

@interface RootTabBar ()

@property (nonatomic,strong) UIButton *centerAddBtn;

@end


@implementation RootTabBar

//overwrite Getter Method
-(UIButton *)centerAddBtn
{
    if (!_centerAddBtn) {
        _centerAddBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        [_centerAddBtn setImage:[UIImage imageNamed:@"tabbar_icon_2"] forState:UIControlStateNormal];
        [_centerAddBtn addTarget:self action:@selector(clickCenterAddBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_centerAddBtn];
    }
    
    return _centerAddBtn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    // 把 tabBarButton 取出来（把 tabBar 的 subViews 打印出来就明白了）
    NSMutableArray *tabBarButtonArray = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtonArray addObject:view];
        }
    }
    
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = 49;
    CGFloat centerBtnWidth = CGRectGetWidth(self.centerAddBtn.frame);
//    CGFloat centerBtnHeight = CGRectGetHeight(self.centerAddBtn.frame);
    // 设置中间按钮的位置，居中
    self.centerAddBtn.center = CGPointMake(barWidth / 2, barHeight / 2);
    // 重新布局其他 tabBarItem
    // 平均分配其他 tabBarItem 的宽度
    CGFloat barItemWidth = (barWidth - centerBtnWidth) / tabBarButtonArray.count;
    // 逐个布局 tabBarItem，修改 UITabBarButton 的 frame
    [tabBarButtonArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGRect frame = view.frame;
        if (idx >= tabBarButtonArray.count / 2) {
            // 重新设置 x 坐标，如果排在中间按钮的右边需要加上中间按钮的宽度
            frame.origin.x = idx * barItemWidth + centerBtnWidth;
        } else {
            frame.origin.x = idx * barItemWidth;
        }
        // 重新设置宽度
        frame.size.width = barItemWidth;
        view.frame = frame;
    }];
    // 把中间按钮带到视图最前面
    [self bringSubviewToFront:self.centerAddBtn];
}

-(void)clickCenterAddBtn:(UIButton *)sender
{
    NSLog(@"center btn clicked");
}

@end
