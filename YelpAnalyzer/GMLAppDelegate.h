//
//  GMLAppDelegate.h
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GMLJsonDao.h"
#import "GMLDAO.h"

@interface GMLAppDelegate : NSObject <NSApplicationDelegate> {
	GMLJsonDao *jDao;
}

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) GMLDAO *dao;

- (IBAction)saveAction:(id)sender;

@end
