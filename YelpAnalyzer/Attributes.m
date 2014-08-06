//
//  Attributes.m
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 05.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import "Attributes.h"
#import "Attributes.h"
#import "Business.h"


@implementation Attributes

@dynamic name;
@dynamic value;
@dynamic dataType;
@dynamic business;
@dynamic parent;
@dynamic children;

// Update/create new record. Used when Business Entity is filled
+ (void) setValue:(id)aVal forAttribute:(NSString *)attrName andBusiness:(Business *)aBus
			inMoc:(NSManagedObjectContext *)moc
{
	NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:[self className]];
	// We suppose that all Upper/lowercase issues has been resolved before, when dataset was created
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@ AND business = %@",attrName, aBus];
	[req setPredicate:predicate];
	
	NSError *error = nil;
	NSArray *result = [moc executeFetchRequest:req error:&error];
	if (!result && error) {
		NSLog(@"%@ : error (104) = %@", [self className], [error localizedDescription]);
		return;
	}
	Attributes *newRec;
	if ([result count] == 0) {
		newRec = [NSEntityDescription insertNewObjectForEntityForName:[[self class] description] inManagedObjectContext:moc];
		if (newRec) {
			newRec.name = attrName;
			newRec.business = aBus;
		}
	} else {
		newRec = (Attributes *)[result objectAtIndex:0];
	}
}

- (NSString *) description
{
	return [NSString stringWithFormat:@"Attributes:  %@ -> %@  (%@)",self.name, self.value, self.dataType];
}



@end
