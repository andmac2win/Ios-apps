//
//  Ellipse.m
//  Shapes
//
//  Created by andrew Mcdonald on 1/13/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "Ellipse.h"
IB_DESIGNABLE
@implementation Ellipse


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //[[UIColor greenColor] set];
    [self.fillcolor set];
    
    CGContextFillEllipseInRect(context, rect);
    
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    CGFloat xCP = w /4;
    
    CGFloat yCP = h /4;
    
   
    CGContextMoveToPoint(context,w / 2, 0);

    CGContextAddCurveToPoint(context,w -xCP, 0, w, yCP,w,h /2);
    
    CGContextAddCurveToPoint(context, w, h -yCP, w - xCP, h, w/2, h);
    
    CGContextAddCurveToPoint(context, xCP, h, 0, h - yCP, 0, h / 2);
    
    CGContextAddCurveToPoint(context,0, yCP, xCP, 0, w /2, 0);
    
    CGContextFillPath(context);
    
    
    
    

    
    

}


@end
