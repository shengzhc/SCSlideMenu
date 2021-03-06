//
//  SCSlideMenuViewController.h
//  SlideMenuDemo
//
//  Created by Shengzhe Chen on 3/9/14.
//  Copyright (c) 2014 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSlideMenuViewController : UIViewController

@property (nonatomic, assign) BOOL shouldScaleBackgroundImage;
@property (nonatomic, assign) double backgroundImageScalor;
@property (nonatomic, assign) double contentScalor;

- (id)initWithMenuViewController:(UIViewController *)menuViewController contentViewController:(UIViewController *)contentViewController;
- (void)setBackgroundImage:(UIImage *)image;
- (void)showMenuViewController:(BOOL)animated;
- (void)hideMenuViewController:(BOOL)animated;

@end
