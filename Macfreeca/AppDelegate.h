//
//  AppDelegate.h
//  Macfreeca
//
//  Created by Minho Lee on 13. 7. 4..
//  Copyright (c) 2013년 Minho Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainViewController2.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet MainViewController2 *vcMain;

@end
