//
//  ViewController.h
//  FirstApp
//
//  Created by andrew Mcdonald on 1/5/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

-(IBAction)
bigButtonPressed:(id)
sender;

@end

