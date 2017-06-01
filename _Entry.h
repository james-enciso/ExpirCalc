//
//  _Entry.h
//  ExpirCalc
//
//  Created by James Enciso on 5/27/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*
 Individual data cell
 To be used with data controller
 
 */


@interface _Entry : NSObject {

	NSString *_eventtitle;
	NSDate *_eventdate;
	NSString *_eventdescription;
	
}

@property (nonatomic, retain) NSString *_eventtitle;
@property (nonatomic, retain) NSDate *_eventdate;
@property (nonatomic, retain) NSString *_eventdescription;

-(int)getDaysElapsed;

//returns a mutable dictionary of all objects herein (for saving data)
-(NSMutableDictionary *)getDeconstructedSerializedObject;
//returns an _Entry from a dictionary of serialised data
-(_Entry *)getConstructedDeserializedObjectFromDictionary:(NSMutableDictionary *)entrydictionary;

@end
