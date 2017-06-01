//
//  WindowController.m
//  ExpirCalc
//
//  Created by James Enciso on 5/27/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import "MainWindow.h"


@implementation MainWindow

@synthesize table, addEntryButton; //, DataArray;
@synthesize refreshTableButton;
@synthesize tableController;

-(void) awakeFromNib{

//get all entries and push them to table view controller
//	NSMutableArray *entries = [DataController GetArrayOfEntries];
//	NSLog(@"%@", entries);
	
	//MainWindowController *MWC = [[MainWindowController alloc] init];
	//[MWC setmwindow:self];
	//[self setWindowController:MWC];
	
	
	
	tableController = [[TableViewController alloc] init];
	[tableController setTable:[self table]];
	[tableController initialise];
	
//	TableViewController *TC = [[TableViewController alloc] init];
//	[TC setTable:[self table]];

	//[TC initWithDataSource:entries];
//	[TC initialise];
	//[TC reloadData];
	
}


-(IBAction)addEntryButtonClicked:(id)sender{

	//open new window to deal the rest
	NSWindowController *wcontroller = [[NSWindowController alloc] initWithWindowNibName:@"addevent"];
	[wcontroller showWindow:self];
			
}

-(IBAction)refreshTableButtonClicked:(id)sender{

	[tableController Refresh];
	
}


-(IBAction)deleteKeyPressed:(id)sender{

	//TODO: double check if this condition is checked
	if ([[tableController table] selectedRow]  >= 0) {
		
		[DataController DeleteEntryAtIndex:[[tableController table] selectedRow]];
		[tableController Refresh];
	}
	
	
}

-(void)notifyTableRefresh{

	[tableController Refresh];
	
}



@end
