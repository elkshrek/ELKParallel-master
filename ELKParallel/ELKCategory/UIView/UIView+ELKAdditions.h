//
//  UIView+ELKAdditions.h
//  ELKParallel
//
//  Created by wing on 2020/1/3.
//  Copyright © 2020 wing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ELKAdditions)


#pragma mark - 添加阴影边框
- (void)elk_addShadowColor:(UIColor *)shadowColor offSet:(CGSize)offset opacity:(CGFloat)opacity;
- (void)elk_addShadowColor:(UIColor *)shadowColor offSet:(CGSize)offset opacity:(CGFloat)opacity shadowRadius:(CGFloat)radius;


/// 添加弥散投影 view的属性设置完成之后再调用方法
- (void)elk_makeDiffShadow;
/// 添加弥散投影 view的属性设置完成之后再调用方法
- (void)elk_makeDiffShadow:(UIColor *)shadowColor offSet:(CGSize)offset opacity:(CGFloat)opacity shadowRadius:(CGFloat)radius;




/// 绘制虚线
/// @param lineLength  虚线的宽度
/// @param lineSpacing 虚线的间距
/// @param lineColor   虚线的颜色
- (void)elk_drawVerticalDashLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;




@end

NS_ASSUME_NONNULL_END
