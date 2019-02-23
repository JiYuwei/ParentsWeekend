//
//  RootTabBar.h
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/23.
//  Copyright © 2019 jyw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CenterAddBtnDelegate <NSObject>

-(void)centerAddBtnDidClicked:(UIButton *)sender;

@end


@interface RootTabBar : UITabBar

@property(nonatomic,weak) id <CenterAddBtnDelegate> addBtnDelegate;

@end

NS_ASSUME_NONNULL_END
