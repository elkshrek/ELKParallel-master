//
//  UIColor+ELKCustom.m
//  ELKParallel
//
//  Created by wing on 2019/12/30.
//  Copyright © 2019 wing. All rights reserved.
//

#import "UIColor+ELKCustom.h"

@implementation UIColor (ELKCustom)


+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] < 6)
        return [UIColor blackColor];
    if ([cString length] > 8)
        return [UIColor blackColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    NSString *aString = @"FF";
    if (cString.length > 6) {
        range.location = 6;
        aString = [cString substringFromIndex:6];
        if (aString.length < 2) {
            aString = [NSString stringWithFormat:@"%@0", aString];
        }
    }
    
    unsigned int r, g, b, a;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:((float) a / 255.0f)];
}



@end
