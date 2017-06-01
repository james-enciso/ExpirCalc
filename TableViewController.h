//
//  TableViewController.h
//  ExpirCalc
//
//  Created by James Enciso on 5/28/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DataController.h"

#import "EventWindow.h"
#import "EventWindowController.h"

@interface TableViewController : NSTableView <NSTableViewDelegate, NSTableViewDataSource> {

	NSTableView *table;
	NSMutableArray *TableData;
	
	EventWindowController *windowcontroller;
	
	
	/*typedef enum TIME_REPRESENTATION {
		HOURS,
		DAYS
	} TimeUnit ;
	TimeUnit timeUnit;*/
	
}
@property (nonatomic, retain) NSMutableArray *TableData;
@property (nonatomic, retain) IBOutlet NSTableView *table;
@property (nonatomic, retain) EventWindowController *windowcontroller;

//-(void)init;
-(void)initWithDataSource:(NSMutableArray *)DS;
-(void)initialise;
-(void)Refresh;
@end
