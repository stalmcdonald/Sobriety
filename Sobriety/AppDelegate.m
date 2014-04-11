//
//  AppDelegate.m
//  Sobriety
//
//  Created by CRYSTAL MCDONALD on 4/2/14.
//  Copyright (c) 2014 CRYSTAL MCDONALD. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"
#import "EntryViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [Parse setApplicationId:@"24SDXdcHTevS3M0nUw4NCcciNoMn9zy4J4qsCHLD"
                  clientKey:@"8drJzkP8FTQNylRVj4aKSzVstzpZHfIV8hHRbgfb"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    PFUser *user = [PFUser currentUser];
    [user refreshInBackgroundWithBlock:^(PFObject *object, NSError *error) {
      
    }];
    
    // Initialize Reachability
    Reachability *reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    reachability.reachableBlock = ^(Reachability *reachability) {
        NSLog(@"Network Connection.");
    };
    
    reachability.unreachableBlock = ^(Reachability *reachability) {
        NSLog(@"No Network Connection.");
    };
    
    // Start Monitoring
    [reachability startNotifier];
    

    
    return YES;
}
							



- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}
@end
