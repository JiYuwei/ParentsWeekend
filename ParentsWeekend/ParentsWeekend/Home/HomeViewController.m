//
//  HomeViewController.m
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/23.
//  Copyright © 2019 jyw. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewCell.h"
#import "HomeModel.h"

@interface HomeViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)HomeModel *homeModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationItems];
    [self prepareRefreshData];
}
//lazy load
-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:FULL_BOUNDS style:UITableViewStylePlain];
        _mainTableView.backgroundColor = VIEW_BG_COLOR;
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableFooterView = [[UIView alloc] init];
        [_mainTableView registerClass:[HomeViewCell class] forCellReuseIdentifier:NSStringFromClass([HomeViewCell class])];
        //Turn Off Self-Sizing
        _mainTableView.estimatedRowHeight =0;
        _mainTableView.estimatedSectionHeaderHeight =0;
        _mainTableView.estimatedSectionFooterHeight =0;
        
        [self.view addSubview:_mainTableView];
    }
    
    return _mainTableView;
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

#pragma mark - PrepareData

-(void)prepareRefreshData
{
    self.mainTableView.mj_header = [BearRefreshHeader headerWithRefreshingBlock:^{
        [self retrieveHomePageData];
    }];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (self.homeModel.lists.count > 0) {
            [self loadMoreHomePageData];
        }
        else{
            [self retrieveHomePageData];
        }
    }];
    footer.triggerAutomaticallyRefreshPercent = 0.5;
    [footer setTitle:@"加载中" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"～已经到底了～" forState:MJRefreshStateNoMoreData];
    self.mainTableView.mj_footer = footer;
    //first loading
    [self.mainTableView.mj_footer beginRefreshing];
}

-(void)retrieveHomePageData
{
    NSString *url = [URLJointTool jointHomeRedfeshUrlwithPage:1];
    
    [JYNetworkRequest retrieveJsonWithPrepare:nil finish:^{
        [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView.mj_footer endRefreshing];
    } needCache:YES requestType:HTTPRequestTypeGET fromURL:url parameters:nil success:^(NSDictionary *json) {
        if (json) {
            [self buildFirstDatawithJson:json];
        }
    } failure:^(NSError *error, BOOL needCache, NSDictionary *cachedJson) {
        if (needCache) {
            [self buildFirstDatawithJson:cachedJson];
        }
    }];
}

-(void)buildFirstDatawithJson:(NSDictionary *)json
{
    self.homeModel = nil;
    self.homeModel = [HomeModel mj_objectWithKeyValues:json];
    [self.mainTableView reloadData];
}

-(void)loadMoreHomePageData
{
    NSUInteger page = (self.homeModel.lists.count / 10) + 1;
    NSString *url = [URLJointTool jointHomeRedfeshUrlwithPage:page];
    
    [JYNetworkRequest retrieveJsonWithPrepare:nil finish:^{
        if (self.homeModel.lists.count % 10) {
            [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
        }
        else{
            [self.mainTableView.mj_footer endRefreshing];
        }
    } needCache:YES requestType:HTTPRequestTypeGET fromURL:url parameters:nil success:^(NSDictionary *json) {
        if (json) {
            [self buildMoreDatawithJson:json];
        }
    } failure:^(NSError *error, BOOL needCache, NSDictionary *cachedJson) {
        if (needCache) {
            [self buildMoreDatawithJson:cachedJson];
        }
    }];
}

-(void)buildMoreDatawithJson:(NSDictionary *)json
{
    HomeModel *homeModel = [HomeModel mj_objectWithKeyValues:json];
    if (homeModel.lists.count > 0) {
        NSArray <Lists *> *lastArr = self.homeModel.lists;
        NSArray <Lists *> *nextArr = homeModel.lists;
        NSArray <Lists *> *newArr = [lastArr arrayByAddingObjectsFromArray:nextArr];
        self.homeModel.lists = newArr;
        [self.mainTableView reloadData];
    }
}

#pragma mark - UITableViewDataSource & Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeViewCell class]) forIndexPath:indexPath];
    cell.lists = self.homeModel.lists[indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.homeModel.lists.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 280;
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
