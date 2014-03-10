//
//  SCFirstViewController.m
//  SlideMenuDemo
//
//  Created by Shengzhe Chen on 3/9/14.
//  Copyright (c) 2014 Shengzhe Chen. All rights reserved.
//

#import "SCFirstViewController.h"

@interface SCFirstViewController ()
{
    UIImageView *_backgroundImageView;;
}
@end

@implementation SCFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mac-green.png"]];
    [self.view addSubview:_backgroundImageView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _backgroundImageView.frame = self.view.bounds;
    _backgroundImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5f, 1.5f);
    NSLog(@"%@", NSStringFromCGPoint(_backgroundImageView.center));
    NSLog(@"%@", _backgroundImageView);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
