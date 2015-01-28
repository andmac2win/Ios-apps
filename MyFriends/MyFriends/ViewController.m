//
//  ViewController.m
//  MyFriends
//
//  Created by andrew Mcdonald on 1/22/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
// go to documentation in parse in user and password \.

//on user there there is a array

//empty tableview controller for list of friends
// with x button to dismiss with toolbar with button with "Add Selected"
// build two differnet cell types in use identifier.tis is in storyboard