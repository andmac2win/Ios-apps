//
//  ViewController.h
//  Basics
//
//  Created by andrew Mcdonald on 1/5/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *myUserNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *myEmailTextField;


@property (weak, nonatomic) IBOutlet UITextField *myPasswordTextField;

- (IBAction)myLogingButtonPressed:(id)sender;

- (IBAction)myClearButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *MyLogingButton;


@property (weak, nonatomic) IBOutlet UIButton *MyClearButton;

@end

