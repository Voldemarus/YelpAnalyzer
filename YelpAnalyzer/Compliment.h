//
//  Compliment.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ComplimentType;

@interface Compliment : NSManagedObject

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) ComplimentType *type;

@end
