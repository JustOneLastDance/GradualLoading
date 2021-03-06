//
//  GradualLoadingView.h
//  GradualLoading
//
//  Created by JustinChou on 16/9/27.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradualLoadingView : UIView

/**
 初始化方法

 @param frame frame

 @return 实例对象
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 开始动画
 */
- (void)startAnimation;

/**
 停止动画
 */
- (void)stopAnimation;

@end
