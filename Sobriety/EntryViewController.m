//
//  EntryViewController.m
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/2/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import "EntryViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

@interface EntryViewController ()

-(void)reachabilityChanged:(NSNotification*)note;

@end

@implementation EntryViewController

@synthesize networkLabel, networkNotify;

@synthesize actiIndi, loginBttn, signupBttn;

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
	// Do any additional setup after loading the view.
     [self checkStatus];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    reach.reachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            networkLabel.text = @"Network Status: ONLINE";
        });
    };
    
    reach.unreachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            networkLabel.text = @"Network Status: OFFLINE";
        });
    };
    
    [reach startNotifier];
}

//comment code below to prompt login each time
- (void)viewDidAppear:(BOOL)animated {
//    [self checkStatus];
}

//checks status of user login/signup if its yes goes to TabViewController to show MainView
- (void)checkStatus {
    [actiIndi startAnimating];
    [loginBttn setHidden:YES];
    [signupBttn setHidden:YES];
    
    if ([PFUser currentUser]) {
        [self performSegueWithIdentifier:@"enterMain" sender:self];
    } else {
        [actiIndi stopAnimating];
        [loginBttn setHidden:NO];
        [signupBttn setHidden:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
        networkNotify.text = @"Notification";
    }
    else
    {
        networkNotify.text = @"Offline features limited";
    }
}


//automatically skips code below if user is logged in/signed up

//if user is signed out this button goes to login screen
- (IBAction)LoggingIn:(id)sender {
    [self performSegueWithIdentifier:@"enterToLogin" sender:self];
}

//if user needs to sign up this button goes to the signup page
- (IBAction)signingUp:(id)sender {
    [self performSegueWithIdentifier:@"enterToSignup" sender:self];
}
@end