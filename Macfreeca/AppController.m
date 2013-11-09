//
//  AppController.m
//  Macfreeca
//
//  Created by Minho Lee on 13. 7. 4..
//  Copyright (c) 2013년 Minho Lee. All rights reserved.
//

#import "AppController.h"
#import "MainViewController2.h"

@implementation AppController
@synthesize myView, myViewController;

- (void)awakeFromNib {
    self.myViewController = [[MainViewController2 alloc] initWithNibName:@"MainViewController2" bundle:nil];
    [myView addSubview:myViewController.view];
}

@end
