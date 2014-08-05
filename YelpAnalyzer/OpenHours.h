//
//  OpenHours.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Business;

@interface OpenHours : NSManagedObject

@property (nonatomic, retain) NSDate * close;
@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSDate * open;
@property (nonatomic, retain) NSSet *businesses;
@end

@interface OpenHours (CoreDataGeneratedAccessors)

- (void)addBusinessesObject:(Business *)value;
- (void)removeBusinessesObject:(Business *)value;
- (void)addBusinesses:(NSSet *)values;
- (void)removeBusinesses:(NSSet *)values;


+ (void) setUpHours:(NSDictionary *)hours forBusiness:(Business *)bus inMoc:(NSManagedObjectContext *)moc;


@end
