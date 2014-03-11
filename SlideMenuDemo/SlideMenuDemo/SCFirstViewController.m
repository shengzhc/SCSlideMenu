//
//  SCFirstViewController.m
//  SlideMenuDemo
//
//  Created by Shengzhe Chen on 3/9/14.
//  Copyright (c) 2014 Shengzhe Chen. All rights reserved.
//

#import "SCSlideMenuViewController.h"
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
    self.navigationItem.leftBarButtonItem = ({
        UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(menuButtonClicked:)];
        menuBarButtonItem;
    });
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _backgroundImageView.frame = self.view.bounds;
}

- (void)menuButtonClicked:(id)sender
{
    UIViewController *parent = self.parentViewController;
    while (parent) {
        if ([parent isKindOfClass:[SCSlideMenuViewController class]]) {
            [(SCSlideMenuViewController *)parent showMenuViewController:YES];
            break;
        }
        parent = parent.parentViewController;
    }
}

@end
