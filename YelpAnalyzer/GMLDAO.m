//
//  GMLDAO.m
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import "GMLDAO.h"
#import "GMLAppDelegate.h"

@interface GMLDAO ()

@property (nonatomic, retain) NSManagedObjectContext *moc;

@end



@implementation GMLDAO


+ (instancetype) sharedInstance {
    static GMLDAO *sharedInstance_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[GMLDAO alloc] init];
    });
    return sharedInstance_;
}


- (id) init
{
	if (self = [super init]) {
		GMLAppDelegate *delegate = (GMLAppDelegate *)[[NSApplication sharedApplication] delegate];
		self.moc = delegate.managedObjectContext;
	}
	return self;
}


#pragma mark -

- (Business *) createBusinessEntryFromDictionary:(NSDictionary *)aDict
{
	Business *retValue = [Business createBusinessFromDictionary:aDict inMoc:self.moc];
	return retValue;
}

@end
