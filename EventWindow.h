//
//  AddEventWindowController.h
//  ExpirCalc
//
//  Created by James Enciso on 5/27/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "_Entry.h"
#import "DataController.h"

/*
 This class acts as the view definition for the add event window
 All fields are defined here. They implement the _Entry data object

 SetEditModeForIndex() allows a specific entry to be modifed and overwritten. Use this when
 using this window GUI in edit mode 
 */


@interface EventWindow : NSWindow  {
	
	NSTextField *eventNameField;
	NSDatePicker *eventDateField;
	NSTextField *eventDescriptionField;
	NSButton *createEventButton;
	NSButton *cancelEventButton;
	
	bool InEditMode;
	NSInteger EditIndex;
	
}
@property (nonatomic, retain) IBOutlet NSTextField *eventNameField;
@property (nonatomic, retain) IBOutlet NSDatePicker *eventDateField;
@property (nonatomic, retain) IBOutlet NSTextField *eventDescriptionField;
@property (nonatomic, retain) IBOutlet NSButton *createEventButton;
@property (nonatomic, retain) IBOutlet NSButton *cancelEventButton;


@property bool InEditMode;
@property NSInteger EditIndex;


-(IBAction)cancelEvent:(id)sender;
-(IBAction)createEvent:(id)sender;

-(IBAction)setDateToNow:(id)sender;


-(void)SetEditModeForIndex:(NSInteger)index;
-(void)PopulateDataFromEntry:(_Entry *)entry;



@end
