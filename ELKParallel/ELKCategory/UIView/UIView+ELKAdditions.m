//
//  UIView+ELKAdditions.m
//  ELKParallel
//
//  Created by wing on 2020/1/3.
//  Copyright © 2020 wing. All rights reserved.
//

#import "UIView+ELKAdditions.h"
#import "ELKNormalColorHeader.h"
#import <Masonry.h>

@implementation UIView (ELKAdditions)

#pragma mark - 添加阴影边框
- (void)elk_addShadowColor:(UIColor *)shadowColor offSet:(CGSize)offset opacity:(CGFloat)opacity
{
    [self elk_addShadowColor:shadowColor offSet:offset opacity:opacity shadowRadius:3.f];
}
- (void)elk_addShadowColor:(UIColor *)shadowColor offSet:(CGSize)offset opacity:(CGFloat)opacity shadowRadius:(CGFloat)radius
{
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
}


/// 添加弥散投影
- (void)elk_makeDiffShadow
{
    UIColor *shadowColor = ELKParaThemeColor;
    CGSize offset = CGSizeMake(1.f, 5.f);
    CGFloat opacity = 0.15f;
    CGFloat radius = 5.f;
    
    [self elk_makeDiffShadow:shadowColor offSet:offset opacity:opacity shadowRadius:radius];
}
- (void)elk_makeDiffShadow:(UIColor *)shadowColor offSet:(CGSize)offset opacity:(CGFloat)opacity shadowRadius:(CGFloat)radius
{
    UIView *diffView = [[UIView alloc] init];
    diffView.backgroundColor = self.backgroundColor;
    diffView.layer.cornerRadius = self.layer.cornerRadius;
    diffView.layer.borderColor = self.layer.borderColor;
    diffView.layer.borderWidth = self.layer.borderWidth;
    diffView.layer.masksToBounds = self.layer.masksToBounds;
    
    [self addSubview:diffView];
    [self insertSubview:diffView atIndex:0];
    self.layer.masksToBounds = NO;
    self.backgroundColor = UIColor.clearColor;
    
    [diffView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self elk_addShadowColor:shadowColor offSet:offset opacity:opacity shadowRadius:radius];
}




/// 绘制虚线
/// @param lineLength  虚线的宽度
/// @param lineSpacing 虚线的间距
/// @param lineColor   虚线的颜色
- (void)elk_drawVerticalDashLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame)/2.f, CGRectGetHeight(self.frame)/2.f)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:lineColor.CGColor];
    [shapeLayer setLineWidth:CGRectGetWidth(self.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    // 设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,0, CGRectGetHeight(self.frame));
    [shapeLayer setPath:path];
    CGPathRelease(path);
    // 把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];
}




@end
