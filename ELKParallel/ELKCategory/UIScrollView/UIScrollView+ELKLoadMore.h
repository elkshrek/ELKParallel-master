//
//  UIScrollView+ELKLoadMore.h
//  ELKParallel
//
//  Created by Jonathan on 2019/5/16.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ELKLoadState) {
    ELKLoadStateIdle       = 1,// 闲置
    ELKLoadStateRefresh    = 2,// 刷新数据
    ELKLoadStateLoadMore   = 3,// 加载更多
};

typedef NS_OPTIONS(NSUInteger, ELKScrollDirection) {
    ELKScrollUpping        = 1 << 0, // 向上滑动中
    ELKScrollDowning       = 1 << 1, // 向下滑动中
};

// 上拉加载回调
typedef void(^ElKLoadMoreBlock)(void);
// 下拉刷新回调
typedef void(^ELKRefreshBlock)(void);
// content滑动回调
typedef void(^ELKContentScrollBlock)(CGFloat offsetY, ELKScrollDirection direction);


NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (ELKLoadMore)

@property (nonatomic, strong, readonly) NSNumber *elkLoadState;


/**
 下拉刷新

 @param block 刷新事件
 */
- (void)elk_refreshDataWithBlock:(ELKRefreshBlock)block;


/**
 上拉加载

 @param block 加载事件
 */
- (void)elk_autoLoadMoreWithBlock:(ElKLoadMoreBlock)block;


/**
 查看content滑动情况

 @param block 滑动信息
 */
- (void)elk_contentScrollDirection:(ELKContentScrollBlock)block;


/**
 停止刷新/加载
 */
- (void)elk_endLoading;


/**
 手动调用来触发一次刷新 (只有闲置状态才会生效)
 */
- (void)elk_beginRefresh;




@end

NS_ASSUME_NONNULL_END

