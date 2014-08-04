//
//  User.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ComplimentType, Elite, Review, TempFriends, Tip, User, Vote;

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * averageStars;
@property (nonatomic, retain) NSNumber * fans;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * reviewCount;
@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSDate * yelpingSince;
@property (nonatomic, retain) ComplimentType *compliments;
@property (nonatomic, retain) NSSet *eliteYears;
@property (nonatomic, retain) NSSet *tmpFriends;
@property (nonatomic, retain) NSSet *votes;
@property (nonatomic, retain) NSSet *tips;
@property (nonatomic, retain) NSSet *friendsFollowers;
@property (nonatomic, retain) NSSet *followerForFriends;
@property (nonatomic, retain) NSSet *reviews;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addEliteYearsObject:(Elite *)value;
- (void)removeEliteYearsObject:(Elite *)value;
- (void)addEliteYears:(NSSet *)values;
- (void)removeEliteYears:(NSSet *)values;

- (void)addTmpFriendsObject:(TempFriends *)value;
- (void)removeTmpFriendsObject:(TempFriends *)value;
- (void)addTmpFriends:(NSSet *)values;
- (void)removeTmpFriends:(NSSet *)values;

- (void)addVotesObject:(Vote *)value;
- (void)removeVotesObject:(Vote *)value;
- (void)addVotes:(NSSet *)values;
- (void)removeVotes:(NSSet *)values;

- (void)addTipsObject:(Tip *)value;
- (void)removeTipsObject:(Tip *)value;
- (void)addTips:(NSSet *)values;
- (void)removeTips:(NSSet *)values;

- (void)addFriendsFollowersObject:(User *)value;
- (void)removeFriendsFollowersObject:(User *)value;
- (void)addFriendsFollowers:(NSSet *)values;
- (void)removeFriendsFollowers:(NSSet *)values;

- (void)addFollowerForFriendsObject:(User *)value;
- (void)removeFollowerForFriendsObject:(User *)value;
- (void)addFollowerForFriends:(NSSet *)values;
- (void)removeFollowerForFriends:(NSSet *)values;

- (void)addReviewsObject:(Review *)value;
- (void)removeReviewsObject:(Review *)value;
- (void)addReviews:(NSSet *)values;
- (void)removeReviews:(NSSet *)values;

@end
