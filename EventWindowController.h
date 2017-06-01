//
//  EventWindowController.h
//  ExpirCalc
//
//  Created by James Enciso on 5/29/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "EventWindow.h"
/*
 This class controls and overrides the behaviour of a single event window
 
 How to use
 instantiate this
 
 
 */



@interface EventWindowController : NSWindowController <NSWindowDelegate> {

	NSWindow *window;
	EventWindow *eventWindow;
	
	
}
@property (nonatomic, retain) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet EventWindow *eventWindow;

-(void)OpenEventWindowWithDataFromIndex:(NSInteger)index;

@end
