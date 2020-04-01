//
//  UIView+ELKGestureEvent.h
//  ELKParallel
//
//  Created by wing on 2020/1/3.
//  Copyright © 2020 wing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ELKGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (ELKGestureEvent)


/// 添加手势事件
- (void)elk_addTapGestWithBlock:(ELKGestureActionBlock)block;
- (void)elk_addLongPressGestWithBlock:(ELKGestureActionBlock)block;


@end

NS_ASSUME_NONNULL_END
