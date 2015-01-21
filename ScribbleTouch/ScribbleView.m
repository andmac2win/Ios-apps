//
//  ScribbleView.m
//  ScribbleTouch
//
//  Created by andrew Mcdonald on 1/14/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "ScribbleView.h"

@implementation ScribbleView


//    @[
//
//    @{
//    @"type":@"path",
//    @"fillColor": [UIColor greenColor],
//    @"strokeColor": [UIColor blackColor],
//    @"strokeWidth":@2,                                dictionary
//    @"points":@[point,point,Point]
//
//    },
//
//    @{
//    @"type":@"circle",
//    @"fillColor": [UIColor greenColor],
//    @"strokeColor": [UIColor blackColor],
//    @"strokeWidth":@2,
//    @"frame":CGRect
//
//    }
//
//    ];



//
-(NSMutableArray *)scribbles {
//    
    if (_scribbles ==nil) {_scribbles = [@[] mutableCopy]; }
        return _scribbles;
//
}
//
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineJoin(context, kCGLineJoinRound);//nice round lines point and end
    CGContextSetLineCap(context, kCGLineCapRound);
    
    for (NSDictionary * scribble in self.scribbles) {
        CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
        
        UIColor * strokeColor = scribble[@"strokeColor"];
        [strokeColor set];
        
        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
        CGContextMoveToPoint(context, firstPoint.x,firstPoint.y);
        
        for (NSValue * pointValue in scribble[@"points"]){
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
       
        }
        
    CGContextStrokePath(context);

    
        
        UIColor * fillColor = scribble[@"fillColor"];
        [fillColor set];
        
        CGContextMoveToPoint(context, firstPoint.x,firstPoint.y);
        
        
        for (NSValue * pointValue in scribble[@"points"]){
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);

        
                                               
        
        }
        CGContextFillPath(context);
    }
}

@end
