//
//  VoteType.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Vote;

@interface VoteType : NSManagedObject

@property (nonatomic, retain) NSNumber * grade;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *counts;
@property (nonatomic, retain) NSSet *reviewCounts;
@end

@interface VoteType (CoreDataGeneratedAccessors)

- (void)addCountsObject:(Vote *)value;
- (void)removeCountsObject:(Vote *)value;
- (void)addCounts:(NSSet *)values;
- (void)removeCounts:(NSSet *)values;

- (void)addReviewCountsObject:(NSManagedObject *)value;
- (void)removeReviewCountsObject:(NSManagedObject *)value;
- (void)addReviewCounts:(NSSet *)values;
- (void)removeReviewCounts:(NSSet *)values;

@end
