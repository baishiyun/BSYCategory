//
//  NSMutableArray+Safety.m
//  DataSourceTableViewTest
//
//  Created by 白仕云 on 2018/6/6.
//  Copyright © 2018年 劉光軍. All rights reserved.
//

#import "NSMutableArray+Safety.h"
#import "NSMutableDictionary+Safety.h"
@implementation NSMutableArray (Safety)

-(NSMutableArray *)Safety
{
    NSMutableArray *array  =[NSMutableArray array];
    for (int index=0; index<self.count; index++) {

        id obj =[self objectAtIndex:index];
        if (obj!=nil) {
            if ([obj isKindOfClass:[NSArray class]]) {
                obj = [[obj mutableCopy] Safety];
                      [array addObject:obj];
            }else if ([obj isKindOfClass:[NSDictionary class]]){
                obj = [[obj mutableCopy] Safety];
                      [array addObject:obj];
            }else if ([obj isKindOfClass:[NSNumber class]]){
                obj = [NSString stringWithFormat:@"%@",obj];
                      [array addObject:obj];
            }else if ([obj isKindOfClass:[NSString class]]){
                if ((![obj isEqualToString:@"<null>"])&&(![obj isEqualToString:@"null"])) {
                        [array addObject:obj];
                }
            }else if ([obj isKindOfClass:[NSNull class]]){

            }

        }

    }
    return array;
}

/**
 添加数据
 @param anObject 对象
 */
-(void)bsy_addObject:(id)anObject
{

    if ([anObject isKindOfClass:[NSNull class]]){
        return;
    }else if (anObject==nil){
        return;
    }else if ([anObject isKindOfClass:[NSArray class]]) {
        anObject = [[anObject mutableCopy] Safety];
    }else if ([anObject isKindOfClass:[NSDictionary class]])
    {
        anObject = [[anObject mutableCopy] Safety];
    }else if ([anObject isKindOfClass:[NSNumber class]]){
        anObject  = [NSString stringWithFormat:@"%@",anObject];
    }else if ([anObject isKindOfClass:[NSString class]])
    {
        if ((![anObject isEqualToString:@"<null>"])&&(![anObject isEqualToString:@"null"])) {
        }else{
            return;
        }
    }
    [self addObject:anObject];
}


/**
 添加数组
 @param anObject 数组对象
 */
-(void)bsy_addObjectsFromArray:(NSArray *)otherArray
{
    [self addObjectsFromArray:[[otherArray mutableCopy] Safety]];
}
@end
