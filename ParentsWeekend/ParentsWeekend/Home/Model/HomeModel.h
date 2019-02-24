//
//  HomeModel.h
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/24.
//  Copyright © 2019 jyw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Lists,Cate;

@interface HomeModel : NSObject

@property (nonatomic, copy) NSString * ret;
@property (nonatomic, strong) Cate * cate;
@property (nonatomic, strong) NSArray <Lists *> * lists;

@end


@interface Lists : NSObject

@property (nonatomic, copy) NSString * lon;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * act_type;
@property (nonatomic, copy) NSString * recommend_type;
@property (nonatomic, copy) NSString * end_month;
@property (nonatomic, copy) NSString * org_price;
@property (nonatomic, copy) NSString * start_month;
@property (nonatomic, copy) NSString * is_full;
@property (nonatomic, copy) NSString * a_name;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * tag_color;
@property (nonatomic, copy) NSString * use_num;
@property (nonatomic, copy) NSString * act_id;
@property (nonatomic, copy) NSString * recommend;
@property (nonatomic, copy) NSString * state;
@property (nonatomic, copy) NSString * distance_color;
@property (nonatomic, copy) NSString * real_price;
@property (nonatomic, copy) NSString * pic;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * show_pay;
@property (nonatomic, copy) NSString * address;
@property (nonatomic, copy) NSString * lat;
@property (nonatomic, copy) NSString * tag;

@end

@interface Cate : NSObject

@property (nonatomic, copy) NSString * performance;
@property (nonatomic, copy) NSString * handwork;
@property (nonatomic, copy) NSString * amusement_park;
@property (nonatomic, copy) NSString * early_education;

@end

NS_ASSUME_NONNULL_END
