//
//  RootTabBarController.m
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/23.
//  Copyright © 2019 jyw. All rights reserved.
//

#import "RootTabBarController.h"
#import "HomeViewController.h"
#import "ComViewController.h"
#import "OrderViewController.h"
#import "MeViewController.h"
#import "RootTabBar.h"

@interface RootTabBarController () <CenterAddBtnDelegate>

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //KVC exchange Tabbar
    RootTabBar *rootBar = [[RootTabBar alloc] init];
    rootBar.addBtnDelegate = self;
    [self setValue:rootBar forKey:@"tabBar"];
    self.tabBar.translucent = NO;
    
    [self addChlidViewController];
}

- (void)addChlidViewController
{
    UITabBarItem *itm=[UITabBarItem appearance];
    [itm setTitleTextAttributes:@{NSForegroundColorAttributeName:ROOT_TITLE_COLOR} forState:UIControlStateSelected];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.tabBarItem.title = HOME_TITLE;
    homeNav.tabBarItem.image = [[UIImage imageNamed:HOME_N_ICON] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:HOME_S_ICON] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.navigationBar.translucent = NO;
    
    ComViewController *comVC = [[ComViewController alloc] init];
    UINavigationController *comNav = [[UINavigationController alloc] initWithRootViewController:comVC];
    comNav.tabBarItem.title = COM_TITLE;
    comNav.tabBarItem.image = [[UIImage imageNamed:COM_N_ICON] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    comNav.tabBarItem.selectedImage = [[UIImage imageNamed:COM_S_ICON] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    comNav.navigationBar.translucent = NO;
    
    OrderViewController *orderVC = [[OrderViewController alloc] init];
    UINavigationController *orderNav = [[UINavigationController alloc] initWithRootViewController:orderVC];
    orderNav.tabBarItem.title = ORDER_TITLE;
    orderNav.tabBarItem.image = [[UIImage imageNamed:ORDER_N_ICON] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    orderNav.tabBarItem.selectedImage = [[UIImage imageNamed:ORDER_S_ICON] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    orderNav.navigationBar.translucent = NO;
    
    MeViewController *meVC = [[MeViewController alloc] init];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:meVC];
    meNav.tabBarItem.title = ME_TITLE;
    meNav.tabBarItem.image = [[UIImage imageNamed:ME_N_ICON] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meNav.tabBarItem.selectedImage = [[UIImage imageNamed:ME_S_ICON] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meNav.navigationBar.translucent = NO;
    
    self.viewControllers = @[homeNav,comNav,orderNav,meNav];
}

#pragma mark - CenterAddBtnDelegate

-(void)centerAddBtnDidClicked:(UIButton *)sender
{
    NSLog(@"centerAddBtn clicked");
}

@end
