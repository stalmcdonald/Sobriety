//
//  EntryViewController.h
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/2/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actiIndi;
@property (weak, nonatomic) IBOutlet UIButton *loginBttn;
@property (weak, nonatomic) IBOutlet UIButton *signupBttn;

//Network connection status
@property (assign, nonatomic) IBOutlet UILabel * networkLabel;
@property (assign, nonatomic) IBOutlet UILabel * networkNotify;

- (IBAction)LoggingIn:(id)sender;
- (IBAction)signingUp:(id)sender;

@end
