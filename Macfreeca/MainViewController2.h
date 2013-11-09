//
//  MainViewController2.h
//  Macfreeca
//
//  Created by Minho Lee on 13. 7. 4..
//  Copyright (c) 2013년 Minho Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface MainViewController2 : NSViewController
{
    NSString *m_strUrl;
    NSString *m_strAdd;
    NSURL *fileUrl;

    
//	AVPlayer *player;
	AVPlayerLayer *playerLayer;
	
	NSProgressIndicator *loadingSpinner;
	NSTextField *unplayableLabel;
	NSTextField *noVideoLabel;
	NSButton *playPauseButton;
	NSButton *fastForwardButton;
	NSButton *rewindButton;
	NSSlider *timeSlider;
	
	id timeObserverToken;
    BOOL isFull;
    BOOL isStreaming;
    NSInteger _playing;
}

@property (retain) NSMutableDictionary *twoFingersTouches;
//@property (retain) AVPlayer *player;
@property (retain) AVQueuePlayer *player;
@property (retain) AVPlayerLayer *playerLayer;
//@property (retain) AVPlayerItem *playerItem;
@property (retain) AVAssetReader *movieReader;
@property (assign) double currentTime;
@property (readonly) double duration;

@property (assign) IBOutlet WebView *m_webView;
@property (assign) IBOutlet NSView *m_movieView;
@property (assign) IBOutlet NSTextField *m_lbStatus;
@property (assign) IBOutlet NSTextField *m_lbStatus2;
@property (assign) IBOutlet NSSlider *m_sliderVolumn;
- (IBAction)goHome:(id)sender;
- (IBAction)setVolume:(id)sender;
- (IBAction)toggleFull:(id)sender;

@end
