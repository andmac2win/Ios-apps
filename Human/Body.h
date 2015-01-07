//
//  Body.h
//  Human
//
//  Created by andrew Mcdonald on 1/6/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Arm;
@class Leg;
@class Head;

@interface Body : NSObject

@property (nonatomic) Arm*arm;
@property (nonatomic) Leg*leg;
@property (nonatomic) Head*head;



@end
