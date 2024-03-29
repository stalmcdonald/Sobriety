//
//  LoginViewController.m
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/2/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usernameCredentials, passwordCredentials, activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Login";
    
    [usernameCredentials setDelegate:self];
    [passwordCredentials setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//once username and password entered there's a check to make sure password length is <5
- (IBAction)didTapLogin:(id)sender {
    
    NSString *username = [usernameCredentials text];
    NSString *password = [passwordCredentials text];
    
    if ([username length] < 5 || [password length] < 5) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Username and Password must both be at least 5 characters long." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    } else {
        [activityIndicator startAnimating];
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            [activityIndicator stopAnimating];
            if (user) {
                [self performSegueWithIdentifier:@"loginToMain" sender:self];
            } else {
                NSLog(@"%@",error);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed." message:@"Check internet connection/Enter valid info." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                [alert show];
            }
        }];
    }
}

//goes back if nav button pressed
- (void)didTapBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
