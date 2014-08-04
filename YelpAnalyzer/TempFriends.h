//
//  TempFriends.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface TempFriends : NSManagedObject

@property (nonatomic, retain) NSString * friendId;
@property (nonatomic, retain) User *master;

@end
