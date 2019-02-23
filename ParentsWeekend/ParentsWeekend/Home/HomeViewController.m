//
//  HomeViewController.m
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/23.
//  Copyright © 2019 jyw. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavgationItems];
}

- (void)addNavgationItems
{
    UIBarButtonItem *scanItem = [self navgationItemWithNormalImage:[UIImage imageNamed:SCAN_N_ICON] HighlightedImage:[UIImage imageNamed:SCAN_S_ICON] action:@selector(scanItemClicked)];
    self.navigationItem.leftBarButtonItem = scanItem;
    
    UIBarButtonItem *fishItem = [self navgationItemWithNormalImage:[UIImage imageNamed:FISH_N_ICON] HighlightedImage:[UIImage imageNamed:FISH_S_ICON] action:@selector(fishItemClicked)];
    self.navigationItem.rightBarButtonItem = fishItem;
}

- (UIBarButtonItem *)navgationItemWithNormalImage:(UIImage *)normalImage HighlightedImage:(UIImage *)highlightedImage action:(SEL)action
{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:highlightedImage forState:UIControlStateHighlighted];
    [item addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:item];
    
    return barItem;
}

-(void)scanItemClicked
{
    NSLog(@"scan clicked");
}

-(void)fishItemClicked
{
    NSLog(@"fish clicked");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
