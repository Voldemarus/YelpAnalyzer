//
//  ReviewVote.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Review, VoteType;

@interface ReviewVote : NSManagedObject

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) Review *review;
@property (nonatomic, retain) VoteType *voteType;

@end
