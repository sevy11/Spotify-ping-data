//
//  AppDelegate.m
//  SpotifyTutorial
//
//  Created by Michael Sevy on 8/17/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "AppDelegate.h"
#import <Spotify/Spotify.h>
#import "Spotify.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@property (nonatomic, strong) SPTSession *session;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[SPTAuth defaultInstance]setClientID:@"23375a532b9f47ef9e3315cc492b55c1"];
    [[SPTAuth defaultInstance]setRedirectURL:[NSURL URLWithString:@"spotify-tutorial://returnafterlogin"]];
    [[SPTAuth defaultInstance]setRequestedScopes:@[SPTAuthPlaylistReadPrivateScope]];

    //construct a login url and open it
    NSURL *loginUrl = [[SPTAuth defaultInstance]loginURL];

    //delay the url redirect to not interefere with other app open stuff
    [application performSelector:@selector(openURL:) withObject:loginUrl afterDelay:0.5];

    [Parse enableLocalDatastore];

    //init parse
    [Parse setApplicationId:@"ZbQ5w3tmODQhJHpyvgWBqHvzvIX0bYtzgaHKi4Dj"
                  clientKey:@"tNVREXcME4oUBmxH8WJexUjM9UcGhRdmDZWsgM1X"];
    //track stats
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];

    return YES;
}

//handle the auth callback
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{

    //ask sptAuth is the given url is a spotify auth callback
    if ([[SPTAuth defaultInstance]canHandleURL:url]) {
        [[SPTAuth defaultInstance]handleAuthCallbackWithTriggeredAuthURL:url callback:^(NSError *error, SPTSession *session) {
            if (error != nil) {
                NSLog(@"**** Autho error: %@", error);
                return;
            }
            [self getJSONFromSession:session];
        }];
        return YES;
    }
    return NO;
}

-(void)getJSONFromSession:(SPTSession *)session     {

    //1) PlaylistList
    [SPTPlaylistList playlistsForUserWithSession:session callback:^(NSError *error, id object) {
        if (error) {
            NSLog(@"error: %@", error);
        }

        //gets an Array of playlists' URIs
        SPTPlaylistList *list = object;

        //2) playlist uri's and name from the partial playlist ob top 5
        SPTPartialPlaylist *partial = [list.items objectAtIndex:0];
        NSLog(@"PPlaylist 1 name:%@; URI:%@; Track count: %lu", partial.name, partial.uri, (unsigned long)partial.trackCount);

        SPTPartialPlaylist *partial1 = [list.items objectAtIndex:1];
        NSLog(@"PPlaylist 2 name:%@; URI:%@; Track count: %lu", partial1.name, partial1.uri, (unsigned long)partial1.trackCount);

        SPTPartialPlaylist *partial2 = [list.items objectAtIndex:2];
        NSLog(@"PPlaylist 3 name:%@; URI:%@; Track count: %lu", partial2.name, partial2.uri, (unsigned long)partial2.trackCount);

        SPTPartialPlaylist *partial3 = [list.items objectAtIndex:3];
        NSLog(@"PPlaylist 4 name:%@; URI:%@; Track count: %lu", partial3.name, partial3.uri, (unsigned long)partial3.trackCount);

        SPTPartialPlaylist *partial4 = [list.items objectAtIndex:4];
        NSLog(@"PPlaylist  5 name:%@; URI:%@; Track count: %lu", partial4.name, partial4.uri, (unsigned long)partial4.trackCount);

        //3) songs in the list1
        [SPTPlaylistSnapshot playlistWithURI:partial.uri session:session callback:^(NSError *error, id object) {
            if (error) {
                NSLog(@"error: %@", error);
            }

            SPTPlaylistSnapshot *partialTrackObies = object;
            SPTListPage *listPage = partialTrackObies.firstTrackPage;
           // NSLog(@"array of items in list : %@", listPage.items);

        //4) loop through the list and get out the artists
            for (SPTPartialTrack *artist in listPage.items) {

                NSString *artistString = [NSString stringWithFormat:@"%@", artist.artists[0]];
                NSString *firstName = [[artistString componentsSeparatedByString:@" "]objectAtIndex:2];
                NSString *artistName = [firstName stringByAppendingString:@" "];
                NSString *secondName = [[artistString componentsSeparatedByString:@" "]objectAtIndex:3];
                NSString *artistURI = [[artistString componentsSeparatedByString:@" "]lastObject];

                NSString *artistNameString = [artistName stringByAppendingString:secondName];
                NSString *URIDigitOnly = [artistURI substringFromIndex:16];
                NSString *URINumbersOnly = [URIDigitOnly substringToIndex:22];

//                PFObject *artistURINumber = [PFObject objectWithClassName:@"Artist"];
//                artistURINumber[@"name"] = artistNameString;
//                artistURINumber[@"URI"] = URINumbersOnly;
//                [artistURINumber saveInBackground];
            }
        }];

        //songs in list 2
        [SPTPlaylistSnapshot playlistWithURI:partial1.uri session:session callback:^(NSError *error, id object){
            if (error) {
                NSLog(@"error list 2: %@", error);
            }
            SPTPlaylistSnapshot *partialTrackOb2 = object;
            SPTListPage *listPage = partialTrackOb2.firstTrackPage;
            for (SPTPartialTrack *artist in listPage.items) {
                NSString *artistString = [NSString stringWithFormat:@"%@", artist.artists[0]];
                NSString *firstName = [[artistString componentsSeparatedByString:@" "]objectAtIndex:2];
                NSString *artistName = [firstName stringByAppendingString:@" "];
                NSString *secondName = [[artistString componentsSeparatedByString:@" "]objectAtIndex:3];
                NSString *artistURI = [[artistString componentsSeparatedByString:@" "]lastObject];

                NSString *artistNameString = [artistName stringByAppendingString:secondName];
                NSString *URIDigitOnly = [artistURI substringFromIndex:16];
                NSString *URINumbersOnly = [URIDigitOnly substringToIndex:22];

//                PFObject *artistURINumber = [PFObject objectWithClassName:@"Artist"];
//                artistURINumber[@"name"] = artistNameString;
//                artistURINumber[@"URI"] = URINumbersOnly;
//                [artistURINumber saveInBackground];
            }

        }];

        //songs in list 3
        [SPTPlaylistSnapshot playlistWithURI:partial3.uri session:session callback:^(NSError *error, id object){
            if (error) {
                NSLog(@"error list 2: %@", error);
            }
            SPTPlaylistSnapshot *partialTrackOb2 = object;
            SPTListPage *listPage = partialTrackOb2.firstTrackPage;
            for (SPTPartialTrack *artist in listPage.items) {
                NSString *artistString = [NSString stringWithFormat:@"%@", artist.artists[0]];
                NSString *firstName = [[artistString componentsSeparatedByString:@" "]objectAtIndex:2];
                NSString *artistName = [firstName stringByAppendingString:@" "];
                NSString *secondName = [[artistString componentsSeparatedByString:@" "]objectAtIndex:3];
                NSString *artistURI = [[artistString componentsSeparatedByString:@" "]lastObject];

                NSString *artistNameString = [artistName stringByAppendingString:secondName];
                NSString *URIDigitOnly = [artistURI substringFromIndex:16];
                NSString *URINumbersOnly = [URIDigitOnly substringToIndex:22];

//                PFObject *artistURINumber = [PFObject objectWithClassName:@"Artist"];
//                artistURINumber[@"name"] = artistNameString;
//                artistURINumber[@"URI"] = URINumbersOnly;
//                [artistURINumber saveInBackground];
            }
            
        }];
   }];
}

@end






