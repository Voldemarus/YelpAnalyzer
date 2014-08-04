//
//  Review.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Business, User;

@interface Review : NSManagedObject

@property (nonatomic, retain) NSNumber * stars;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) Business *business;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSSet *votes;
@end

@interface Review (CoreDataGeneratedAccessors)

- (void)addVotesObject:(NSManagedObject *)value;
- (void)removeVotesObject:(NSManagedObject *)value;
- (void)addVotes:(NSSet *)values;
- (void)removeVotes:(NSSet *)values;

@end
