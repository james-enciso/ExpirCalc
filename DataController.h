//
//  DataController.h
//  ExpirCalc
//
//  Created by James Enciso on 5/27/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "_Entry.h"

/*
 This class acts as the controller for managing data
 Actions include saving, deleting, and exporting data sets
 This class interfaces with the physical file saved on the computer
 
 
 
 */


@interface DataController : NSObject {

}

+(void)AddEntry:(_Entry *)entry;
+(void)UpdateEntryAtIndex:(NSInteger)index WithEntry:(_Entry *)entry;
+(void)DeleteEntryAtIndex:(int)index;

+(NSArray *)GetRawSavedData;
+(NSMutableArray *)GetArrayOfEntries;
+(NSMutableDictionary *)GetDictionaryDataAtIndex:(NSInteger)index;


//-(void)ExportEntry:(id)sender;


@end
