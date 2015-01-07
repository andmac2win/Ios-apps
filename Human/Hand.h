//
//  Hand.h
//  Human
//
//  Created by andrew Mcdonald on 1/6/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Thumb;
@class Finger;

@interface Hand : NSObject


@property (nonatomic) Finger * firstFinger;
@property (nonatomic) Finger * secondFinger;
@property (nonatomic) Finger * thirdFinger;
@property (nonatomic) Finger * fourthFinger;

@property (nonatomic) Thumb * thumb;

@end
