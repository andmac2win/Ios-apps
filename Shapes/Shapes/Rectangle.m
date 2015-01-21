//
//  Rectangle.m
//  Shapes
//
//  Created by andrew Mcdonald on 1/13/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "Rectangle.h"
IB_DESIGNABLE
@implementation Rectangle

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
 
 // Drawing code
    
    
//    CGRect bounds = self.bounds;
//    
//    // Figure out the center of the bounds rectangle
//    CGPoint center;                                                       This is what i did
//    center.x = bounds.origin.x + bounds.size.width / 2.0;
//    center.y = bounds.origin.y + bounds.size.height / 2.0;
//
//
//    float radius = (MIN(bounds.size.width,bounds.size.height) /2.0);
//    UIBezierPath *path = [[UIBezierPath alloc]init];
//    //add an arc to the part at the center, with radius of radius,
//    //from 0 to 2*PI radians (a circle)
//    
//    [path addArcWithCenter:center
//                    radius:radius
//                startAngle:0.0
//                  endAngle:M_PI * 2.0
//                 clockwise:YES];
//    
//    //configure line width to 10 points
//    
//    path.lineWidth = 10;
//    
//    // Draw the line!
//    [path stroke];

    CGContextRef context = UIGraphicsGetCurrentContext();
    
   // [[UIColor purpleColor] set];     //anything after this set will be this color
    [self.fillcolor set];
   // CGContextFillRect(context, rect);
    
    CGContextMoveToPoint(context, 0, 0);
    
    CGContextAddLineToPoint(context, rect.size.width, 0);
    
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    
    CGContextAddLineToPoint(context, 0, rect.size.height);

    CGContextAddLineToPoint(context,0, 0);
    
    CGContextFillPath(context);
    


}


@end
