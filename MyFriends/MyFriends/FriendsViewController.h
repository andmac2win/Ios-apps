//
//  FriendsViewController.h
//  MyFriends
//
//  Created by andrew Mcdonald on 1/23/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

@interface FriendsViewController : UITableViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

-(IBAction)logOutButtonTapAction:(id)sender;

@end
