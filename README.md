# BSYCategory
BSYCategory is Tool

使用有两种方法，第一种直接下载，把Category文件拖进工程。第二种方法：pod search BSYCategory搜索到添加的自己的podfile中即可使用。1.1.0版本新增NSMutableDictionary和NSMutableArray的两个分类，用于安全添加数据和过滤垃圾数据，以防崩溃问题的产生！



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
