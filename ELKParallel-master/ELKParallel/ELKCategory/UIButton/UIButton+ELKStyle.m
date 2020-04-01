//
//  UIButton+ELKStyle.m
//  StarDreamiOS
//
//  Created by wx on 2019/8/16.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UIButton+ELKStyle.h"
#import "UIView+ELKAdditions.h"

@implementation UIButton (ELKStyle)


/**
 *  获取一个新创建的button
 *
 */
+ (UIButton*)buttonWithTitle:(NSString*)title
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color Withlayer:(BOOL)islayer
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    btn.delayInterval=1;
    if (imgname.length)
    {
        [btn setImage:[UIImage imageNamed:imgname]
             forState:UIControlStateNormal];
    }else{
        [btn setBackgroundColor:color];
    }
    if (islayer)
    {
        btn.layer.cornerRadius = 5;
    }
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    return btn;
}

+ (UIButton*)buttonWithTitle:(NSString*)title
              withTitleColor:(UIColor*)tcolor
                    withSize:(CGFloat)size
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color{
    
    UIButton *btn  = [UIButton buttonWithTitle:title withImageName:imgname withBGColor:color Withlayer:NO];
    
    ;
    if (tcolor) {
        [btn setTitleColor:tcolor forState:UIControlStateNormal];
    }
    if (size)
    {
        [btn.titleLabel setFont:[UIFont systemFontOfSize:size]];
    }
    else
    {
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    
    return btn;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame  withTitle:(NSString*)title withTitleColor:(UIColor*)tcolor  withSize:(CGFloat)size image:(UIImage *)image target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:0];
    btn.frame = frame;
    if (image) {
        [btn setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [btn setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (tcolor) {
        [btn setTitleColor:tcolor forState:UIControlStateNormal];
    }
    if (size) {
        [btn.titleLabel setFont:[UIFont systemFontOfSize:size]];
    }
    [btn setTitle:title forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor clearColor];
    //    btn.delayInterval=1;
    return btn;
}

/**
 获取一个新创建的button,frame
 */
+ (UIButton*)buttonWithFrame:(CGRect)frame withTitle:(NSString*)title
              withTitleColor:(UIColor*)tcolor
                    withSize:(CGFloat)size
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color
{
    UIButton *btn  = [UIButton buttonWithTitle:title withImageName:imgname withBGColor:color Withlayer:NO];
    btn.frame=frame;
    //    btn.delayInterval=1;
    if (tcolor) {
        [btn setTitleColor:tcolor forState:UIControlStateNormal];
    }
    if (size) {
        [btn.titleLabel setFont:[UIFont systemFontOfSize:size]];
    }
    
    return btn;
}
/**
 *  弧度button，半径为高度一半
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)color cornerRadius:(CGFloat)radius target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = frame;
    //    btn.delayInterval=1;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius =radius;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = color;
    return btn;
}

/**
 *  设置是否禁用
 *
 */
- (void)setDisabled:(BOOL)b{
    if (NO == b) {
        self.enabled = YES;
        self.backgroundColor =  [UIColor lightGrayColor];
    }else{
        self.enabled = NO;
        self.backgroundColor =[UIColor colorWithRed:0.71f green:0.71f blue:0.71f alpha:1.00f];
    }
}

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ELKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case ELKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case ELKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case ELKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case ELKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithMoreEdgeInsetsStyle:(ELKButtonEdgeInsetsStyle)style
                            imageTitleSpace:(CGFloat)space
{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width>self.frame.size.width?self.frame.size.width:self.titleLabel.intrinsicContentSize.width;
        labelWidth = self.titleLabel.intrinsicContentSize.width>self.frame.size.width ?labelWidth - imageWith :labelWidth;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width>self.frame.size.width?self.frame.size.width:self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
        NSLog(@"===%f",self.frame.size.width);
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case ELKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case ELKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case ELKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case ELKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}


@end
