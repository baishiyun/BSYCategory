//
//  NSMutableDictionary+Safety.m
//  DataSourceTableViewTest
//
//  Created by 白仕云 on 2018/6/6.
//  Copyright © 2018年 劉光軍. All rights reserved.
//

#import "NSMutableDictionary+Safety.h"
#import "NSMutableArray+Safety.h"
@implementation NSMutableDictionary (Safety)

/**
 对字典垃圾数据做处理
 @return 返回有效数据的字典
 */
-(instancetype)Safety
{
    NSMutableDictionary *SafetyDict = [NSMutableDictionary dictionary];
    NSMutableArray *keyArray = [[[self allKeys] mutableCopy] Safety];
    for (NSString *key in keyArray) {

        if ([self objectForKey:key]!=nil)
            {
            if ([[self objectForKey:key] isKindOfClass:[NSDictionary class]]) {

                NSMutableDictionary *chidDict =[[[self objectForKey:key] mutableCopy] Safety];
                [SafetyDict setObject:chidDict forKey:key];

            }else if ([[self objectForKey:key] isKindOfClass:[NSArray class]]){

                NSMutableArray *array = [[[self objectForKey:key] mutableCopy] Safety];
                [SafetyDict setObject:array forKey:key];

            }else if([[self objectForKey:key] isKindOfClass:[NSString class]]){

                if((![[self objectForKey:key] isKindOfClass:[NSNull class]])
                &&(![[self objectForKey:key] isEqualToString:@"<null>"])
                &&(![[self objectForKey:key] isEqualToString:@"null"])){

                    [SafetyDict setObject:[self objectForKey:key] forKey:key];
                }
            }
        }
    }
    return SafetyDict;
}

/**
 对字典Value和Key作校验
 @param value object
 @param key key
 */
-(void)bsy_setValue:(id)value forKey:(NSString *)key
{
    if (value==nil) {
        return;
    }else if ([value isKindOfClass:[NSNull class]]){
      return;
    }else if ([value isKindOfClass:[NSDictionary class]]){

        value =  [[value mutableCopy] Safety];

    }else if ([value isKindOfClass:[NSArray class]]){
        value =  [[value mutableCopy] Safety];

    }else if ([value isKindOfClass:[NSNumber class]]){
        value = [NSString stringWithFormat:@"%@",value];
    }else if ([value isKindOfClass:[NSString class]]){

       if ([value isEqualToString:@"<null>"]){
            return;
        }else if ([value isEqualToString:@"null"]){
            return;
        }
    }

    if (key==nil) {
        return;
    }else if ([key isKindOfClass:[NSNull class]]){
        return;
    }else if ([key isEqualToString:@"<null>"]){
        return;
    }else if ([key isEqualToString:@"null"]){
        return;
    }
    [self setObject:value forKey:key];
}


@end
