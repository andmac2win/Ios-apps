//
//  ViewController.m
//  ScribbleTouch
//
//  Created by andrew Mcdonald on 1/14/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableDictionary * currentScribble;
    UIColor * selectedColor;
    int selectedStrokeWidth;
    UIColor * fillColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    selectedColor = [UIColor blackColor];
    fillColor = [UIColor clearColor];
    selectedStrokeWidth =1;
   
}
- (IBAction)changeColor:(UIButton *)sender {
    
    selectedColor = sender.backgroundColor;
    
    
    
    
}
- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
    selectedStrokeWidth = sender.value;
    
    
}
- (IBAction)changeFillColor:(UIButton *)sender {
    
    fillColor = sender.backgroundColor;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
        
        UITouch * touch = touches.allObjects.firstObject;           //this is a geter method
        
        CGPoint location = [touch locationInView:self.view];
        
        //NSLog(@"x %f j %f", location.x,location.y);
        
        currentScribble = [@{
                             
                             @"type":@"path",
                             @"fillColor":fillColor,
                             @"strokeColor":selectedColor,
                             @"strokeWidth":@(selectedStrokeWidth),
                             @"points":[@[[NSValue valueWithCGPoint:location]] mutableCopy]
                             
                             
                             }mutableCopy];
        
        ScribbleView * sView = (ScribbleView *)self.view;
        
        [sView. scribbles addObject:currentScribble];  ///this is running the getter
        
      //  [((ScribbleView *)self.view).scribbles addObject:currentScribble];            same method as above
        
        
        
        
    }
-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *) event; {
    
    UITouch * touch = touches.allObjects.firstObject;           //this is a geter method
    
    CGPoint location = [touch locationInView:self.view];
    

    [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    
    [self.view setNeedsDisplay];
}

@end
