//
//  SCSlideMenuViewController.m
//  SlideMenuDemo
//
//  Created by Shengzhe Chen on 3/9/14.
//  Copyright (c) 2014 Shengzhe Chen. All rights reserved.
//

#import "SCSlideMenuViewController.h"

@interface SCSlideMenuViewController ()
{
    UIViewController *_menuViewController;
    UIViewController *_contentViewController;
}

@end

@implementation SCSlideMenuViewController

- (id)init
{
    if (self = [super init]) {
        [self _initialize];
    }
    
    return self;
}

- (id)initWithMenuViewController:(UIViewController *)menuViewController contentViewController:(UIViewController *)contentViewController
{
    if (self = [super init]) {
        [self _setMenuViewController:menuViewController];
        [self _setContentViewController:contentViewController];
    }
    
    return self;
}

- (void)_initialize
{
}

- (void)_setMenuViewController:(UIViewController *)menuViewController
{
    _menuViewController = menuViewController;
    [self _displayViewController:_menuViewController];
}

- (void)_setContentViewController:(UIViewController *)contentViewController
{
    _contentViewController = contentViewController;
    [self _displayViewController:_contentViewController];
}

- (void)_displayViewController:(UIViewController *)viewController
{
    if (viewController) {
        [self addChildViewController:viewController];
        [self.view addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
    }
}

- (void)_hideViewController:(UIViewController *)viewController
{
    if (viewController) {
        [viewController willMoveToParentViewController:viewController];
        [viewController.view removeFromSuperview];
        [viewController removeFromParentViewController];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

@end
