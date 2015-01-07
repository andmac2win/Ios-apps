//
//  ViewController.m
//  FirstApp
//
//  Created by andrew Mcdonald on 1/5/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end


@implementation ViewController


- (IBAction)bigButtonPressed:(id)sender {
    
    self.myLabel.text = self.myTextField.text;
}


@end