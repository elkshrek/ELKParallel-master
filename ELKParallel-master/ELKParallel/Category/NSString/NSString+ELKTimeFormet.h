//
//  NSString+ELKTimeFormet.h
//  ELKParallel
//
//  Created by wing on 2019/12/30.
//  Copyright © 2019 wing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// 时间格式枚举
typedef NS_OPTIONS(NSUInteger, ELKDateFormatStyle) {
    /// yyyy-MM-dd HH:mm
    ELKDateFmtNormal1       = 1,
    /// yyyy-MM-dd HH:mm:ss
    ELKDateFmtExplicit1     = 2,
    
    /// yyyy年MM月dd日 HH:mm
    ELKDateFmtNormal2       = 3,
    /// yyyy年MM月dd日 HH:mm:ss
    ELKDateFmtExplicit2     = 4,
    
    /// yyyy-M-d
    ELKDateFmtNormal3       = 5,
    /// yyyy-MM-dd
    ELKDateFmtExplicit3     = 6,
    
    /// yyyy年M月d日
    ELKDateFmtNormal4       = 7,
    /// yyyy年MM月dd日
    ELKDateFmtExplicit4     = 8,
    
    
};


@interface NSString (ELKTimeFormet)


/// 时间转换，根据传入的时间格式字符串转换时间戳
/// @param format    时间格式
/// @param timeStamp 毫秒级时间戳字符串
+ (NSString *)elk_timeWithFormat:(NSString *)format timeStamp:(NSString *)timeStamp;


/// 时间转换，根据传入的时间格式转换时间戳
/// @param dateStyle ELKDateFormatStyle
/// @param timeStamp 毫秒级时间戳字符串
+ (NSString *)elk_timeWithDateStyle:(ELKDateFormatStyle)dateStyle timeStamp:(NSString *)timeStamp;


/// 时间转换，时间戳转换为yyyy-MM-dd HH:mm格式时间
/// @param timeStamp 毫秒级时间戳字符串
+ (NSString *)elk_timeForNormal:(NSString *)timeStamp;



/// 获取当前时间戳 （毫秒级时间戳）
+ (NSString*)elk_getNowTimeStamp;


/// 根据传入的格式化时间和格式生成时间戳
/// @param format 时间格式
/// @param time   符合上面格式的时间字符串
+ (NSString *)elk_timeStampWithFormat:(NSString *)format time:(NSString *)time;


/// 日期的时间戳（毫秒级时间戳）
/// @param date 日期
+ (NSString *)elk_timeStampOfDate:(NSDate *)date;


/// 使用给定日期时间戳计算生日
/// @param birthStr 生日毫秒级时间戳
+ (NSString *)elk_ageOfBirthStamp:(NSString *)birthStr;





@end

NS_ASSUME_NONNULL_END
