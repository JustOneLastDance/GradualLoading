//
//  GradualLoadingView.m
//  GradualLoading
//
//  Created by JustinChou on 16/9/27.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "GradualLoadingView.h"

@interface GradualLoadingView ()

@property (nonatomic, strong) NSMutableArray *alphaArray;
@property (nonatomic, strong) NSMutableArray *sqaureArray;

@property (nonatomic, weak) NSTimer *loadingTimer;

@end

@implementation GradualLoadingView

- (NSMutableArray *)sqaureArray {
    if (_sqaureArray == nil) {
        _sqaureArray = [[NSMutableArray alloc] init];
    }
    return _sqaureArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.alphaArray = [[NSMutableArray alloc] initWithObjects:@0.125, @0.25, @0.375, @0.5, @0.625, @0.750, @0.875, @1.000, nil];
        [self pxy_setupUI];
    }
    return self;
}

#pragma mark - about Timer
- (void)startAnimation {
    self.loadingTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(gradualLoading_animation) userInfo:nil repeats:true];
    [[NSRunLoop currentRunLoop] addTimer:self.loadingTimer forMode:NSRunLoopCommonModes];
}

- (void)stopAnimation {
    [self.loadingTimer invalidate];
    self.loadingTimer = nil;
}

/**
 渐变加载动画
 */
- (void)gradualLoading_animation {
    
    for (int i = 0; i < self.alphaArray.count; i ++) {
        UIView *view = self.sqaureArray[i];
        NSNumber *num = self.alphaArray[i];
        CGFloat alphaValue = [num floatValue];
        [view setAlpha:alphaValue];
    }
    
    [self pxy_reSortArray];
}

/**
 数组元素依次向右移一位
 */
- (void)pxy_reSortArray {
    
    NSNumber *temp = self.alphaArray[self.alphaArray.count - 1];
    
    for (int i = (int)(self.alphaArray.count - 1); i > 0; i--) {
        self.alphaArray[i] = self.alphaArray[i - 1];
    }
    self.alphaArray[0] = temp;
}

#pragma mark - private function
- (void)pxy_setupUI {
    
    CGFloat margin = 5;
    CGFloat width = (self.frame.size.width - 9 * margin) / 8;
    CGFloat height = width;
    CGFloat squareView_y = (self.frame.size.height - height) * 0.5;
    
    for (int i = 0; i < 8; i ++) {
        UIView *squareView = [[UIView alloc] initWithFrame:CGRectMake(margin + (margin + width) * i, squareView_y, width, height)];
        squareView.backgroundColor = [UIColor grayColor];
        NSNumber *alphaValue = self.alphaArray[i];
        squareView.alpha = [alphaValue floatValue];
        [self addSubview:squareView];
        [self.sqaureArray addObject:squareView];
    }
    
}

@end
