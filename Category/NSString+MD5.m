//
//  NSString+MD5.m
//  JinGuiInnovate
//
//  Created by 白仕云 on 2018/5/2.
//  Copyright © 2018年 BSY.com. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation NSString (MD5)
-(NSString *)bsy_lowercaseMd5StringWithObj:(id)obj
{


    NSString *string = @"";
    if ([obj isKindOfClass:[NSDictionary class]]) {

        NSDictionary *objDict = [obj copy];

        NSArray *keys = [objDict allKeys];
        NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2 options:NSNumericSearch];
        }];

        for (NSString *categoryId in sortedArray) {
            string = [string stringByAppendingString:[objDict objectForKey:categoryId]];
        }

    }else if([obj isKindOfClass:[NSString class]]){
        string = obj;
    }

    //要进行UTF8的转码
    const char* input = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);

    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    return [digest lowercaseString];
}

//大写
-(NSString *)bsy_uppercaseMd5StringWithObj:(id)obj
{

    NSString *string = @"";
    if ([obj isKindOfClass:[NSDictionary class]]) {

        NSDictionary *objDict = [obj copy];

        NSArray *keys = [objDict allKeys];
        NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2 options:NSNumericSearch];
        }];

        for (NSString *categoryId in sortedArray) {
            string = [string stringByAppendingString:[objDict objectForKey:categoryId]];
        }

    }else if([obj isKindOfClass:[NSString class]]){
        string = obj;
    }

    //要进行UTF8的转码
    const char* input = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);

    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    return [digest uppercaseString];

}
@end
