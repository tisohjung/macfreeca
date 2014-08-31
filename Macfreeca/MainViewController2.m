//
//  MainViewController2.m
//  Macfreeca
//
//  Created by Minho Lee on 13. 7. 4..
//  Copyright (c) 2013년 Minho Lee. All rights reserved.
//

#import "MainViewController2.h"
#define LOGMODE 1

@interface MainViewController2 ()

@end

@implementation MainViewController2

@synthesize m_lbStatus, m_webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }

    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"AppleEnableSwipeNavigateWithScrolls"];
    
    [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskSwipe handler:^(NSEvent *event) {
        if ([event deltaX] == 1.0) { //LEFT SWIPE
//            NSLog(@"left");
        } else if ([event deltaX] == -1.0) { //RIGHT SWIPE
//            NSLog(@"righ");
        }
        return event;
    }];
    
    
    m_strUrl = @"http://istream.m.afreeca.com/stream/route/";
    m_strUrl = @"http://m.afreeca.com/live/stream/a/hls/broad_no/";
    m_strUrl = @"http://chromecast.afreeca.gscdn.com/livestream-10/";
//    m_strUrl = @"http://123.111.232.16/bts/";
    return self;
}

- (void)awakeFromNib {
    [m_lbStatus setStringValue:@"Hello"];
    
    NSString *test = @"http://m.afreeca.com/";
    
    [m_webView setMainFrameURL:test];
    [m_webView setUIDelegate:self];
    [m_webView setFrameLoadDelegate:self];
}
- (void)webView:(WebView *)sender didStartProvisionalLoadForFrame:(WebFrame *)frame
{
    [m_lbStatus setStringValue:@"로딩"];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    [m_lbStatus setStringValue:@"완료"];
}

- (void)webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowObject forFrame:(WebFrame *)frame
{
//    NSLog(@"javascript");
}

- (void)webView:(WebView *)sender didCommitLoadForFrame:(WebFrame *)frame
{
//    NSLog(@"java2");
}
- (void)webView:(WebView *)sender mouseDidMoveOverElement:(NSDictionary *)elementInformation modifierFlags:(NSUInteger)modifierFlags
{
//    NSLog(@"%@", elementInformation);
    NSString *i_addString = [[elementInformation objectForKey:@"WebElementImageURL"] absoluteString];
//    NSLog(@"%@", i_addString);
    if ([i_addString hasPrefix:@"http://liveimg"]) {
        i_addString = [i_addString stringByReplacingOccurrencesOfString:@"http://liveimg.afreeca.co.kr" withString:@""];
        i_addString = [[i_addString componentsSeparatedByString:@"/"] lastObject];
        i_addString = [[i_addString componentsSeparatedByString:@"."] objectAtIndex:0];
//        i_addString = [i_addString stringByReplacingOccurrencesOfString:@")" withString:@""];
        i_addString = [i_addString stringByAppendingString:@"-mobile-hd-hls/playlist.m3u8"];
        //        ?fr=w 뒤에 붙는 조건문, 그냥 없어도 됨
//        NSLog(@"%@", i_addString);
        
        
        m_strAdd = [[NSString alloc] initWithString:i_addString];
        //        NSLog(@"%@", m_strAdd);
    }
    
//    NSString *i_addString = [[elementInformation objectForKey:@"WebElementLinkURL"] absoluteString];
////    NSLog(@"%@", i_addString);
//    if ([i_addString hasPrefix:@"javascript:afPlay("]) {
//        i_addString = [i_addString stringByReplacingOccurrencesOfString:@"javascript:afPlay(" withString:@""];
//        i_addString = [[i_addString componentsSeparatedByString:@","] objectAtIndex:0];
//        i_addString = [i_addString stringByReplacingOccurrencesOfString:@")" withString:@""];
//        //        i_addString = [i_addString stringByAppendingString:@".m3u8?fr=w"];
//        //        ?fr=w 뒤에 붙는 조건문, 그냥 없어도 됨
//        m_strAdd = [[NSString alloc] initWithString:i_addString];
//        //        NSLog(@"%@", m_strAdd);
//    }
}
- (void)webView:(WebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame
{
    //    NSURL *fileUrl = [NSURL URLWithString:@"http://123.111.232.12/bts/data/44952413.m3u8"];
//    m_strAdd = [m_strAdd stringByAppendingString:@".m3u8"];
    fileUrl = [NSURL URLWithString:[m_strUrl stringByAppendingString:m_strAdd]];
    // afreeca url
//    NSLog(@"%@", fileUrl);
 
    // movie play
    
	// Create an asset with our URL, asychronously load its tracks, its duration, and whether it's playable or protected.
	// When that loading is complete, configure a player to play the asset.
//    [self close];
    
    [self runCommand:[NSString stringWithFormat:@"%@", [fileUrl absoluteString]]];
}

- (void)runCommand:(NSString*)commandToRun
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/Applications/VLC.app/Contents/MacOS/VLC"];
    
    NSArray *arguments = [NSArray arrayWithObjects:
                          @"-L" ,
                          [NSString stringWithFormat:@"%@", commandToRun],
                          nil];
//    NSLog(@"run command: %@",commandToRun);
    [task setArguments: arguments];
    
//    NSPipe *pipe;
//    pipe = [NSPipe pipe];
//    [task setStandardOutput: pipe];
//
//    NSFileHandle *file;
//    file = [pipe fileHandleForReading];
    
    [task launch];
//    
//    NSData *data;
//    data = [file readDataToEndOfFile];
//    
//    NSString *output;
//    output = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
//    NSLog(@"%@", output);
//    return output;
}
- (IBAction)goHome:(id)sender {
//    [self close];
    [m_webView setMainFrameURL:@"http://m.afreeca.com/main.php"];
}

@end
