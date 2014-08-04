//
//  ComplimentType.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Compliment, User;

@interface ComplimentType : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *compliments;
@property (nonatomic, retain) User *user;
@end

@interface ComplimentType (CoreDataGeneratedAccessors)

- (void)addComplimentsObject:(Compliment *)value;
- (void)removeComplimentsObject:(Compliment *)value;
- (void)addCompliments:(NSSet *)values;
- (void)removeCompliments:(NSSet *)values;

@end
