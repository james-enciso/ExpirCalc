//
//  _Entry.m
//  ExpirCalc
//
//  Created by James Enciso on 5/27/17.
//  Copyright 2017 __MyCompanyName__. All rights reserved.
//

#import "_Entry.h"


@implementation _Entry

@synthesize _eventtitle, _eventdate, _eventdescription;

-(int)getDaysElapsed{

	
	//get time from now
	NSTimeInterval T =	[_eventdate timeIntervalSinceNow];
	
	//T is number of seconds
	double TT = T;
	TT = abs(TT);
//	NSLog(@"%f", TT);
	
	//calculate conversions
	float numberofdays = TT * (1/60.0) * (1/60.0) * (1/24.0);
	float numberofhours = TT * (1/60.0) * (1/60.0);
	
	return numberofdays;
	
	//NSLog(@"days: %f",numberofdays);
	//NSLog(@"hours: %f",numberofhours);
	
	/*
	NSDate *today = [NSDate timeIntervalSinceReferenceDate:eventdate];
	
	NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
	mmddccyy.timeStyle = NSDateFormatterNoStyle;
	mmddccyy.dateFormat = @"MM/dd/yyyy";
	NSDate *d = [mmddccyy dateFromString:@"05/27/2017"];
	NSLog(@"%@", d);
	
	NSDate *now = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
	NSLog(@"%@", now);
	
	//get time from now
	NSTimeInterval T =	[d timeIntervalSinceNow];
	
	NSMutableString *timeinterval = [NSMutableString string];
	[timeinterval appendFormat:@"%f",T];
	NSLog(@"%@", timeinterval);
	
	//T is number of seconds
	double TT = T;
	TT = abs(TT);
	NSLog(@"%f", TT);
	
	//calculate conversions
	float numberofdays = TT * (1/60.0) * (1/60.0) * (1/24.0);
	float numberofhours = TT * (1/60.0) * (1/60.0);
	
	NSLog(@"days: %f",numberofdays);
	NSLog(@"hours: %f",numberofhours);
	*/
//	return 0;
}

//define all keys here
#define kTITLE @"title"
#define kDATE @"date"
#define kDESC @"description"

-(NSMutableDictionary *) getDeconstructedSerializedObject{

	//deconstruct entry into main components
	NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
	[dic setValue:[self _eventtitle] forKey:kTITLE];
	[dic setValue:[self _eventdate] forKey:kDATE];
	[dic setValue:[self _eventdescription] forKey:kDESC];
	return dic;
	
}

-(_Entry *)getConstructedDeserializedObjectFromDictionary:(NSMutableDictionary *)entrydictionary{

	[self set_eventtitle:[entrydictionary objectForKey:kTITLE]];
	[self set_eventdate:[entrydictionary objectForKey:kDATE]];
	[self set_eventdescription:[entrydictionary objectForKey:kDESC]];
	
	return self;
}


@end
