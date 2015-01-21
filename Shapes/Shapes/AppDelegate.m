//
//  AppDelegate.m
//  Shapes
//
//  Created by andrew Mcdonald on 1/13/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "AppDelegate.h"
#import "Rectangle.h"
//#import "Ellipse.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


//Excerpt From: Conway, Joe. “iOS Programming: The Big Nerd Ranch Guide (4th Edition) (Big Nerd Ranch Guides).” iBooks.

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    


        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        CGRect firstFrame = CGRectMake(160, 240, 100, 150);
        
        Rectangle *firstView = [[Rectangle alloc] initWithFrame:firstFrame];
        firstView.backgroundColor = [UIColor redColor];
        
    [self.window addSubview:firstView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:firstView];
    
    
//    CGRect secondFrame = CGRectMake(20, 30, 50, 70);
//    
//    Rectangle *secondView = [[Rectangle alloc] initWithFrame:secondFrame];
//    secondView.backgroundColor = [UIColor blueColor];
//    [self.window addSubview:secondView];
//    
//    
//    CGRect thirdFrame = CGRectMake(10, 20, 70, 50);
//    
//    Rectangle *thirdView = [[Rectangle alloc] initWithFrame:thirdFrame];
//    thirdView.backgroundColor = [UIColor greenColor];
//    
//    [self.window addSubview:thirdView];
//    
    
    return YES;
    
         


//Excerpt From: Conway, Joe. “iOS Programming: The Big Nerd Ranch Guide (4th Edition) (Big Nerd Ranch Guides).” iBooks.
//- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
