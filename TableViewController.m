//
//  TableViewController.m
//  ExpirCalc
//
//  Created by James Enciso on 5/28/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"


@implementation TableViewController

@synthesize TableData;
//@synthesize DataSource;
@synthesize table;
@synthesize windowcontroller;

/*
-(void)initWithDataSource:(NSMutableArray *)DS{
	//TableData = [[NSMutableArray alloc] initWithArray:DS] ;
	//TableData = [[NSMutableArray alloc] init];
	NSLog(@"DS %@", DS);

	NSArray *NM = [[NSArray alloc] initWithArray:DS];
	NSLog(@"DS %@", NM.count);
	
	//TableData = [[NSMutableArray alloc]initWithArray:DS copyItems:YES];
	//TableData = [DS mutableCopy];
	;
	//NSLog(@"total %@", DataSource.count);

	self.table.dataSource = self;
	self.table.delegate = self;
	
	[table reloadData];
}*/

-(void)initialise{

	///NSMutableArray *entries = [DataController GetArrayOfEntries];

	[table setDelegate:self];
	[table setDataSource:self];
	
	//windowcontroller = [[EventWindowController alloc] initWithWindowNibName:@"addevent"];


	
//	TableData = [[NSMutableArray alloc] init];
//	TableData =[DataController GetArrayOfEntries];

	TableData = [[NSMutableArray alloc] initWithArray:[DataController GetRawSavedData]];
//	TableData = [[NSMutableArray alloc] initWithArray:[DataController GetArrayOfEntries]];
	
	[table reloadData];
}

-(void)Refresh{
	TableData = [[NSMutableArray alloc] initWithArray:[DataController GetRawSavedData]];
	[table reloadData];
}

#pragma mark tableView methods (now deprecated)
- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView{
	
	//NSLog(@"total %@", TableData.count);
	return TableData.count;
	//return 5;
}

#pragma mark tableView methods (now deprecated)
-(id) tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{

	//TODO: fix
	NSCell *cell = [[NSCell alloc] init];

	//column identifiers (assigned in IBuilder)
#define COL_TITLE	@"title"
#define COL_DATE	@"date"
#define COL_TIME	@"time"
	
//extract relevant dictionary
	NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[TableData objectAtIndex:row] copyItems:YES];
	_Entry *e = [[_Entry alloc] init];
	[e getConstructedDeserializedObjectFromDictionary:[dic mutableCopy]];
	
	if ([[tableColumn identifier] isEqualTo:COL_TITLE]) {
		[cell setTitle:[e _eventtitle]];
	}else if ([[tableColumn identifier] isEqualTo:COL_DATE]) {
		//[cell setTitle:[NSString stringWithFormat:@"%@", [e _eventdate]]];
		//TODO: set date format
		[cell setTitle:[e _eventdate]];
	}else if ([[tableColumn identifier] isEqualTo:COL_TIME]) {
		[cell setTitle:[NSString stringWithFormat:@"%i", [e getDaysElapsed]]];

	}

	
	//check if data has changed. If so, refresh table entirely to update
	if (TableData.count < [DataController GetRawSavedData].count) {
		[self Refresh];
	}

	
	
	return cell;
	
	
}

-(BOOL) tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{

	NSLog(@"to edit index: %i", row);
	EventWindowController *CC = [[EventWindowController alloc] initWithWindowNibName:@"addevent"];

//	NSWindowController *wcontroller = [[NSWindowController alloc] initWithWindowNibName:@"addevent"];
	//[wcontroller showWindow:self];
	
	[CC OpenEventWindowWithDataFromIndex:row];
	return NO;
	
}

-(void) tableViewSelectionDidChange:(NSNotification *)notification{
	[self Refresh];
}


@end
