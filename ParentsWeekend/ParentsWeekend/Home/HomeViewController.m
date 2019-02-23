//
//  HomeViewController.m
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/23.
//  Copyright © 2019 jyw. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewCell.h"

@interface HomeViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *mainTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationItems];
    [self createMainUI];
}

#pragma mark - NavigationItems
- (void)addNavigationItems
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

#pragma mark - MainUI

-(void)createMainUI
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:FULL_BOUNDS style:UITableViewStylePlain];
        _mainTableView.backgroundColor = VIEW_BG_COLOR;
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableFooterView = [[UIView alloc] init];
        [_mainTableView registerClass:[HomeViewCell class] forCellReuseIdentifier:NSStringFromClass([HomeViewCell class])];
        [self.view addSubview:_mainTableView];
    }
}


#pragma mark - UITableViewDataSource & Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeViewCell class]) forIndexPath:indexPath];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
