//
//  JournalViewController.h
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/3/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JournalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *item;
- (IBAction)addItem:(id)sender;

@end
