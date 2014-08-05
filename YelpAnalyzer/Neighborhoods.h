//
//  Neighborhoods.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Business;

@interface Neighborhoods : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *businesses;
@end

@interface Neighborhoods (CoreDataGeneratedAccessors)

- (void)addBusinessesObject:(Business *)value;
- (void)removeBusinessesObject:(Business *)value;
- (void)addBusinesses:(NSSet *)values;
- (void)removeBusinesses:(NSSet *)values;


+ (Neighborhoods *) getNeiborhoodForName:(NSString *)aString inMoc:(NSManagedObjectContext *) moc;

@end
