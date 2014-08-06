//
//  Neighborhoods.m
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import "Neighborhoods.h"
#import "Business.h"


@implementation Neighborhoods

@dynamic name;
@dynamic businesses;


+ (Neighborhoods *) getNeiborhoodForName:(NSString *)aString inMoc:(NSManagedObjectContext *) moc
{
	NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:[self className]];
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",aString];
	[req setPredicate:predicate];
	
	NSError *error = nil;
	NSArray *result = [moc executeFetchRequest:req error:&error];
	if (!result && error) {
		NSLog(@"%@ : error (102) = %@", [self className], [error localizedDescription]);
		return nil;
	}
	if ([result count] == 0) {
		Neighborhoods *newNei = [NSEntityDescription insertNewObjectForEntityForName:[[self class] description] inManagedObjectContext:moc];
		if (newNei) {
			newNei.name = aString;
		}
		return newNei;
	}
	return (Neighborhoods *)[result objectAtIndex:0];
}

- (NSString *) description
{
	return [NSString stringWithFormat:@"%@ : %@", [self class], self.name];
}

@end
