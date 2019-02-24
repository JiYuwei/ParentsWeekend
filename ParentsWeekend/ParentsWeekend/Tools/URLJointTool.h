//
//  URLJointTool.h
//  ParentsWeekend
//
//  Created by 纪宇伟 on 2019/2/24.
//  Copyright © 2019 jyw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface URLJointTool : NSObject

+(NSString *)jointHomeRedfeshUrlwithPage:(NSUInteger)page;

+(NSString *)jointGETUrlwithHost:(NSString *)host path:(NSString *)path parameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
