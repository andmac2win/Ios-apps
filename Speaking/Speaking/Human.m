//
//  Human.m
//  Speaking
//
//  Created by andrew Mcdonald on 1/13/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "Human.h"
#import "Robot.h"


@interface Human () <RobotDelgate>

@end

@implementation Human

-(void)makeRobot {
    
    Robot * oldRustyRobot = [[Robot alloc] init];

    oldRustyRobot.delegate = self;
    
    [oldRustyRobot cleanHouse];
    [oldRustyRobot dance];
    
}

-(NSString *)whatTypeofDance {
    
    return @"The Robot";
}

-(int)howManyRoomsDoIHaveToClean {
    
    return 1000000;
}

@end
