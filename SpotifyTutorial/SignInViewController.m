//
//  SignInViewController.m
//  SpotifyTutorial
//
//  Created by Michael Sevy on 9/9/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "SignInViewController.h"
#import <Parse/Parse.h>

@interface SignInViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.username.delegate = self;
    self.password.delegate = self;

}



- (IBAction)onLoginButtonTapped:(id)sender {

    NSString *username = [self.username.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];


    if ([username length] == 0 || [password length] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Make sure you enter username and password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];

        [self presentViewController:alert animated:YES completion:nil];
        [alert addAction:action];

    } else  {

        //logs user is, checks to see if the current user matches with Parse from uitextfields
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error){
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

                [alert show];
            } else{
                //if user is valid pops back to Inbox VC
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //delegate methods that hides first responder when enter is hit from the UItextfield
    [textField resignFirstResponder];
    return YES;
}




@end






