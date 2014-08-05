//
//  OpenHours.m
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import "OpenHours.h"
#import "Business.h"


@implementation OpenHours

@dynamic close;
@dynamic day;
@dynamic open;
@dynamic businesses;


+ (NSDate *) dateFromHourAndMinutes:(NSString *)aStr
{
	static NSDateFormatter *df;
	if (!df) {
		df = [[NSDateFormatter alloc] initWithDateFormat:@"HH:mm" allowNaturalLanguage:NO];
	}
	return [df dateFromString:aStr];
}

+ (void) setUpHours:(NSDictionary *)hours forBusiness:(Business *)bus  inMoc:(NSManagedObjectContext *)moc
{
	NSArray *dayNames = @[@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"];
	for (NSInteger dayNum = 0; dayNum < [dayNames count]; dayNum++) {
		NSString *dName = [dayNames objectAtIndex:dayNum];
		NSDictionary *hoursForDay = [hours objectForKey:dName];
		if (hoursForDay) {
			// Yes, business has proper record for this day of week
			NSString *openHour = [hoursForDay objectForKey:@"open"];
			NSString *closeHour = [hoursForDay objectForKey:@"close"];
			NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:[[self class] description]];
			NSPredicate *pred = [NSPredicate predicateWithFormat:@"day = %d AND %@ in businesses", dayNum, bus];
			[req setPredicate:pred];
			NSError *error = nil;
			NSArray *result = [moc executeFetchRequest:req error:&error];
			if (!result && error) {
				NSLog(@"%@ : error (105) = %@", [self className], [error localizedDescription]);
				return;
			}
			OpenHours *ohRec;
			if ([result count] > 0) {
				ohRec = (OpenHours *)[result objectAtIndex:0];
			} else {
				ohRec = [NSEntityDescription insertNewObjectForEntityForName:[[self class] description] inManagedObjectContext:moc];
				ohRec.day = @(dayNum);
				[ohRec addBusinessesObject:bus];
			}
			ohRec.open = [OpenHours dateFromHourAndMinutes:openHour];
			ohRec.close = [OpenHours dateFromHourAndMinutes:closeHour];
		}
	}
}

@end
