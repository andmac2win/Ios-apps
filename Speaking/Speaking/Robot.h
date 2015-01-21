//
//  Robot.h
//  Speaking
//
//  Created by andrew Mcdonald on 1/13/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RobotDelgate;

@interface Robot : NSObject

-(void)cleanHouse;
-(void)dance;
@property (nonatomic,assign) id <RobotDelgate> delegate;



@end

@protocol RobotDelgate <NSObject>


-(int)howManyRoomsDoIHaveToClean;


-(NSString *)whatTypeofDance;
@optional
- (int)howMuchPowerCanIHave;




@end
