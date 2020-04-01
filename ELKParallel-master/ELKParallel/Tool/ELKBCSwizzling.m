//
//  ELKBCSwizzling.m
//  ELKNTBaseConfig
//
//  Created by Jonathan on 2019/4/1.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKBCSwizzling.h"
#import <objc/runtime.h>


@implementation ELKBCSwizzling

+ (void)exchangeMethodWithClass:(id)objClass oriMethod:(SEL)oriSel newMethod:(SEL)newSel
{
    Method fromMethod = class_getInstanceMethod([objClass class], oriSel);
    Method toMethod = class_getInstanceMethod([objClass class], newSel);
    
    if (!class_addMethod([objClass class], oriSel, method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
    
}






@end
