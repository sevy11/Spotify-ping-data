//
//  ViewController.m
//  SpotifyTutorial
//
//  Created by Michael Sevy on 8/17/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "ViewController.h"
#import <Spotify/Spotify.h>
#import "Spotify.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;

@property NSArray *artistArray;
@property NSMutableArray *searchStrings;
@property NSMutableArray *herokuSearchableStrings;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchStrings = [NSMutableArray array];
    self.herokuSearchableStrings = [NSMutableArray new];

    //checks for currentUser
//    PFUser *currentUser = [PFUser currentUser];
//    if (currentUser) {
//        NSLog(@"current user: %@", currentUser);
//    } else {
//
//        [self performSegueWithIdentifier:@"SignInSegue" sender:self];
//    }
}

- (IBAction)updateSpotArtists:(UIButton *)sender {

    //**********need to run one more check so the parse object only gets the array from the current userID


    PFQuery *query = [PFQuery queryWithClassName:@"Artist"];
     [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){

         NSArray *reversedArray = [[objects reverseObjectEnumerator] allObjects];

         for (PFObject *obj in reversedArray) {

//             NSString *artistFirstTwoNamesObjects = [obj objectForKey:@"nameString"];
             NSString *URI = [obj objectForKey:@"URI"];
             //NSString *fullURI = [obj objectForKey:@"URIFullString"];

             //add the object to global mutable array
             [self.searchStrings addObject:URI];

         }

        //minus duplicates, now we have an array of only the pertinent data stored globally
        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:self.searchStrings];
        NSArray *uniqueArray = [orderedSet array];

         for (int i = 0; i < 20; i++) {

             Spotify *spot = [Spotify new];
             spot.searchTerm1 = @"";
             spot.searchTerm2 = @"";
             spot.searchTerm3 = @"";
             spot.searchTerm4 = @"";
             spot.searchTerm5 = @"";
             spot.searchTerm6 = @"";
             spot.searchTerm7 = @"";
             spot.searchTerm8 = @"";
             spot.searchTerm9 = @"";
             spot.searchTerm10 = @"";
             spot.searchTerm11 = @"";
             spot.searchTerm12 = @"";
             spot.searchTerm13 = @"";
             spot.searchTerm14 = @"";
             spot.searchTerm15 = @"";

             NSString *uri = [uniqueArray objectAtIndex:i];
             NSLog(@"loop for URI: %@", uri);



    //now there's a problem with once we have this unique ID how to turn it into a search String for the helper method to digest?? 1) another enumeration where it say does't equal nil and we can print it 2) pass only the ones that dont equal nil to a one two three object and then search those-- check


            if ([uri isEqualToString:@"55Aa2cqylxrFIXC767Z865"]) {
                NSLog(@"lil wayne");
                NSString *local = @"lil wayne";
                NSString *local1 = @"weezy";
                [self.herokuSearchableStrings addObject:local];
                [self.herokuSearchableStrings addObject:local1];

            } else if ([uri isEqualToString:@"7JQKCnl4IaJz7uMtcLScfK"]){
                NSString *local = @"Big Pun";
                NSString *local1 = @"Big Punisher";
                NSLog(@"big pun");
                [self.herokuSearchableStrings addObject:local];
                [self.herokuSearchableStrings addObject:local1];

            } else if ([uri isEqualToString:@"3PhoLpVuITZKcymswpck5b"]){
                NSLog(@"Elton John");
                NSString *local = @"Elton";
                NSString *local2 = @"Elton John";
                [self.herokuSearchableStrings addObject:local];
                [self.herokuSearchableStrings addObject:local2];

            } else if ([uri isEqualToString:@"6VDdCwrBM4qQaGxoAyxyJC"]){
                NSLog(@"CWK");
                NSString *local = @"cold war kids";
                NSString *loc = @"CWK";
                [self.herokuSearchableStrings addObject:local];
                [self.herokuSearchableStrings addObject:loc];

            } else if ([uri isEqualToString:@"6zFYqv1mOsgBRQbae3JJ9e"]){
                NSLog(@"Billy Joel");
                NSString *jas = @"Billy Joel";
                [self.herokuSearchableStrings addObject:jas];

            }

            NSLog(@"button logger artist: %@", self.herokuSearchableStrings);

         }
    }];

}


//call this method here, becauase we push the inbox to the signInSegue from here
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    //check the idenifiier if there are mor than 1
//    if ([segue.identifier isEqualToString:@"SignInSegue"]) {
//        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
//    }

//}



//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"SignInSegue"]) {
//        NSLog(@"cool man");
//        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
//    }
//}
//

@end
