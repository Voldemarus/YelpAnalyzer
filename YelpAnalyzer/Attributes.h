//
//  Attributes.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 05.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Attributes, Business;

@interface Attributes : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * value;
@property (nonatomic, retain) NSString * dataType;
@property (nonatomic, retain) Business *business;
@property (nonatomic, retain) Attributes *parent;
@property (nonatomic, retain) NSSet *children;

// Update/create new record. Used when Business Entity is filled
+ (void) setValue:(id)aVal forAttribute:(NSString *)attrName andBusiness:(Business *)aBus
			inMoc:(NSManagedObjectContext *)moc;


@end

@interface Attributes (CoreDataGeneratedAccessors)

- (void)addChildrenObject:(Attributes *)value;
- (void)removeChildrenObject:(Attributes *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

@end
