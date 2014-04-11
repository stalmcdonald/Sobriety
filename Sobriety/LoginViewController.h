//
//  LoginViewController.h
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/2/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameCredentials;
@property (weak, nonatomic) IBOutlet UITextField *passwordCredentials;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)didTapLogin:(id)sender;

@end
