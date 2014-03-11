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
    UIButton *_contentButton;
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
    _shouldScaleBackgroundImage = YES;
    _backgroundImageScalor = 1.5f;
    _contentScalor = 0.5f;
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

- (void)_contentButtonClicked:(UIButton *)sender
{
    [self hideMenuViewController:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mac-space.jpg"]];
    [self.view addSubview:_backgroundImageView];
    _contentButton = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(_contentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundColor:[UIColor clearColor]];
        btn;
    });
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _backgroundImageView.frame = self.view.bounds;
}

- (id)initWithMenuViewController:(UIViewController *)menuViewController contentViewController:(UIViewController *)contentViewController
{
    if (self = [self init]) {
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

- (void)showMenuViewController:(BOOL)animated
{
    _backgroundImageView.transform = CGAffineTransformIdentity;
    _backgroundImageView.frame = self.view.bounds;

    _contentButton.frame = _contentViewController.view.frame;
    [_contentViewController.view addSubview:_contentButton];
    
    void (^transform)(void) = ^{
        if (_shouldScaleBackgroundImage) {
            _backgroundImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, _backgroundImageScalor, _backgroundImageScalor);
        }
        double contentXScalor = self.contentScalor;
        double contentYScalor = self.view.bounds.size.height / self.view.bounds.size.width * contentXScalor;
        _contentViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, contentXScalor, contentYScalor);
        _contentViewController.view.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height/2.0f);
    };

    if (animated) {
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        [UIView animateWithDuration:1.0f
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             transform();
                         } completion:^(BOOL finished) {
                             [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                         }];
    } else {
        transform();
    }
}

- (void)hideMenuViewController:(BOOL)animated
{
    void(^transform)(void) = ^{
        _backgroundImageView.transform = CGAffineTransformIdentity;
        _backgroundImageView.frame = self.view.bounds;
        _contentViewController.view.transform = CGAffineTransformIdentity;
        _contentViewController.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    };
    
    if (animated) {
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        [UIView animateWithDuration:1.0f
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             transform();
                         } completion:^(BOOL finished) {
                             [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                             [_contentButton removeFromSuperview];
                         }];
    } else {
        transform();
    }
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

@end
