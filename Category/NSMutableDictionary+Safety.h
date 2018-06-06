//
//  NSMutableDictionary+Safety.h
//  DataSourceTableViewTest
//
//  Created by 白仕云 on 2018/6/6.
//  Copyright © 2018年 劉光軍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safety)

/**
 对字典垃圾数据做处理
 @return 返回有效数据的字典
 */
-(instancetype)Safety;


/**
 对字典Value和Key作校验
 @param value object
 @param key key
 */
-(void)bsy_setValue:(id)value forKey:(NSString *)key;

@end
