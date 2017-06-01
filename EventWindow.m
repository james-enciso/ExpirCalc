//
//  AddEventWindowController.m
//  ExpirCalc
//
//  Created by James Enciso on 5/27/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import "EventWindow.h"


@implementation EventWindow


@synthesize eventNameField,
eventDateField,
eventDescriptionField,
createEventButton,
cancelEventButton;


@synthesize  InEditMode;
@synthesize  EditIndex;



-(void) awakeFromNib{
		
	InEditMode = FALSE;
	EditIndex = -1;
	
	
	if (InEditMode == NO) {
		[eventDateField setDateValue:[NSDate dateWithTimeIntervalSinceNow:0]];
	}

}

-(void)SetEditModeForIndex:(NSInteger)index{

	InEditMode = TRUE;
	EditIndex = index;
	
	NSLog(@"edit mode for index: %i", index);
}


-(IBAction)cancelEvent:(id)sender{

	[self close];
	
}

-(IBAction)setDateToNow:(id)sender{

	[eventDateField setDateValue:[NSDate dateWithTimeIntervalSinceNow:0]];	
}


-(IBAction)createEvent:(id)sender{

	_Entry *dataEntry = [[_Entry alloc] init];
	[dataEntry set_eventdate:[eventDateField dateValue]];
	[dataEntry set_eventtitle:[eventNameField stringValue]];
	[dataEntry set_eventdescription:[eventDescriptionField stringValue]];
	
	NSLog(@"save button clicked");
	
	
	if ((InEditMode) && (EditIndex >= 0)) {
		NSLog(@"saved event changes");
		
		[DataController UpdateEntryAtIndex:EditIndex WithEntry:dataEntry];
		
		
	}else {
		
		NSLog(@"created new event");
	
		[DataController AddEntry:dataEntry];
	
	}
	//close window afterwards
	[self close];
	
}

-(void)PopulateDataFromEntry:(_Entry *)entry{

	[eventDateField setDateValue:[entry _eventdate]];
	[eventNameField setStringValue:[entry _eventtitle]];
	[eventDescriptionField setStringValue:[entry _eventdescription]];

}


@end
