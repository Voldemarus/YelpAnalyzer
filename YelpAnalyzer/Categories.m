//
//  Categories.m
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import "Categories.h"
#import "Business.h"


@implementation Categories

@dynamic name;
@dynamic businesses;

+ (Categories *) getCategoryByName:(NSString *)catName inMoc:(NSManagedObjectContext *) moc
{
	NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:[self className]];
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",catName];
	[req setPredicate:predicate];
	
	NSError *error = nil;
	NSArray *result = [moc executeFetchRequest:req error:&error];
	if (!result && error) {
		NSLog(@"%@ : error (103) = %@", [self className], [error localizedDescription]);
		return nil;
	}
	if ([result count] == 0) {
		Categories *newRec = [NSEntityDescription insertNewObjectForEntityForName:[[self class] description] inManagedObjectContext:moc];
		if (newRec) {
			newRec.name = catName;
		}
		return newRec;
	}
	return (Categories *)[result objectAtIndex:0];
}

- (NSString *) description
{
	return [NSString stringWithFormat:@"%@ : %@", [self class], self.name];
}

@end
