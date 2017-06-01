//
//  DataController.m
//  ExpirCalc
//
//  Created by James Enciso on 5/27/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import "DataController.h"

#define FILENAME @"a.txt"

@implementation DataController



//appends entry to the end of the file
+(void)AddEntry:(_Entry *)entry{

	//	NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:FILENAME];
	NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:[self GetRawSavedData]];

	[arr addObject:[entry getDeconstructedSerializedObject]];
	
	//NSLog(@"%@", arr);
	[arr writeToFile:FILENAME atomically:YES];
	

}

+(void)UpdateEntryAtIndex:(NSInteger)index WithEntry:(_Entry *)entry{

	NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:[self GetRawSavedData]];
	
	[arr replaceObjectAtIndex:index withObject:[entry getDeconstructedSerializedObject]];
	
	[arr writeToFile:FILENAME atomically:YES];
	
}



+(void)DeleteEntryAtIndex:(int)index{

	NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:[self GetRawSavedData]];
	[arr removeObjectAtIndex:index];
	[arr writeToFile:FILENAME atomically:YES];
}


+(NSArray *)GetArrayOfEntries{
	//TODO: fix algorithm
	//Note: algorithm might be functional, but it's data causes app to crash when used
	
	NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:FILENAME];
	NSLog(@"arr contents %@", arr);
	
	//to store information in
	NSMutableArray *entries = [[NSMutableArray alloc] init];
	
	//NSMutableDictionary *d = [NSMutableDictionary alloc] ;

	
	//_Entry *e = [[_Entry alloc] init];
	for(int i = 0; i< arr.count; i++){
	
		NSLog(@"ok");

		//extract each dictionary, deserialise
		if ([[arr objectAtIndex:i] isKindOfClass:[NSDictionary class]]) {
		//	[d initWithDictionary: (NSDictionary *) [arr objectAtIndex:i]];
			NSMutableDictionary *d = [[NSMutableDictionary alloc] initWithDictionary:[arr objectAtIndex:i]];
			NSLog(@"%@", d);
			
			_Entry *e = [[_Entry alloc] init];
			[e getConstructedDeserializedObjectFromDictionary:d];
			//TODO: check if need to remove garbage collection
		//	NSLog(@"%@", e);
			[entries addObject:e];
			
			NSLog(@"Current count: %@", sizeof(entries));

		}
		
		
	}
	//NSLog(@"total returned: %@", entries.count);
	
	return entries;

}

+(NSArray *) GetRawSavedData{

	NSArray *arr = [[NSArray alloc] initWithContentsOfFile:FILENAME];

	return arr;
	
}

+(NSMutableDictionary *)GetDictionaryDataAtIndex:(NSInteger)index{

	//NSArray *arr = [[NSArray alloc] initWithContentsOfFile:FILENAME];
	NSArray *arr = [[NSArray alloc] initWithArray:[self GetRawSavedData]];
	
	NSMutableDictionary *dummy = [[NSMutableDictionary alloc] init];// TODO: check if needed
	
	//make sure index is within range
	if (index <= arr.count) {
		if ([[arr objectAtIndex:index] isKindOfClass:[NSDictionary class]]) {

			NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:[arr objectAtIndex:index]];
			return dic;
			
		}
		
		//return blank dictionary (to prevent crash)
	}else {
		//return [[NSMutableDictionary alloc] init];
	}

	//return [[NSMutableDictionary alloc] init];
	return dummy;
	
	
}

@end
