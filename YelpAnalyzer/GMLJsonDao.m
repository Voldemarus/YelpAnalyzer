//
//  GMLJsonDao.m
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import "GMLJsonDao.h"

@implementation GMLJsonDao


//
// Hardcoded for simplicity. This is a directory where all unpacked data files provided by Yelp are stored
//
- (NSString *) dataPath
{
	return @"/Users/1/Geomatix/YelpAnalyzer/data/";
}

//
// Dictionary contains class name as key and appropriate file' name as value, where data in JSON format
// are stored
//
- (NSDictionary *) filesList
{
	return @{[[Business class] description] : @"yelp_academic_dataset_business.json",
			 [[User class] description] : @"yelp_academic_dataset_user.json",
			 [[Tip class] description] : @"yelp_academic_dataset_tip.json",
			 [[CheckIn class] description] : @"yelp_academic_dataset_checkin.json",
	
			 };
}

@end
