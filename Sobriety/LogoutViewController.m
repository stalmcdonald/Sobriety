//
//  LogoutViewController.m
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/10/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import "LogoutViewController.h"

@interface LogoutViewController ()

@end

@implementation LogoutViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)logoutBttn:(id)sender {
    
    [PFUser logOut];;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
