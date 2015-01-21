//
//  Robot.m
//  Speaking
//
//  Created by andrew Mcdonald on 1/13/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "Robot.h"

@implementation Robot
//{
//    int powerLevel;
//}

-(void)cleanHouse {
    //find out from delgate how many rooms need to be cleaned ///////////////////
    int rooms = [self.delegate howManyRoomsDoIHaveToClean];

    NSLog(@"Robot starts cleaning %d rooms",rooms);
}

-(void)dance {
    //find out what type f jig to do
    NSString * danceStyle = [self.delegate whatTypeofDance];
    
    NSLog(@"Robot starts to %@",danceStyle);
    
    
}

-(void)checkPower {
    
}

@end
