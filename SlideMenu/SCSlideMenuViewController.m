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
    UIImageView *_backgroundImageView;
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

#pragma private methods
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
    _backgroundImageView = [[UIImageView alloc] initWithImage:nil];
    [self.view addSubview:_backgroundImageView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _backgroundImageView.frame = self.view.bounds;
}

- (id)initWithMenuViewController:(UIViewController *)menuViewController contentViewController:(UIViewController *)contentViewController
{
    if (self = [super init]) {
        [self _setMenuViewController:menuViewController];
        [self _setContentViewController:contentViewController];
    }
    
    return self;
}

- (void)setBackgroundImage:(UIImage *)image
{
    _backgroundImageView.image = image;
    CGPoint center = _backgroundImageView.center;
    CGAffineTransform transform = _backgroundImageView.transform;
    _backgroundImageView.transform = CGAffineTransformIdentity;
    _backgroundImageView.frame = self.view.bounds;
    _backgroundImageView.image = image;
    _backgroundImageView.transform = transform;
    _backgroundImageView.center = center;
}

- (void)showMenuViewController
{
    
}

- (void)hideMenuViewController
{
    
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

@end
