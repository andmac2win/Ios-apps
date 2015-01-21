//
//  ViewController.m
//  Speaking
//
//  Created by andrew Mcdonald on 1/13/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController () <MyViewDelegate>

@end

@implementation ViewController     ////ViewController created view1
{
    MyView * view1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    view1 = [[MyView alloc] init];

    view1.delegate = self;
    
   // view1.name = @"Bob";
    
    NSLog(@"view1 name =%@",view1.name);
                 
                //this is letting view1 contact with self
}



-(void)changeMyNameTo:(NSString *)name {
    
    //view1.name = name;
    NSLog(@"%@",name);
    
    view1.name = name;
    
    NSLog(@"view1 new name = %@",view1.name);
    

    
}

@end
