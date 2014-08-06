//
//  GMLJsonDao.m
//  YelpAnalyzer
//
//  Created by Водолазкий В.В. on 04.08.14.
//  Copyright (c) 2014 Geomatix Labs S.R.O. All rights reserved.
//

//
// To get actual data for analysis, use
//
// http://www.yelp.com/dataset_challenge
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
// are stored. No data files are placed into project and/or git dur to it tremendous size. 1. GB review file for
// example will acctually hang XCode IDE when user accidently selects it in editor. If you need to investigate
// this data, use head utility in Terminal window :-)
//
- (NSDictionary *) filesList
{
	return @{[[Business class] description] : @"yelp_academic_dataset_business.json",
			 [[User class] description] : @"yelp_academic_dataset_user.json",
			 [[Tip class] description] : @"yelp_academic_dataset_tip.json",
			 [[CheckIn class] description] : @"yelp_academic_dataset_checkin.json",
			 [[Review class] description] : @"yelp_academic_dataset_review.json",
			 };
}


- (void) parseFile:(NSString *) fileName
{
	
	NSString *fullPath = [[self dataPath] stringByAppendingPathComponent:fileName];
	NSFileManager *fm = [NSFileManager defaultManager];
	if ([fm fileExistsAtPath:fullPath]) {
		// file is present, we'll try to process it properly
		char *currentFile;
		currentFile = malloc(2000);
		BOOL converted = [fullPath getCString:currentFile maxLength:2000 encoding:NSUTF8StringEncoding];
		free(currentFile);
		if (!converted) {
			NSAlert *alert = [NSAlert alertWithMessageText:@"Cannot convert NSString to String" defaultButton:@"Very sad..." alternateButton:nil otherButton:nil informativeTextWithFormat:@"Cannot convert NSString %@ to C-ctring",fullPath];
			[alert runModal];
			return;
		}
		NSInteger lineCount = 0;
		FILE *file = fopen(currentFile,"r");
		while (!feof(file)) {
			char buffer[4096];
			int charsRead = 0;
			NSMutableString *currentLine = [NSMutableString stringWithCapacity:512];
			do {
				if (fscanf(file, "%4095[^\n]%n%*c", buffer, &charsRead) == 1)
					[currentLine appendFormat:@"%s",buffer];
				else
					break;
			} while (charsRead == 4095);

			NSError *error = nil;
			NSData *returnedData = [currentLine dataUsingEncoding:NSUTF8StringEncoding];
			id object = [NSJSONSerialization
						 JSONObjectWithData:returnedData
						 options:0
						 error:&error];
			
			if(error) { /* JSON was malformed, act appropriately here */
				NSAlert *alert = [NSAlert alertWithMessageText:@"Error in JSON-file" defaultButton:@"Stop and Investigate" alternateButton:nil otherButton:nil
									 informativeTextWithFormat:@"cannot pars line %ld in %@",(lineCount + 1),fileName];
				[alert runModal];
				return;
			}
			if([object isKindOfClass:[NSDictionary class]])	{
				NSDictionary *results = object;
				// Determine, which class we are processing now
				NSString *currentClassName = [results objectForKey:@"type"];
				if ([currentClassName isEqualToString:@"review"]) {
					[self processReviewEntry:results];
				} else if ([currentClassName isEqualToString:@"business"]) {
					[self processBusinessEntry:results];
				} else if ([currentClassName isEqualToString:@"user"]) {
					[self processUserEntry:results];
				} else if ([currentClassName isEqualToString:@"checkin"]) {
					[self processCheckInEntry:results];
				} else if ([currentClassName isEqualToString:@"tip"]) {
					[self processTipEntry:results];
				}
				
			}
			lineCount++;
		}
		NSLog(@"lines for %@ : %ld", fileName, lineCount);
		fclose(file);
	} else {
		NSAlert *alert = [NSAlert alertWithMessageText:@"File Not Found!" defaultButton:@"I see :-(" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Cennot find file %@",fileName];
		[alert runModal];
	}
}


- (void) parseSourceFiles
{
	// Data should be parsed in the defined sequence to provide link resolution
	NSArray *list = @[[[Business class] description],
						   [[User class] description],
						   [[Tip class] description] ,
						   [[CheckIn class] description] ,
						   [[Review class] description]];
	
	for (NSInteger i=0; i < [list count]; i++) {
		NSString *fName = [[self filesList] objectForKey:[list objectAtIndex:i]];
		[self parseFile:fName];
	}
}

#pragma mark -

- (void) processReviewEntry:(NSDictionary *)data
{
	
}

- (void) processBusinessEntry:(NSDictionary *) data
{
	GMLDAO *dao = [GMLDAO sharedInstance];
	[dao createBusinessEntryFromDictionary:data];
}

- (void) processUserEntry:(NSDictionary *) data
{
	
}

- (void) processCheckInEntry:(NSDictionary *) data
{
	
}

- (void) processTipEntry:(NSDictionary *) data
{
	
}


@end
