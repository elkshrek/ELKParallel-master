//
//  UIImage+ELKOriSensitive.h
//  ELKHTTPRequest
//
//  Created by Jonathan on 2019/5/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ELKOriSensitive)


- (UIImage *)fixOrientation;



+ (UIImage *)imageWithColor:(UIColor *)iColor;

/// 根据视频url 获取第一帧图片
+ (UIImage*)getFirstFrameImageWithUrl:(NSString*)videoURL;

/// 根据本地视频路径 获取第一帧图片
+ (UIImage *)getFirstFrameImageWithfilePath:(NSString *)filePath;




@end

NS_ASSUME_NONNULL_END
