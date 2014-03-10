//
//  SCMenuViewController.m
//  SlideMenuDemo
//
//  Created by Shengzhe Chen on 3/9/14.
//  Copyright (c) 2014 Shengzhe Chen. All rights reserved.
//

#import "SCMenuViewController.h"

@interface SCMenuViewController ()
{
    UIImageView *_backgroundImageView;
}
@end

@implementation SCMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mac-space.jpg"]];
    [self.view addSubview:_backgroundImageView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _backgroundImageView.frame = self.view.bounds;
}


@end
