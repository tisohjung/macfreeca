//
//  ViewMovie.h
//  Macfreeca
//
//  Created by Minho Lee on 13. 7. 8..
//  Copyright (c) 2013년 Minho Lee. All rights reserved.
//
#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewMovie : NSView
{
   
}

@property (retain) NSMutableDictionary *twoFingersTouches;
@property (assign) IBOutlet NSSlider *m_sliderVolume;

@end
