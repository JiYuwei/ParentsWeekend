//
//  URLJointTool.m
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/24.
//  Copyright © 2019 jyw. All rights reserved.
//

#import "URLJointTool.h"

@implementation URLJointTool
//?mobile=104&version=220&cate=0&city_id=0&lat=33.01732779566323&limit=1&lon=119.011410840779&mobile_type=iPhone&mobile_udid=b97e08abb4cb973f9da7bf5324067a344803236f&page=1&user_id=0"
+(NSString *)jointHomeRedfeshUrlwithPage:(NSUInteger)page
{
    NSDictionary *parameters = @{
                                 @"mobile":@"104",
                                 @"version":@"220",
                                 @"cate":@"0",
                                 @"city_id":@"0",
                                 @"lat":@"33.01732779566323",
                                 @"limit":@"1",
                                 @"lon":@"119.011410840779",
                                 @"mobile_type":@"iPhone",
                                 @"mobile_udid":@"b97e08abb4cb973f9da7bf5324067a344803236f",
                                 @"page":[NSString stringWithFormat:@"%ld",page],
                                 @"user_id":@"0"
                                 };
    
    return [self jointGETUrlwithHost:HOST_URL path:HOME_PATH parameters:parameters];
}

+(NSString *)jointGETUrlwithHost:(NSString *)host path:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?",host,path];
    NSMutableArray *parArray = [NSMutableArray array];
    for (NSString *key in parameters) {
        NSString *para = [NSString stringWithFormat:@"%@=%@",key,parameters[key]];
        [parArray addObject:para];
    }
    NSString *urlPara = [parArray componentsJoinedByString:@"&"];
    
    NSString *fullUrl = [NSString stringWithFormat:@"%@%@",urlString,urlPara];
    
    return fullUrl;
}

@end
