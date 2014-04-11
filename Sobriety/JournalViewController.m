//
//  JournalViewController.m
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/3/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import "JournalViewController.h"

@interface JournalViewController ()

@end

@implementation JournalViewController

@synthesize item;
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
    [item becomeFirstResponder];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == item)
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    else
        return YES;
}

- (IBAction)addItem:(id)sender {
    //saves user in parse class "users"
    PFObject *apology = [PFObject objectWithClassName:@"apologyList"];
    [apology setObject:item.text forKey:@"item"];
    
        [apology saveInBackground];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sobriety"
                                                    message:@"Person added to apology list."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    item.text=@"";
    
}


@end
