//
//  KSViewController.h
//  KSSliderExample
//
//  Created by Faruk Kuşcan on 01.11.2013.
//  Copyright (c) 2013 Faruk Kuşcan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSSlider.h"

@interface KSViewController : UIViewController

@property (weak, nonatomic) IBOutlet KSSlider *slider1;
@property (strong, nonatomic) KSSlider *slider2;
@property (strong, nonatomic) KSSlider *slider3;
@property (strong, nonatomic) KSSlider *slider4;
@property (strong, nonatomic) KSSlider *slider5;

@end
