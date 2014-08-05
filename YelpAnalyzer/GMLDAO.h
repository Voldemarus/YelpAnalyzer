//
//  GMLDAO.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMLDAO : NSObject


+ (instancetype) sharedInstance;

- (Business *) createBusinessEntryFromDictionary:(NSDictionary *)aDict;

@end
