//
//  ViewMovie.m
//  Macfreeca
//
//  Created by Minho Lee on 13. 7. 8..
//  Copyright (c) 2013년 Minho Lee. All rights reserved.
//

#import "ViewMovie.h"

@implementation ViewMovie

@synthesize twoFingersTouches, m_sliderVolume;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}

- (void)awakeFromNib {
	[[self layer] setBackgroundColor:CGColorGetConstantColor(kCGColorBlack)];
	// Create the AVPlayer, add rate and status observers
}

#pragma mark -

- (BOOL)acceptsFirstResponder
{
    return YES;
}
- (void)keyDown:(NSEvent *)theEvent
{
    NSLog(@"key down");
}

- (BOOL)wantsScrollEventsForSwipeTrackingOnAxis:(NSEventGestureAxis)axis
{
    return axis == NSEventGestureAxisVertical;
}

- (void)scrollWheel:(NSEvent *)event
{
//    소리 조절을 위한 스크롤 받기
    CGFloat y = [event deltaY];
    
    [m_sliderVolume setDoubleValue:m_sliderVolume.doubleValue+y];
    [m_sliderVolume performClick:nil];
}

@end
