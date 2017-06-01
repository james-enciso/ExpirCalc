//
//  WindowController.h
//  ExpirCalc
//
//  Created by James Enciso on 5/27/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DataController.h"
#import "TableViewController.h"

@interface MainWindow : NSWindow {

	NSTableView *table;
	NSButton *addEntryButton;
	
	NSButton *refreshTableButton;
	TableViewController *tableController;
	
	
}

@property (nonatomic retain) IBOutlet NSTableView *table;
@property (nonatomic retain) IBOutlet NSButton *addEntryButton;
@property (nonatomic, retain) IBOutlet NSButton *refreshTableButton;
@property (nonatomic, retain) TableViewController *tableController;

-(IBAction)addEntryButtonClicked:(id)sender;
-(IBAction)refreshTableButtonClicked:(id)sender;

-(IBAction)deleteKeyPressed:(id)sender;

-(void)notifyTableRefresh;

@end
