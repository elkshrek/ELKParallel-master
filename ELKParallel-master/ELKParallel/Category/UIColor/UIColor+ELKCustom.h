//
//  UIColor+ELKCustom.h
//  ELKParallel
//
//  Created by wing on 2019/12/30.
//  Copyright © 2019 wing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ELKCustom)


/**
 *  Create a color from a HEX string.
 *  It supports the following type:
 *  - #RGB
 *  - #ARGB
 *  - #RRGGBB
 *  - #AARRGGBB
 *
 *  @param hexString NSString
 *  @return Returns the UIColor instance
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;






@end

NS_ASSUME_NONNULL_END
