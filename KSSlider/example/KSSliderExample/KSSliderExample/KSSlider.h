//
//  KSSlider.h
//  KSSliderExample
//
//  Created by Faruk Kuşcan on 01.11.2013.
//  Copyright (c) 2013 Faruk Kuşcan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSSlider : UIView

@property (strong,nonatomic) id delegate;
@property (strong, nonatomic) NSArray *items;
@property (nonatomic) NSInteger currentItemIndex;
@property (strong, nonatomic) UIView *topLevelView;
@property (weak, nonatomic) UISlider *slider;
@property (weak, nonatomic) UILabel *label;

- (void)setItems:(NSArray *)itemList;
- (void)setSelectedItemIndex:(NSInteger)index;
- (IBAction)sliderDidValueChange:(id)sender;

@end
