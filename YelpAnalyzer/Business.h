//
//  Business.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Attributes, Categories, CheckIn, Neighborhoods, OpenHours, Review, Tip;

@interface Business : NSManagedObject

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * fullAddress;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSNumber * isOpen;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * reviewCount;
@property (nonatomic, retain) NSNumber * starsRaring;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSSet *attributes;
@property (nonatomic, retain) NSSet *categories;
@property (nonatomic, retain) NSSet *checkIns;
@property (nonatomic, retain) NSSet *neighborhoods;
@property (nonatomic, retain) NSSet *openHours;
@property (nonatomic, retain) NSSet *tips;
@property (nonatomic, retain) NSSet *reviews;
@end

@interface Business (CoreDataGeneratedAccessors)

- (void)addAttributesObject:(Attributes *)value;
- (void)removeAttributesObject:(Attributes *)value;
- (void)addAttributes:(NSSet *)values;
- (void)removeAttributes:(NSSet *)values;

- (void)addCategoriesObject:(Categories *)value;
- (void)removeCategoriesObject:(Categories *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

- (void)addCheckInsObject:(CheckIn *)value;
- (void)removeCheckInsObject:(CheckIn *)value;
- (void)addCheckIns:(NSSet *)values;
- (void)removeCheckIns:(NSSet *)values;

- (void)addNeighborhoodsObject:(Neighborhoods *)value;
- (void)removeNeighborhoodsObject:(Neighborhoods *)value;
- (void)addNeighborhoods:(NSSet *)values;
- (void)removeNeighborhoods:(NSSet *)values;

- (void)addOpenHoursObject:(OpenHours *)value;
- (void)removeOpenHoursObject:(OpenHours *)value;
- (void)addOpenHours:(NSSet *)values;
- (void)removeOpenHours:(NSSet *)values;

- (void)addTipsObject:(Tip *)value;
- (void)removeTipsObject:(Tip *)value;
- (void)addTips:(NSSet *)values;
- (void)removeTips:(NSSet *)values;

- (void)addReviewsObject:(Review *)value;
- (void)removeReviewsObject:(Review *)value;
- (void)addReviews:(NSSet *)values;
- (void)removeReviews:(NSSet *)values;

@end
