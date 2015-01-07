//
//  ViewController.m
//  Basics
//
//  Created by andrew Mcdonald on 1/5/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "ViewController.h"

//create 2 View Controllers
//- View controller 1
// -2 buttons one will clear textfields, one will log all textfields)
// -3 textfields (username, e,ail , password)

//-password field should look like one ny hiding the text with dots (look in the right panel)
//-email field should use email keyboard *also in right panel)

//view controller 2
// -4 buttons differnet color backgrounds
//-each button changes the main controller's background color,all 4 buttons triggering the same method

//add contraints
//make the buttons on view controller 2 circles with no text

@interface ViewController ()





@end
@implementation  ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.MyLogingButton.layer.cornerRadius =13;
    self.MyLogingButton.layer.masksToBounds =YES;
    
    self.MyClearButton.layer.cornerRadius =13;
    self.MyClearButton.layer.masksToBounds =YES;
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)myLogingButtonPressed:(id)sender {
    
    NSLog(@"The Text of the UserName is %@", self.myUserNameTextField.text);
    NSLog(@"The Text of the Email is %@", self.myEmailTextField.text);
    NSLog(@"The Text of the Password is %@", self.myPasswordTextField.text);}

//wrote code individualy with different pointers that exist in my Ui "references"

- (IBAction)myClearButtonPressed:(id)sender {
    
    self.myUserNameTextField.text= @"";
    self.myEmailTextField.text= @"";
    self.myPasswordTextField.text= @"";
    
    
    
    
    
    
    
    
    
    
}
@end