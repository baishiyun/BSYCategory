//
//  UIColor+Hex.h
//  M3U8
//
//  Created by BSY on 16/3/28.
//  Copyright © 2016年 BSY. All rights reserved.
//

#define RGB(A,B,C,Alpha) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:Alpha]


#import <UIKit/UIKit.h>


@interface UIColor (Hex)


//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式

// 调用方法（例如）：  self.view.backgroundColor = [UIColor colorWithHexString:@"123456"];
+ (UIColor *)bsy_colorWithHexString:(NSString *)color;


//该方法多了一个alpha值，调用一样（与上面的方法）
+ (UIColor *)bsy_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end