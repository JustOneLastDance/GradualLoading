//
//  ViewController.m
//  GradualLoading
//
//  Created by JustinChou on 16/9/27.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "ViewController.h"
#import "GradualLoadingView.h"

@interface ViewController ()

@property (nonatomic, strong) GradualLoadingView *loadingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    GradualLoadingView *loadingView = [[GradualLoadingView alloc] initWithFrame:CGRectMake(10, 50, 200, 20)];
    self.loadingView = loadingView;
    [self.view addSubview:loadingView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch begin!!");
    [self.loadingView startAnimation];
}


@end
