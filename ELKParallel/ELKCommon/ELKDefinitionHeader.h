//
//  ELKDefinitionHeader.h
//  ELKParallel
//
//  Created by wing on 2019/12/30.
//  Copyright © 2019 wing. All rights reserved.
//

#ifndef ELKDefinitionHeader_h
#define ELKDefinitionHeader_h


#pragma mark - 屏幕尺寸定义
#ifndef ELKScreenWidth
#define ELKScreenWidth        ([[UIScreen mainScreen] bounds].size.width)
#define ELKScreenHeight       ([[UIScreen mainScreen] bounds].size.height)

#define ELK_StatusBarHeight   ([UIApplication sharedApplication].statusBarFrame.size.height)

#define ELK_isiPhoneX         ((ELK_StatusBarHeight > 21.f) ? YES : NO)
#define ELK_NavBarHeight      (ELK_isiPhoneX ? 88.f : 64.f)
#define ELK_SafeTop           (ELK_isiPhoneX ? 44.f : 0.f)
#define ELK_TabBarHeight      (ELK_isiPhoneX ? 83.f : 49.f)
#define ELK_SafeBottom        (ELK_isiPhoneX ? 34.f : 0.f)

#define ELKScreenScale        [UIScreen mainScreen].scale

#define ELKWidthRatio375      (ELKScreenWidth / 375.0)
#define ELKAdaptWidth(wd)     (wd * ELKWidthRatio375)

// 获取View的属性
#define ELKGetViewWidth(view)  view.frame.size.width
#define ELKGetViewHeight(view) view.frame.size.height
#define ELKGetViewX(view)      view.frame.origin.x
#define ELKGetViewY(view)      view.frame.origin.y


#endif


#pragma mark - 系统等级
#ifndef ELKDevSysVersion
#define ELKDevSysVersion ([[[UIDevice currentDevice] systemVersion] floatValue])
#endif
#ifndef ELK_iOS9
#define ELK_iOS9  (ELKDevSysVersion >= 9.0)
#endif
#ifndef ELK_iOS10
#define ELK_iOS10 (ELKDevSysVersion >= 10.0)
#endif
#ifndef ELK_iOS11
#define ELK_iOS11 (ELKDevSysVersion >= 11.0)
#endif
#ifndef ELK_iOS12
#define ELK_iOS12 (ELKDevSysVersion >= 12.0)
#endif
#ifndef ELK_iOS13
#define ELK_iOS13 (ELKDevSysVersion >= 13.0)
#endif


#pragma mark - App版本号及信息
#ifndef ELK_AppVersion
#define ELK_AppVersion  [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]
#endif
#ifndef ELK_AppName
#define ELK_AppName  [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]]
#endif


#pragma mark - 颜色宏
#ifndef ELK_HexColor
#define ELK_HexColor(colorH,a) [UIColor colorWithRed:((float)((colorH & 0xff0000) >> 16)) / 255.0 green:((float)((colorH & 0x00ff00) >> 8)) / 255.0 blue:((float)(colorH & 0x0000ff)) / 255.0 alpha:a]
#endif

#define ELK_HexColorString(colorString) [UIColor colorWithHexString:colorString]

#pragma mark - 避免循环引用
// 避免循环引用
#ifndef e_weakify
    #define e_weakify(var) __weak typeof(var) ELKWeak_##var = var;
#endif

#ifndef e_strongify
#define e_strongify(var) \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Wshadow\"") \
    __strong typeof(var) var = ELKWeak_##var; \
    _Pragma("clang diagnostic pop")
#endif


#pragma mark - 数据容错
#ifndef stdNumber
    #define chkNumber(oNbr)  ([oNbr isKindOfClass:[NSNumber class]])
    #define stdNumber(oNbr)  (chkNumber(oNbr) ? oNbr : @0)
#endif

#ifndef stdString
    #define chkString(oStr)  ([oStr isKindOfClass:[NSString class]])
    #define stdString(oStr)  (chkString(oStr) ? oStr : @"")
#endif


#pragma mark - 重新定义NSlog
//#ifdef DEBUG
//#define NSLog(format, ...) do {                 \
//        fprintf(stderr, "<%s : %d> %s : ",      \
//        [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
//        __LINE__, __func__);                    \
//        (NSLog)((format), ##__VA_ARGS__);       \
//        fprintf(stderr, "\n");                  \
//    } while(0)
//#endif

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#endif

#pragma mark - 应用商店链接
#ifndef ELK_AppStoreUrl
    #define ELK_AppStoreUrl(apsId)  [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",apsId]
#endif


#ifndef ELK_AlphaNum
#define ELK_AlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
#endif

/// 输入内容校验
#define NUMBERSPERIOD @"0123456789"






#endif /* ELKDefinitionHeader_h */
