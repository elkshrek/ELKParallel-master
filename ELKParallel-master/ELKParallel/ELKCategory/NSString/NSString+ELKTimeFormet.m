//
//  NSString+ELKTimeFormet.m
//  ELKParallel
//
//  Created by wing on 2019/12/30.
//  Copyright © 2019 wing. All rights reserved.
//

#import "NSString+ELKTimeFormet.h"

@implementation NSString (ELKTimeFormet)


/// 时间转换，根据传入的时间格式字符串转换时间戳
/// @param format    时间格式
/// @param timeStamp 毫秒级时间戳字符串
+ (NSString *)elk_timeWithFormat:(NSString *)format timeStamp:(NSString *)timeStamp
{
    NSDate *date = [NSString elk_dateWithTimeStamp:timeStamp];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate:date];
}


/// 时间转换，时间戳转换为yyyy-MM-dd HH:mm格式时间
/// @param timeStamp 毫秒级时间戳字符串
+ (NSString *)elk_timeForNormal:(NSString *)timeStamp
{
    NSString *dFormat = @"yyyy-MM-dd HH:mm";
    NSString *timeString = [self elk_timeWithFormat:dFormat timeStamp:timeStamp];
    return timeString;
}


/// 时间转换，根据传入的时间格式转换时间戳
/// @param dateStyle ELKDateFormatStyle
/// @param timeStamp 毫秒级时间戳字符串
+ (NSString *)elk_timeWithDateStyle:(ELKDateFormatStyle)dateStyle timeStamp:(NSString *)timeStamp
{
    NSString *dFormat = @"yyyy-MM-dd HH:mm";
    switch (dateStyle) {
        case ELKDateFmtNormal1:
            dFormat = @"yyyy-MM-dd HH:mm";
            break;
        case ELKDateFmtExplicit1:
            dFormat = @"yyyy-MM-dd HH:mm:ss";
            break;
        case ELKDateFmtNormal2:
            dFormat = @"yyyy年MM月dd日 HH:mm";
            break;
        case ELKDateFmtExplicit2:
            dFormat = @"yyyy年MM月dd日 HH:mm:ss";
            break;
        case ELKDateFmtNormal3:
            dFormat = @"yyyy-M-d";
            break;
        case ELKDateFmtExplicit3:
            dFormat = @"yyyy-MM-dd";
            break;
        case ELKDateFmtNormal4:
            dFormat = @"yyyy年M月d日";
            break;
        case ELKDateFmtExplicit4:
            dFormat = @"yyyy年MM月dd日";
            break;
            
        default:
            dFormat = @"yyyy-MM-dd HH:mm";
            break;
    }
    NSString *timeString = [self elk_timeWithFormat:dFormat timeStamp:timeStamp];
    return timeString;
}


/// 获取当前时间戳 （以毫秒为单位）
+ (NSString*)elk_getNowTimeStamp
{
    NSDate *date = [NSDate date];
    return [self elk_timeStampOfDate:date];
}

/// 根据传入的格式化时间和格式生成时间戳
/// @param format 时间格式
/// @param time   符合上面格式的时间字符串
+ (NSString *)elk_timeStampWithFormat:(NSString *)format time:(NSString *)time
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    NSDate *date = [dateFormat dateFromString:time];
    return [self elk_timeStampOfDate:date];
}

/// 日期的时间戳（毫秒级时间戳）
/// @param date 日期
+ (NSString *)elk_timeStampOfDate:(NSDate *)date
{
    NSTimeInterval timeInter = [date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.f", timeInter * 1000];
    return timeString;
}



/// 使用给定日期时间戳计算生日
/// @param birthStr 生日时间戳
+ (NSString *)elk_ageOfBirthStamp:(NSString *)birthStr
{
    NSDate *birthDate = [NSString elk_dateWithTimeStamp:birthStr];
    NSDate *curDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComp = [calendar components:NSCalendarUnitYear fromDate:birthDate toDate:curDate options:0];
    
    return [NSString stringWithFormat:@"%ld", (long)dateComp.year];
}


/// 时间戳转日期，返回NSDate对象
/// @param timeStamp 毫秒级时间戳
+ (NSDate *)elk_dateWithTimeStamp:(NSString *)timeStamp
{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    if (timeStamp && timeStamp.length >= 3) {
        interval = ceill([timeStamp doubleValue] / 1000);
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return date;
}



@end
