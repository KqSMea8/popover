//
//  PopoverDisplayViewController.m
//  UICategories
//
//  Created by xiekw on 11/14/14.
//  Copyright (c) 2014 xiekw. All rights reserved.
//

#import "PopoverDisplayViewController.h"
#import "DXPopover.h"

static CGFloat randomFloatBetweenLowAndHigh(CGFloat low, CGFloat high) {
    CGFloat diff = high - low;
    return (((CGFloat)rand() / RAND_MAX) * diff) + low;
}

@interface PopoverDisplayViewController ()<UITableViewDataSource, UITableViewDelegate> {
    CGFloat _popoverWidth;
    CGSize _popoverArrowSize;
    CGFloat _popoverCornerRadius;
    CGFloat _animationIn;
    CGFloat _animationOut;
    BOOL _animationSpring;
}

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIButton *downBtn;

@property (nonatomic, strong) UIView *showView;
@property (nonatomic, strong) DXPopover *popover;

@end

@implementation PopoverDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarItem.title = @"Configs";
    self.view.backgroundColor = [UIColor grayColor];


    

    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setTitle:@"Hello" forState:UIControlStateNormal];
    self.btn.frame = CGRectMake(200, 100, 100, 100);
    [self.view addSubview:self.btn];
    [self.btn addTarget:self
                  action:@selector(showPopover)
        forControlEvents:UIControlEventTouchUpInside];
    [self.btn setBackgroundColor:[UIColor cyanColor]];

    

    _showView = [[UIView alloc] init];
    _showView.frame = CGRectMake(0, 0, _popoverWidth, 350);


    [self resetPopover];

   
}

- (void)resetPopover {
    self.popover = [DXPopover new];
    _popoverWidth = 280.0;
}



- (void)showPopover {
    [self updateTableViewFrame];

    CGPoint startPoint =
        CGPointMake(CGRectGetMidX(self.btn.frame), CGRectGetMaxY(self.btn.frame) + 5);
    [self.popover showAtPoint:startPoint
               popoverPostion:DXPopoverPositionDown
              withContentView:self.showView
                       inView:self.tabBarController.view];


}



- (void)updateTableViewFrame {
    CGRect tableViewFrame = self.showView.frame;
    tableViewFrame.size.width = _popoverWidth;
    self.showView.frame = tableViewFrame;
    self.popover.contentInset = UIEdgeInsetsZero;
    self.popover.backgroundColor = [UIColor whiteColor];
}




@end
