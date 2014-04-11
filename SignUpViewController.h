//
//  SignUpViewController.h
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/3/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailEntry;
@property (weak, nonatomic) IBOutlet UITextField *usernameEntry;
@property (weak, nonatomic) IBOutlet UITextField *passwordEntry;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)didTapSignup:(id)sender;

@end
