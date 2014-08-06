//
//  Business.m
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import "Business.h"
#import "Attributes.h"
#import "Categories.h"
#import "CheckIn.h"
#import "Neighborhoods.h"
#import "OpenHours.h"
#import "Review.h"
#import "Tip.h"


@implementation Business

@dynamic city;
@dynamic fullAddress;
@dynamic id;
@dynamic isOpen;
@dynamic latitude;
@dynamic longitude;
@dynamic name;
@dynamic reviewCount;
@dynamic starsRaring;
@dynamic state;
@dynamic attributes;
@dynamic categories;
@dynamic checkIns;
@dynamic neighborhoods;
@dynamic openHours;
@dynamic tips;
@dynamic reviews;


+ (Business *) createBusinessFromDictionary:(NSDictionary *)aDict inMoc:(NSManagedObjectContext *)moc
{
	NSString *idString = [aDict objectForKey:@"business_id"];
	Business *bus = [Business getBusinessForId:idString inMoc:moc];
	if (!bus) {
		// no such record in our warehouse yet, we'll create it...
		bus = [NSEntityDescription insertNewObjectForEntityForName:[[self class] description] inManagedObjectContext:moc];
		bus.id = idString;
		bus.name = [aDict objectForKey:@"name"];
		bus.city = [aDict objectForKey:@"city"];
		bus.state = [aDict objectForKey:@"state"];
		bus.fullAddress = [aDict objectForKey:@"full_address"];
		bus.latitude = @([[aDict objectForKey:@"latitude"] doubleValue]);
		bus.longitude = @([[aDict objectForKey:@"longitude"] doubleValue]);
		bus.starsRaring = @([[aDict objectForKey:@"stars"] doubleValue]);
		bus.reviewCount = @([[aDict objectForKey:@"review_count"] integerValue]);
		bus.isOpen =  [aDict objectForKey:@"open"];
		//
		// Now we'll set links to reference dictionaries
		//
		NSArray *neighbourArray = [aDict objectForKey:@"neighborhoods"];
		if ([neighbourArray count] > 0) {
			for (NSString *nei in neighbourArray) {
				Neighborhoods *n  = [Neighborhoods getNeiborhoodForName:nei inMoc:moc];
				if (n) {
					[bus addNeighborhoodsObject:n];		// link is set up automatically
					NSLog(@"%@",n);
				}
			}
		}
		NSArray *categories = [aDict objectForKey:@"categories"];
		if ([categories count] > 0) {
			for (NSString *cat in categories) {
				Categories *cc = [Categories getCategoryByName:cat inMoc:moc];
				if (cc) {
					[bus addCategoriesObject:cc];
					NSLog(@"%@",cc);
				}
			}
		}
		NSDictionary *attributes = [aDict objectForKey:@"attributes"];
		 if ([attributes count] > 0) {
			 for (NSString *attribName in attributes) {
				 [Attributes setValue:[attributes objectForKey:attribName]
						 forAttribute:attribName andBusiness:bus inMoc:moc];
			 }
		}
		[OpenHours setUpHours:[aDict objectForKey:@"hours"] forBusiness:bus inMoc:moc];
		NSLog(@"%@",bus.openHours);
		
	}
	return bus;
}



+ (Business *) getBusinessForId:(NSString *) cryptoId inMoc:(NSManagedObjectContext *) moc
{
	NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:[self className]];
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id = %@",cryptoId];
	[req setPredicate:predicate];
	
	NSError *error = nil;
	NSArray *result = [moc executeFetchRequest:req error:&error];
	if (!result && error) {
		NSLog(@"%@ : error (101) = %@", [self className], [error localizedDescription]);
		return nil;
	}
	if ([result count] == 0) {
		return nil;
	}
	return (Business *)[result objectAtIndex:0];
}


@end
