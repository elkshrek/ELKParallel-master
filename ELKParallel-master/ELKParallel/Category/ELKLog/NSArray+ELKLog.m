//
//  NSArray+ELKLog.m
//  StarDreamiOS
//
//  Created by wing on 2019/8/13.
//  Copyright © 2019 elk. All rights reserved.
//

#import "NSArray+ELKLog.h"

@implementation NSArray (ELKLog)


- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *string = [NSMutableString string];
    
    [string appendString:@"[\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];
    [string appendString:@"]"];
    
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}







@end
