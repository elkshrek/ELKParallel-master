//
//  UIScrollView+ELKLoadMore.m
//  ELKParallel
//
//  Created by Jonathan on 2019/5/16.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UIScrollView+ELKLoadMore.h"
#import <objc/runtime.h>


static const char *elkLoadStateKey = "elkLoadState";
static const char *elkRefreshBlockKey  = "elkRefreshBlock";
static const char *elkLoadMoreBlockKey = "elkLoadMoreBlock";
static const char *elkContScrollBlockKey = "elkContScrollBlock";


@interface UIScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSNumber *elkLoadState;

@property (nonatomic, copy) ELKRefreshBlock elkRefreshBlock;

@property (nonatomic, copy) ElKLoadMoreBlock elkLoadMoreBlock;

@property (nonatomic, copy) ELKContentScrollBlock elkContScrollBlock;


@end

@implementation UIScrollView (ELKLoadMore)


/**
 下拉刷新
 
 @param block 刷新事件
 */
- (void)elk_refreshDataWithBlock:(ELKRefreshBlock)block
{
    [self elk_addRefreshEvent:block];
}

/**
 上拉加载
 
 @param block 加载事件
 */
- (void)elk_autoLoadMoreWithBlock:(ElKLoadMoreBlock)block
{
    [self elk_addLoadEvent:block];
}

/**
 查看content滑动情况
 
 @param block 滑动信息
 */
- (void)elk_contentScrollDirection:(ELKContentScrollBlock)block
{
    [self elk_addContScrollEvent:block];
}

- (void)elk_addRefreshEvent:(ELKRefreshBlock)block
{
    self.elkLoadState = @(ELKLoadStateIdle);
    self.elkRefreshBlock = block;
    
    if (!self.elkLoadMoreBlock && !self.elkContScrollBlock) {
        [self elk_addObserverContentOffset];
    }
}

- (void)elk_addLoadEvent:(ElKLoadMoreBlock)block
{
    self.elkLoadState = @(ELKLoadStateIdle);
    self.elkLoadMoreBlock = block;
    
    if (!self.elkRefreshBlock && !self.elkContScrollBlock) {
        [self elk_addObserverContentOffset];
    }
}

- (void)elk_addContScrollEvent:(ELKContentScrollBlock)block
{
    self.elkLoadState = @(ELKLoadStateIdle);
    self.elkContScrollBlock = block;
    
    if (!self.elkRefreshBlock && !self.elkLoadMoreBlock) {
        [self elk_addObserverContentOffset];
    }
}

- (void)elk_addObserverContentOffset
{
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint newPoint = [[change valueForKey:NSKeyValueChangeNewKey] CGPointValue];
        CGPoint oldPoint = [[change valueForKey:NSKeyValueChangeOldKey] CGPointValue];
        if (self.elkContScrollBlock) {
            ELKScrollDirection scrollDirection = ELKScrollUpping;
            if (newPoint.y < oldPoint.y) {
                scrollDirection = ELKScrollDowning;
            }
            self.elkContScrollBlock(newPoint.y, scrollDirection);
        }
        if (![self.elkLoadState isEqualToNumber:@(ELKLoadStateIdle)]) {
            return;
        }
        if (newPoint.y < 0) {
            if (self.elkRefreshBlock) {
                self.elkLoadState = @(ELKLoadStateRefresh);
                self.elkRefreshBlock();
            }
        } else if (newPoint.y > oldPoint.y) {
            if (self.contentOffset.y + self.bounds.size.height >= self.contentSize.height) {
                if (self.elkLoadMoreBlock) {
                    self.elkLoadState = @(ELKLoadStateLoadMore);
                    self.elkLoadMoreBlock();
                }
            }
        }
    }
    
}

/**
 停止刷新/加载
 */
- (void)elk_endLoading
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.elkLoadState = @(ELKLoadStateIdle);
    });
}

/**
 手动调用来触发一次刷新 (只有闲置状态才会生效)
 */
- (void)elk_beginRefresh
{
    if (![self.elkLoadState isEqualToNumber:@(ELKLoadStateIdle)]) {
        return;
    }
    if (self.elkRefreshBlock) {
        self.elkLoadState = @(ELKLoadStateRefresh);
        self.elkRefreshBlock();
    }
}

- (void)setElkLoadState:(NSNumber *)elkLoadState
{
    objc_setAssociatedObject(self, elkLoadStateKey, elkLoadState, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)elkLoadState
{
    return objc_getAssociatedObject(self, elkLoadStateKey);
}
- (void)setElkRefreshBlock:(ELKRefreshBlock)elkRefreshBlock
{
    objc_setAssociatedObject(self, elkRefreshBlockKey, elkRefreshBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (ELKRefreshBlock)elkRefreshBlock
{
    return objc_getAssociatedObject(self, elkRefreshBlockKey);
}
- (void)setElkLoadMoreBlock:(ElKLoadMoreBlock)elkLoadMoreBlock
{
    objc_setAssociatedObject(self, elkLoadMoreBlockKey, elkLoadMoreBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (ElKLoadMoreBlock)elkLoadMoreBlock
{
    return objc_getAssociatedObject(self, elkLoadMoreBlockKey);
}

- (void)setElkContScrollBlock:(ELKContentScrollBlock)elkContScrollBlock
{
    objc_setAssociatedObject(self, elkContScrollBlockKey, elkContScrollBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ELKContentScrollBlock)elkContScrollBlock
{
    return objc_getAssociatedObject(self, elkContScrollBlockKey);
}

- (void)dealloc
{
    //    [self removeObserver:self forKeyPath:@"contentOffset"];
}

@end
