//
//  Vote.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User, VoteType;

@interface Vote : NSManagedObject

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) VoteType *voteType;

@end
