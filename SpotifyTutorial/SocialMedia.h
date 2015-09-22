//
//  SocialMedia.h
//  SpotifyTutorial
//
//  Created by Michael Sevy on 9/15/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocialMedia : NSObject
@property NSString *text;
@property NSString *screenName;
@property NSString *source;
@property NSString *timeDiff;
@property float timingDiff;

@property NSData *userPicData;
@property NSData *mainPicData;
@property NSURL *mainPicPageURL;

@property NSString *bookLocation;
@property NSString *bookUserID;
@property BOOL mainImageBool;
@property BOOL isVerified;
@property NSString *verified;
@property NSString *createdLongForm;
@property NSString *relevance;

@property NSArray *faceboookCommentsArray;



@end
