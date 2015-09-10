//
//  JoinViewController.m
//  SpotifyTutorial
//
//  Created by Michael Sevy on 9/9/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "JoinViewController.h"
#import <Parse/Parse.h>

@interface JoinViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *email;

@end

@implementation JoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.username.delegate = self;
    self.password.delegate = self;
    self.email.delegate = self;

}

- (IBAction)onJoinButtonTapped:(id)sender {
    //white space check
    NSString *username = [self.username.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.email.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if ([username length] == 0 || [password length] == 0 || [email length] == 0) {

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Make sure you enter a Username, Password, and Email Address" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];

        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];

    } else  {

        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;

        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];

            } else {

                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}






@end






