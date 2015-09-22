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
#import "SocialMedia.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;

@property (weak, nonatomic) IBOutlet UIImageView *verifiedImage;

@property NSMutableArray *searchStrings;
@property NSMutableArray *herokuSearchableStrings;
@property NSMutableArray *socialMediaArray;
@property NSArray *twitterArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchStrings = [NSMutableArray array];
    self.herokuSearchableStrings = [NSMutableArray new];
    self.socialMediaArray = [NSMutableArray new];
    self.twitterArray = [NSArray new];

    self.tableview.delegate = self;
    self.tableview.dataSource = self;
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
    //reverse query order
    [query orderByDescending:@"updatedAt"];
     [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
         //read the array backwards

         // NSArray *reversedArray = [[objects reverseObjectEnumerator] allObjects];

         for (PFObject *obj in objects) {

//             NSString *artistFirstTwoNamesObjects = [obj objectForKey:@"nameString"];
             NSString *URI = [obj objectForKey:@"URI"];
             //NSString *fullURI = [obj objectForKey:@"URIFullString"];

             //add the object to global mutable array
           //  NSLog(@"upper loop for URI: %@", URI);

    [self.searchStrings addObject:URI];
             //NSLog(@"URIs: %@", self.searchStrings);

         }

        //minus duplicates, now we have an array of only the pertinent data stored globally
        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:self.searchStrings];
        NSArray *uniqueArray = [orderedSet array];

         for (int i = 0; i < 11; i++) {
      //   for (NSString *uri in uniqueArray) {
        //     NSLog(@"URIs minus dupes: %@", uri);


//             Spotify *spot = [Spotify new];
//             spot.searchTerm1 = @"";
//             spot.searchTerm2 = @"";
//             spot.searchTerm3 = @"";
//             spot.searchTerm4 = @"";
//             spot.searchTerm5 = @"";


             NSString *uri = [uniqueArray objectAtIndex:i];
             NSLog(@"loop for URI: %@", uri);

             //run the array of uri's through the Artist's strings add the search terms to the herokuSearchableStrings Array which will then pass of to the performTweetSearch method on the search class

            if ([uri isEqualToString:@"55Aa2cqylxrFIXC767Z865"]) {
             //   NSLog(@"lil wayne");
                NSString *local = @"\"lil%20wayne\"";
                NSString *local1 = @"\"weezy\"";
               // NSString *loc = @"\"#weezy\"";
                //[self.herokuSearchableStrings addObject:loc];
                [self.herokuSearchableStrings addObject:local];
                [self.herokuSearchableStrings addObject:local1];

            } else if ([uri isEqualToString:@"0Y5tJX1MQlPlqiwlOH1tJY"]){
                NSString *jas = @"\"Travi$%20Scott\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2kucQ9jQwuD8jWdtR9Ef38"]){
                NSString *jas = @"\"Sam%20Hunt\"";
                [self.herokuSearchableStrings addObject:jas];
                
            } else if ([uri isEqualToString:@"0jnsk9HBra6NMjO2oANoPY"]){
                NSString *jas = @"\"Flo%20Rida\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3QLIkT4rD2FMusaqmkepbq"]){
                NSString *jas = @"\"Rachel%20Platten\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4TsHKU8l8Wq7n7OPVikirn"]){
                NSString *jas = @"Jidenna";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"0C8ZW7ezQVs4URX5aX7Kqx"]){
                NSString *jas = @"\"Selena%20Gomez\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"0f5nVCcR06GX8Qikz0COtT"]){
                NSString *jas = @"Omarion";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"26VFTg2z8YR0cCuwLzESi2"]){
                NSString *jas = @"Halsey";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"7juKTDFlPesGeWQ1GmjmOv"]){
                NSString *jas = @"Silento";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5lHRUCqkQZCIWeX7xG4sYT"]){
                NSString *jas = @"\"Rich%20Homie%20Quan\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"7iZtZyCzp3LItcw1wtPI3D"]){
                NSString *jas = @"\"Rae%20Sremmurd\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3KV3p5EY4AvKxOlhGHORLg"]){
                NSString *jas = @"Jeremih";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"7CajNmpbOovFoOoasH2HaY"]){
                NSString *jas = @"\"Calvin%20Harris\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6VuMaDnrHyPL1p4EHjYLi7"]){
                NSString *jas = @"\"Charlie%20Puth\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6eUKZXaKkcviH0Ku9w2n3V"]){
                NSString *jas = @"\"Ed%20Sheeran\"";
                NSString *has = @"Sheeran";
                [self.herokuSearchableStrings addObject:has];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5MouCg6ta7zAxsfMEbc1uh"]){
                NSString *jas = @"OMI";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4AK6F7OLvEQ5QYCBNiQWHq"]){
                NSString *jas = @"\"One%20Direction\"";
                NSString *one = @"\"Harry%20Styles\"";
                NSString *two = @"\"Liam%20Payne\"";
                NSString *three = @"\"Niall%20Horan\"";
                NSString *four = @"\"Zayn%20Malik\"";
                NSString *five = @"Zayne";

                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:three];
                [self.herokuSearchableStrings addObject:four];
                [self.herokuSearchableStrings addObject:five];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5p7f24Rk5HkUZsaS3BLG5F"]){
                NSString *jas = @"\"Hailee%20Steinfeld\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6S2OmqARrzebs0tKUEyXyp"]){
                NSString *jas = @"\"Demi%20Levato\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"20sxb77xiYeusSH8cVdatc"]){
                NSString *jas = @"\"Meek%20Mill\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5BcAKTbp20cv7tC5VqPFoC"]){
                NSString *jas = @"\"Macklemore%20&%20Ryan%20Lewis\"";
                NSString *one = @"Macklemore";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"7n2wHs1TKAczGzO7Dd2rGr"]){
                NSString *jas = @"\"Shawn%20Mendes\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1HxJeLhIuegM3KgvPn8sTa"]){
                NSString *jas = @"\"Jack%20Ü\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4TH4BHy0LdBi3dpBW4P2UX"]){
                NSString *jas = @"\"R.%20City\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"738wLrAtLtCtFOLvQBXOXp"]){
                NSString *jas = @"\"Major%20Lazer\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2YZyLoL8N0Wb9xBt1NhZWg"]){
                NSString *jas = @"\"Kendrick%20Lamar\"";
                NSString *one = @"\"K.%20Dot\"";

                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3TVXtAsR1Inumwj472S9r4"]){
                NSString *jas = @"Drake";
                NSString *one = @"drizzy";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6PXS4YHDkKvl1wkIl4V8DL"]){
                NSString *jas = @"\"Fetty%20Wap\"";
                NSString *one = @"Fetty";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1Xyo4u8uXC1ZmMpatF05PJ"]){
                NSString *jas = @"\"Weeknd\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3SYGWAHCe31oykdeUPpoJp"]){
                NSString *jas = @"\"Miranda%20Cosgrove\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1uNFoZAHBGtllmzznpCI3s"]){
                NSString *jas = @"\"Justin%20Bieber\"";
                NSString *one = @"Bieber";
                NSString *two = @"Bieb";
                NSString *three = @"Beebs";

                [self.herokuSearchableStrings addObject:jas];
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:three];

            } else if ([uri isEqualToString:@"6LqNN22kT3074XbTVUrhzX"]){
                NSString *jas = @"Kesha";
                NSString *one = @"Ke$ha";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2NdeV5rLm47xAvogXrYhJX"]){
                NSString *jas = @"Ciara";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1SupJlEpv7RS2tPNRaHViT"]){
                NSString *jas = @"\"Nicky%20Jam\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1JbemQ1fPt2YmSLjAFhPBv"]){
                NSString *jas = @"Chayanne";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"7qG3b048QCHVRO5Pv1T5lw"]){
                NSString *jas = @"\"Enrique%20Iglesias\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6l3HvQ5sa6mXTsMTB19rO5"]){
                NSString *jas = @"\"J%20Cole\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1P8IfcNKwrkQP5xJWuhaOC"]){
                NSString *jas = @"\"LL%20Cool%20J\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2s4tjL6W3qrblOe0raIzwJ"]){
                NSString *jas = @"\"Yoko%20Ono\"";
                NSString *one = @"\"The%20Beatles\"";
                NSString *two = @"Yoko";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4uoz4FUMvpeyGClFTTDBsD"]){
                NSString *jas = @"\"Ricardo%20Montaner\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4OBJLual30L7gRl5UkeRcT"]){
                NSString *jas = @"\"T%20I.\"";
                NSString *one = @"\"T%20I\"";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3NyNPJaemMYsL14DK2tO01"]){
                NSString *jas = @"Cheryl";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6S0dmVVn4udvppDhZIWxCr"]){
                NSString *jas = @"\"Sean%20Kingston\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"0c173mlxpT3dSFRgMO8XPh"]){
                NSString *jas = @"\"Big%20Sean\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1XkoF8ryArs86LZvFOkbyr"]){
                NSString *jas = @"\"Mary%20J%20Blige\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"04gDigrS5kc9YWfZHwBETP"]){
                NSString *jas = @"\"Maroon%205\"";
                NSString *ine = @"\"Adam%20Levine\"";
                [self.herokuSearchableStrings addObject:ine];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4bYPcJP5jwMhSivRcqie2n"]){
                NSString *jas = @"\"Maroon%205\"";
                NSString *ine = @"\"Adam%20Levine\"";
                [self.herokuSearchableStrings addObject:ine];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2l7iQ6OowUofHBKzlNeLhY"]){
                NSString *jas = @"\"Rev%20Run\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"13saZpZnCDWOI9D4IJhp1f"]){
                NSString *jas = @"\"Lily%20Allen\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"085pc2PYOi8bGKj0PNjekA"]){
                NSString *jas = @"\"will.i.am\"";
                NSString *jas1 = @"\"black%20eyed%20peas\"";
                [self.herokuSearchableStrings addObject:jas1];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5y2Xq6xcjJb2jVM54GHK3t"]){
                NSString *jas = @"\"John%20Legend\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5gznATMVO85ZcLTkE9ULU7"]){
                NSString *jas = @"\"Lenny%20Kravitz\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3sgFRtyBnxXD5ESfmbK4dl"]){
                NSString *jas = @"\"LMFAO\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4m4SfDVbF5wxrwEjDKgi4k"]){
                NSString *jas = @"\"Cher%20Lloyd\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3whuHq0yGx60atvA2RCVRW"]){
                NSString *jas = @"\"Olly%20Murs\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5xKp3UyavIBUsGy3DQdXeF"]){
                NSString *jas = @"\"A%20Great%20Big%20World\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3whuHq0yGx60atvA2RCVRW"]){
                NSString *jas = @"\"Olly%20Murs\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3qvcCP2J0fWi0m0uQDUf6r"]){
                NSString *jas = @"\"Luan%20Santana\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4crs55NFrnArSpE78rohLS"]){
                NSString *jas = @"\"Vidi%20Aldiano\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4VMYDCV2IEDYJArk749S6m"]){
                NSString *jas = @"\"Daddy%20Yankee\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5m7wCUhYhBh7A3A3YMxrbt"]){
                NSString *jas = @"\"Queen%20Latifah\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"23wEWD21D4TPYiJugoXmYb"]){
                NSString *jas = @"\"Thalía\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4V8Sr092TqfHkfAA5fXXqG"]){
                NSString *jas = @"\"Luis%20Fonsi\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"0yNSzH5nZmHzeE2xn6Xshb"]){
                NSString *jas = @"\"Calle%2013\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5gOJTI4TusSENizxhcG7jB"]){
                NSString *jas = @"\"David%20Bisbal\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3AuMNF8rQAKOzjYppFNAoB"]){
                NSString *jas = @"\"Kelly%20Rowland\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3BmGtnKgCSGYIUhmivXKWX"]){
                NSString *jas = @"\"Kelly%20Clarkson\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4phGZZrJZRo4ElhRtViYdl"]){
                NSString *jas = @"\"Jason%20Mraz\"";
                NSString *one = @"Mraz";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"07YZf4WDAMNwqr4jfgOZ8y"]){
                NSString *jas = @"\"Jason%20Derulo\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6GMYJwaziB4ekv1Y6wCDWS"]){
                NSString *jas = @"\"Soulja%20Boy\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2lw5niNT3uXAJdUbyiUv3z"]){
                NSString *jas = @"\"DJ%20Kush\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6sFIWsNpZYqfjUpaCgueju"]){
                NSString *jas = @"\"Carly%20Rae%20Jepsen\"";
                NSString *one = @"Jepsen";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"4Rxn7Im3LGfyRkY2FlHhWi"]){
                NSString *jas = @"\"Nick%20Jonas\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"7gOdHgIoIKoe4i9Tta6qdD"]){
                NSString *one = @"Nick%20Jonas";
                NSString *two = @"\"Joe%20Jonas\"";
                NSString *jas = @"\"Jonas%20Brothers\"";

                [self.herokuSearchableStrings addObject:jas];
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];

            } else if ([uri isEqualToString:@"2iojnBLj0qIMiKPvVhLnsH"]){
                NSString *jas = @"\"Trey%20Songz\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2tFN9ubMXEhdAQvdQxcsma"]){
                NSString *jas = @"\"jessica%20simpson\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2gsggkzM5R49q6jpPvazou"]){
                NSString *jas = @"\"Jessie%20J\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1d6dwipPrsFSJVmFTTdFSS"]){
                NSString *jas = @"\"Paulina%20Rubio\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"23zg3TcAtWQy7J6upgbUnj"]){
                NSString *jas = @"\"usher\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3ipn9JLAPI5GUEo4y4jcoi"]){
                NSString *jas = @"\"Luda\"";
                NSString *jas1 = @"\"Ludacris\"";

                [self.herokuSearchableStrings addObject:jas];
                [self.herokuSearchableStrings addObject:jas1];

            } else if ([uri isEqualToString:@"5auFhdM0ZgtH6cXwncgZ4m"]){
                NSString *jas = @"\"agnes%20monica\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"6vWDO969PvNqNYHIOW5v0m"]){
                NSString *jas = @"\"Beyoncé\"";
                NSString *one = @"Jay-z";
                NSString *two = @"\"Beyonce\"";

                [self.herokuSearchableStrings addObject:jas];
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];

            } else if ([uri isEqualToString:@"5sUrlPAHlS9NEirDB8SEbF"]){
                NSString *jas = @"\"alejandro%20sanz\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"3q7HBObVc0L8jNeTe5Gofh"]){
                NSString *jas = @"\"50%20cent\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"1Cs0zKBU1kc0i8ypK3B9ai"]){
                NSString *jas = @"\"david%20guetta\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"7slfeZO9LsJbWgpkIoXBUJ"]){
                NSString *jas = @"\"ricky%20martin\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"59wfkuBoNyhDMQGCljbUbA"]){
                NSString *jas = @"\"puff%20daddy\"";
                NSString *one = @"diddy";
                NSString *two = @"pdiddy";

                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"2gUMs9PE8XZVQyzCDqaYmW"]){
                NSString *jas = @"\"High%20School%20Musical\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"5pKCCKE2ajJHZ9KAiaK11H"]){
                NSString *jas = @"\"rihanna\"";
                NSString *one = @"riri";
                NSString *two = @"\"barbados%20babe\"";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"0p4nmQO2msCgU4IF37Wi3j"]){
                NSString *jas = @"\"Avril%20Lavigne\"";
                NSString *jass = @"\"Avril\"";
                [self.herokuSearchableStrings addObject:jass];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"0TnOYISbd1XYRBk9myaseg"]){
                NSString *jas = @"\"pitbull\"";
                NSString *one = @"\"Mr.%20Worldwide\"";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"137W8MRPWKqSmrBGDBFSop"]){
                NSString *jas = @"\"wiz%20Khalifa\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"7JQKCnl4IaJz7uMtcLScfK"]){
                NSString *local = @"\"Big%20Pun\"";
                NSString *local1 = @"\"Big%20Punisher\"";

                [self.herokuSearchableStrings addObject:local];
                [self.herokuSearchableStrings addObject:local1];

            } else if ([uri isEqualToString:@"3PhoLpVuITZKcymswpck5b"]){
               // NSLog(@"Elton John");
                NSString *local = @"Elton";
                NSString *local2 = @"\"Elton%20John\"";
                [self.herokuSearchableStrings addObject:local];
                [self.herokuSearchableStrings addObject:local2];

            } else if ([uri isEqualToString:@"6VDdCwrBM4qQaGxoAyxyJC"]){
               // NSLog(@"CWK");
                NSString *local = @"\"cold%20war%20kids\"";
                NSString *loc = @"CWK";
                [self.herokuSearchableStrings addObject:local];
                [self.herokuSearchableStrings addObject:loc];

            } else if ([uri isEqualToString:@"6zFYqv1mOsgBRQbae3JJ9e"]){
               // NSLog(@"Billy Joel");
                NSString *jas = @"\"Billy%20Joel\"";
                [self.herokuSearchableStrings addObject:jas];

            } else if ([uri isEqualToString:@"0lZoBs4Pzo7R89JM9lxwoT"]){
                // NSLog(@"Billy Joel");
                NSString *jas = @"\"Duran%20Duran\"";
//                [self.herokuSearchableStrings addObject:jas1];
                [self.herokuSearchableStrings addObject:jas];

            }   else if ([uri isEqualToString:@"3v4feUQnU3VEUqFrjmtekL"]){
                NSString *jas = @"\"The%20Faces\"";
                NSString *jas1 = @"\"Rod%20Stewart\"";
                [self.herokuSearchableStrings addObject:jas1];
                [self.herokuSearchableStrings addObject:jas];

            }   else if ([uri isEqualToString:@"3UmBeGyNwr4iDWi1vTxWi8"]){
                NSString *jas = @"\"Gerry%20&%20The%20Pacemakers\"";
                [self.herokuSearchableStrings addObject:jas];

            }   else if ([uri isEqualToString:@"57dN52uHvrHOxijzpIgu3E"]){
                NSString *jas = @"Ratatat";
                [self.herokuSearchableStrings addObject:jas];

            }   else if ([uri isEqualToString:@"35mDUnsSVfkJpgjIXHsPC5"]){
                NSString *jas = @"\"Patrick%20Sweany\"";
                [self.herokuSearchableStrings addObject:jas];

            }   else if ([uri isEqualToString:@"33EUXrFKGjpUSGacqEHhU4"]){
                NSString *jas = @"\"Iggy%20Pop\"";
                [self.herokuSearchableStrings addObject:jas];

            }   else if ([uri isEqualToString:@"2cCUtGK9sDU2EoElnk0GNB"]){
                NSString *jas = @"\"The%20National\"";
                [self.herokuSearchableStrings addObject:jas];

            }   else if ([uri isEqualToString:@"3r17AfJCCUqC9Lf0OAc73G"]){
                NSString *one = @"Fergie";
                NSString *two = @"\"Black%20eyed%20peas\"";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];

            }   else if ([uri isEqualToString:@"5INjqkS1o8h1imAzPqGZBb"]){
                NSString *one = @"\"Tame%20Impala\"";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2bS6Huqc3ZGR8LMuWUwtNe"]){
                NSString *one = @"Allison%20Taylor";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2RdwBSPQiwcmiDo9kixcl8"]){
                NSString *one = @"Pharrell";
                NSString *two = @"Pharrell%20Williams";
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"3TaUSUXn41GixL7zbvrIDt"]){
                NSString *one = @"A-Trak";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"3AA28KZvwAUcZuOKwyblJQ"]){
                NSString *one = @"Gorillaz";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"50lhyY7UVI9NyVHl79rVgk"]){
                NSString *one = @"Baio";
                NSString *two = @"Vampire%20Weekend";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];

            }   else if ([uri isEqualToString:@"5o8Wylae9k23IEJMIiwd8s"]){
                NSString *one = @"The%20Antlers";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"23fqKkggKUBHNkbKtXEls4"]){
                NSString *one = @"Kygo";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"53KwLdlmrlCelAZMaLVZqU"]){
                NSString *one = @"James%20Blake";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"0c173mlxpT3dSFRgMO8XPh"]){
                NSString *one = @"Big%20Sean";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"0E8NThqr21dCUKDFEDPpuY"]){
                NSString *one = @"How%20I%20Became the Bomb";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2jUEbzY3ihXrzqOaTV6jTF"]){
                NSString *one = @"Terraplane%20Sun";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"4OOlG5eBXSkSAAEeKjJb5Y"]){
                NSString *one = @"Courtney%20Barnett";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"4CvZd3qzC2HbLxAoAEBRIL"]){
                NSString *one = @"Benjamin%20Gibbard";
                NSString *two = @"Death%20Cab";
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"7gAYvcQFmAruyvwGjxrSUr"]){
                NSString *one = @"Absofacto";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"5kxbczSLck59eyR8GDsHd6"]){
                NSString *one = @"Army%20Navy";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"1btWGBz4Uu1HozTwb2Lm8A"]){
                NSString *one = @"Hippo%20Campus";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"0CDUUM6KNRvgBFYIbWxJwV"]){
                NSString *one = @"Dawes";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"5schNIzWdI9gJ1QRK8SBnc"]){
                NSString *one = @"Ben%20Howard";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"00dwwnz3V4kRfu3UFYpJLz"]){
                NSString *one = @"Cherub";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"5l3blxapQi6wu9e4V7BMon"]){
                NSString *one = @"Madisen%20Ward%20and%20the%20Mama%20Bear";
                NSString *two = @"Madisen%20Ward";
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"1GLtl8uqKmnyCWxHmw9tL4"]){
                NSString *one = @"The%20Kooks";
                NSString *two = @"Kooks";
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"196lKsA13K3keVXMDFK66q"]){
                NSString *one = @"Avett%20Brothers";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"4vpDg7Y7fU982Ds30zawDA"]){
                NSString *one = @"The%20Band";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"6xriZDSK3wPXhOoZXr9fzF"]){
                NSString *one = @"Rubblebucket";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"43O3c6wewpzPKwVaGEEtBM"]){
                NSString *one = @"My%20Morning%20Jacket";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2kGBy2WHvF0VdZyqiVCkDT"]){
                NSString *one = @"Father%20John%20Misty";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2WjvvwAX0mdWwq3aFuUdtc"]){
                NSString *one = @"Rebelution";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"1fZpYWNWdL5Z3wrDtISFUH"]){
                NSString *one = @"Shakey%20Graves";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2Q0MyH5YMI5HPQjFjlq5g3"]){
                NSString *one = @"Chet%20Faker";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"1Mxqyy3pSjf8kZZL4QVxS0"]){
                NSString *one = @"Frank%20Sinatra";
                NSString *two = @"Sinatra";
                NSString *three = @"ol%20blue%20eyes";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];
                [self.herokuSearchableStrings addObject:three];

            }   else if ([uri isEqualToString:@"5DK8eK7fjvRsziXzyr3sFA"]){
                NSString *one = @"Moon%20Taxi";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"4gzYX1gPVnAh5YB1MAo60t"]){
                NSString *one = @"Streets%20of%20Laredo";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"4mLJ3XfOM5FPjSAWdQ2Jk7"]){
                NSString *one = @"Dr.%20Dog";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"4S1nvNHWiZLP4rzwmULmUa"]){
                NSString *one = @"Big%20Data";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"3vbKDsSS70ZX9D2OcvbZmS"]){
                NSString *one = @"Beck";
                [self.herokuSearchableStrings addObject:one];

            }      else if ([uri isEqualToString:@"4hz8tIajF2INpgM0qzPJz2"]){
                NSString *one = @"Rainbow%20Kitten%20Surprise";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"1KP6TWI40m7p3QBTU6u2xo"]){
                NSString *one = @"BØRNS";
                NSString *two = @"Borns";
                [self.herokuSearchableStrings addObject:one];
                [self.herokuSearchableStrings addObject:two];

            }   else if ([uri isEqualToString:@"1hzfo8twXdOegF3xireCYs"]){
                NSString *one = @"Milky%20Chance";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2wwMTLM2da1sa2JcJslf8W"]){
                NSString *one = @"Heartless%20Bastards";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"3HJIB8sYPyxrFGuwvKXSLR"]){
                NSString *one = @"TV%20On%20The%20Radio";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"0hNjIdUHXWhd0dilzi6c12"]){
                NSString *one = @"Twiddle";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2RhgnQNC74QoBlaUvT4MEe"]){
                NSString *one = @"The%20Growlers";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"3kzwYV3OCB010YfXMF0Avt"]){
                NSString *one = @"Alvvays";
                [self.herokuSearchableStrings addObject:one];

            }   else if ([uri isEqualToString:@"2h93pZq0e7k5yf4dywlkpM"]){
                NSString *one = @"Frank%20Ocean";
                [self.herokuSearchableStrings addObject:one];

            }

             //********** more artists *************




         }
         NSLog(@"array count: %lu", [self.herokuSearchableStrings count]);
         NSLog(@"button logger artist array: %@", self.herokuSearchableStrings);

    //get the data from herokuArray
    //first check to see that there is an object at that location in the array passed throgh, then use that as a search form the URL heroku provided search

         //switch searchTwitter
         switch ([self.herokuSearchableStrings count]) {
             case 0:
                 NSLog(@"No search terms");
                 break;
             case 1:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 break;

             case 2:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];

                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 break;
             case 3:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];

                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 break;

            case 4:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];

                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);

                 break;

            case 5:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];

                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 break;

             case 6:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];

                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 break;

             case 7:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];

                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 break;
             case 8:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:7]];
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:7]);
                 break;
             case 9:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:7]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:8]];
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:7]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:8]);
                 break;
             case 10:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:7]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:8]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:9]];
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:7]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:8]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:9]);
                 break;
             case 11:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:7]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:8]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:9]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:10]];
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:7]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:8]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:9]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:10]);
                 break;
             case 12:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:7]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:8]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:9]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:10]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:11]];
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:7]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:8]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:9]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:10]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:11]);
                 break;
             case 13:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:7]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:8]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:9]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:10]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:11]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:12]];

                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:7]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:8]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:9]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:10]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:11]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:12]);
                 break;
             case 14:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:7]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:8]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:9]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:10]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:11]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:12]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:13]];

                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:7]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:8]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:9]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:10]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:11]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:12]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:13]);
                 break;
             case 15:
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:0]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:1]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:2]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:3]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:4]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:5]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:6]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:7]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:8]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:9]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:10]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:11]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:12]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:13]];
                 [self performTweetSearchWithKeyword:[self.herokuSearchableStrings objectAtIndex:14]];
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:0]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:1]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:2]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:3]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:4]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:5]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:6]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:7]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:8]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:9]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:10]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:11]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:12]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:13]);
                 NSLog(@"print search term 0: %@", [self.herokuSearchableStrings objectAtIndex:14]);
                 break;

             default:

                 NSLog(@"More than 11 search terms");
                 break;
         }

         //if searchTwitter
//         if ([self.herokuSearchableStrings objectAtIndex:0]) {
//             NSString *zero = [self.herokuSearchableStrings objectAtIndex:0];
//             [self performTweetSearchWithKeyword:zero];
//             NSLog(@"print search term 0: %@", zero);
//            } else{
//                NSLog(@"Nothing to search in 0");
//
//
//         } if ([self.herokuSearchableStrings objectAtIndex:1]) {
//             NSString *one = [self.herokuSearchableStrings objectAtIndex:1];
//             [self performTweetSearchWithKeyword:one];
//             NSLog(@"print search term 1: %@", one);
//            }else{
//                NSLog(@"Nothing to search in 1");



     }];

    [self.tableview reloadData];

}

-(void)viewDidAppear:(BOOL)animated{


}

#pragma mark -- helper methods
- (void)performTweetSearchWithKeyword:(NSString *)incomingString  {

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://intutvp.herokuapp.com/intutv/api/v1.0/search/twitter/%@", incomingString]];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        if (!connectionError) {
            self.twitterArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];

            //loop through JSON array
            for (NSArray *array in self.twitterArray) {

                NSDictionary *item = array[1];
                SocialMedia *socMedia = [SocialMedia new];

                //tweet body
                NSString *text = item[@"text"];
                socMedia.text = text;
           // NSLog(@"tweet: %@", socMedia.text);

                //relevance- the order to which the heroku search ranks tweets
                NSString *rele = item[@"favorite_count"];
                socMedia.relevance = rele;

                NSString *source = item[@"source"];
                socMedia.source = source;

                //screen Name
                NSDictionary *user = item[@"user"];
                NSString *screenName = user[@"screen_name"];
                NSString *screenNameAt = [NSString stringWithFormat:@"@%@", screenName];
                socMedia.screenName = screenNameAt;
            //NSLog(@"screename: %@", screenNameAt);

                //Verified
                BOOL isVerified = user[@"verified"];
                socMedia.isVerified = isVerified;
                NSString *verified = user[@"verified"];
                socMedia.verified = verified;
            //NSLog(@"verified: %@", verified);

                //....MAIN PIC......//
                NSDictionary *entities = item[@"entities"];
                if ([entities objectForKey:@"media"]) {
                    //  NSLog(@"main Image found on query level");
                    socMedia.mainImageBool = YES;

                    //pulling out mainImage data from self.media array by loop
                    NSArray *media = entities[@"media"];
                    for (NSDictionary *itemy in media) {

                        NSString *mediaURLString = itemy[@"media_url"];
                        NSURL *mediaURL = [NSURL URLWithString:mediaURLString];
                        socMedia.mainPicData = [NSData dataWithContentsOfURL:mediaURL];
                    }

                } else {
                    socMedia.mainImageBool = NO;
                }

                //Profile Pic
                NSString *userPicURL = user[@"profile_image_url_https"];
                NSURL *profileURL = [NSURL URLWithString:userPicURL];
                NSData *profileData = [NSData dataWithContentsOfURL:profileURL];
                socMedia.userPicData = profileData;
                // NSLog(@"Profile Pic from Feed: %@", userPicURL);

                //Time
                NSString *createdAt = item[@"created_at"];
           // NSLog(@"twitter time:%@", createdAt);
                //socMedia.createdLongForm = createdAt;
                NSDateFormatter *formatter = [NSDateFormatter new];
                [formatter setDateFormat:@"EEE MMM d HH:mm:ss Z yyyy"];
                NSString *dateFormattedString = [NSString stringWithFormat:@"%@", formatter];
                socMedia.createdLongForm = dateFormattedString;
                NSDate *tweetDate = [NSDate new];
                tweetDate = [formatter dateFromString:createdAt];
                NSDate *nowDate = [NSDate date];
                NSDateFormatter *format = [NSDateFormatter new];
                [format setDateFormat:@"EEE MMM d HH:mm:ss Z yyyy"];

                socMedia.timingDiff = [nowDate timeIntervalSinceDate:tweetDate];

                if (socMedia.timingDiff < 1) {
                    socMedia.timeDiff = [NSString stringWithFormat:@"now"];
                } else if (socMedia.timingDiff < 60){
                    socMedia.timeDiff = [NSString stringWithFormat:@"%fs", socMedia.timingDiff];
                } else if (socMedia.timingDiff < 3600){
                    int diffRound = round(socMedia.timingDiff / 60);
                    socMedia.timeDiff = [NSString stringWithFormat:@"%dm", diffRound];
                } else if (socMedia.timingDiff < 86400){
                    int diffRound = round(socMedia.timingDiff / 60 / 60);
                    socMedia.timeDiff = [NSString stringWithFormat:@"%dh", diffRound];
                } else if (socMedia.timingDiff < 2629743){
                    int diffRound = round(socMedia.timingDiff / 60 / 60 / 24);
                    socMedia.timeDiff = [NSString stringWithFormat:@"%dd", diffRound];
                } else if (socMedia.timingDiff < 18408201) {
                    int diffRound = round(socMedia.timingDiff / 60 / 60 / 24 / 7);
                    socMedia.timeDiff = [NSString stringWithFormat:@"%dw", diffRound];
                } else{
                    socMedia.timeDiff = [NSString stringWithFormat:@"Over a week"];
                }


                [self.socialMediaArray addObject:socMedia];


                [self.tableview reloadData];
            }
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.socialMediaArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

//    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:self.socialMediaArray];
//    NSArray *uniqueArray = [orderedSet array];
    SocialMedia *socMedia = [self.socialMediaArray objectAtIndex:indexPath.row];

    NSLog(@"cell:%@", socMedia.screenName);
    NSLog(@"from cell: %@", socMedia.text);
    NSLog(@"from cell rele: %@", socMedia.relevance);
    NSLog(@"from cell time: %@", socMedia.timeDiff);

    cell.textLabel.text = socMedia.screenName;
    cell.detailTextLabel.text = socMedia.text;
    if (socMedia.isVerified == YES) {
        cell.imageView.image = [UIImage imageNamed:@"twitter_verified_account_logo"];
    } else {
        [self.verifiedImage removeFromSuperview];
    }


    return cell;

}
    @end



