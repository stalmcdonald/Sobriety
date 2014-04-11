//
//  MainViewController.h
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/3/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : PFQueryTableViewController

{
    NSString *List;
    NSDictionary *params;
    NSInteger counter;
    NSInteger refresh;
}

- (IBAction)logoutBttn :(id)sender;

//Network connection status
@property (assign, nonatomic) IBOutlet UILabel * networkLabel;
@property (assign, nonatomic) IBOutlet UILabel * networkNotify;

@end
