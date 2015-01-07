//
//  Finger.m
//  Human
//
//  Created by andrew Mcdonald on 1/6/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "Finger.h"

@implementation Finger
@synthesize fingerPrint=_fingerPrint;

// NSString * fingerPrint = finger.fingerPrint;
- (NSString *)fingPrint {
    return _fingerPrint;
}

//finger.fingerPrint =@"fingerPrint";

-(void)setFingerPrint:(NSString *)fingerPrint {
    _fingerPrint =fingerPrint;
}

@end
