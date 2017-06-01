//
//  EventWindowController.m
//  ExpirCalc
//
//  Created by James Enciso on 5/29/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import "EventWindowController.h"


@implementation EventWindowController

@synthesize window;
@synthesize eventWindow;

-(void) windowDidLoad{
	
	NSLog(@"loaddedd");
	[[eventWindow createEventButton] setTitle:@"sss"];

}

-(void) windowWillClose:(NSNotification *)notification{

	[self release];
}

/*
-(void) showWindow:(id)sender{

	NSLog(@"opening..");
	
//	EventWindow *CE = [[EventWindow alloc] init];

	NSWindowController *WC = [[NSWindowController alloc] initWithWindowNibName:@"addevent"];

	
	
//	eventWindow = (EventWindow *) [WC window];
	
	eventWindow = [[EventWindow alloc] init];
	//[self initWithWindowNibName:@"addevent"];
	
	[eventWindow setWindowController:WC];
	//[self showWindow:eventWindow];
	[WC showWindow:WC];
	
	//TODO: fix bug
	//assign instantiated window to this one's even window. For controlling
//	[self setEventWindow:(EventWindow *) [WC window]];
	
	//make window active one
	[eventWindow makeKeyWindow];
	
	//[self setWindow:WC];
	//[self setWindow:CE];
	//[super showWindow:self];
	
}
*/


-(void)OpenEventWindowWithDataFromIndex:(NSInteger)index{
	

	NSWindowController *WC = [[NSWindowController alloc] initWithWindowNibName:@"addevent"];
		
	eventWindow = [WC window];
	
	
	[eventWindow setTitle:@"Edit Event"];
	[[eventWindow createEventButton] setTitle:@"Save"];
		
	
	[WC showWindow:[WC window]];
	[eventWindow makeKeyWindow];


	

//	[eventWindow setInEditMode:YES];
	//TODO: fix
	[eventWindow SetEditModeForIndex:index];

	NSLog(@"indexxxx %i",index);
 

	NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:[DataController GetDictionaryDataAtIndex:index]];
	
	_Entry *e = [[_Entry alloc] init];
	[e getConstructedDeserializedObjectFromDictionary:dic];

	[eventWindow PopulateDataFromEntry:e];
//	NSLog(@"SS %@", [e _eventtitle]);
	
//	[[eventWindow eventNameField] setStringValue:[e _eventtitle]];
//	[[eventWindow eventDateField] setDateValue:[e _eventdate]];
	
}



@end
