//
//  MainViewController2.h
//  Macfreeca
//
//  Created by Minho Lee on 13. 7. 4..
//  Copyright (c) 2013년 Minho Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface MainViewController2 : NSViewController
{
    NSString *m_strUrl;
    NSString *m_strAdd;
    NSURL *fileUrl;

}

@property (assign) IBOutlet WebView *m_webView;
@property (assign) IBOutlet NSTextField *m_lbStatus;
- (IBAction)goHome:(id)sender;

@end
