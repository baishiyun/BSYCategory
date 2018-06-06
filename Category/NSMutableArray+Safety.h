//
//  NSMutableArray+Safety.h
//  DataSourceTableViewTest
//
//  Created by 白仕云 on 2018/6/6.
//  Copyright © 2018年 劉光軍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Safety)

/**
 对字典垃圾数据做处理
 @return 返回有效数据的字典
 */
-(instancetype)Safety;


/**
 添加数据

 @param anObject 对象
 */
-(void)bsy_addObject:(id)anObject;



/**
 添加数组

 @param anObject 数组对象
 */
-(void)bsy_addObjectsFromArray:(NSArray *)otherArray;
@end
