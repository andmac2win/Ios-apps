//
//  SickSlider.h
//  Capture
//
//  Created by andrew Mcdonald on 1/21/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SickSliderDelegate;

IB_DESIGNABLE

@interface SickSlider : UIView

@property (nonatomic) IBInspectable float startPosition;
@property (nonatomic) IBInspectable UIColor * sliderColor;
@property (nonatomic) IBInspectable BOOL reverseColor;

@property (nonatomic,assign) id <SickSliderDelegate> delgate;

@end

@protocol SickSliderDelegate <NSObject>

- (void)sliderDidFinishUpdatingWithValue:(float)value;

@end
