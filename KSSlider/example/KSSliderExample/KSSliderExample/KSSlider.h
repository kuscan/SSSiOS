//
//  KSSlider.h
//  KSSliderExample
//
//  Created by Faruk Kuşcan on 01.11.2013.
//  Copyright (c) 2013 Faruk Kuşcan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum KSSliderViewCombination : NSInteger KSSliderViewCombination;
enum KSSliderViewCombination : NSInteger
{
    KSSliderLabelAtLeft = 0,
    KSSliderLabelAtTop = 1,
    KSSliderLabelAtRight = 2,
    KSSliderLabelAtBottom = 3,
    KSSliderLabelHidden = 4
};

@interface KSSlider : UIView

@property   (strong, nonatomic)     id                          delegate;
@property   (strong, nonatomic)     UISlider                    *slider;
@property   (strong, nonatomic)     UILabel                     *label;
@property   (strong, nonatomic)     NSArray                     *keyList;
@property   (strong, nonatomic)     NSArray                     *valueList;
@property   (nonatomic)             NSInteger                   currentItemIndex;
@property   (nonatomic)             KSSliderViewCombination     selectedViewCombination;

- (id)initWithFrame:(CGRect)frame values:(NSArray *)values;
- (id)initWithFrame:(CGRect)frame keys:(NSArray *)keys values:(NSArray *)values;
- (id)initWithFrame:(CGRect)frame values:(NSArray *)values viewCombination:(KSSliderViewCombination)viewCombination;
- (id)initWithFrame:(CGRect)frame keys:(NSArray *)keys values:(NSArray *)values viewCombination:(KSSliderViewCombination)viewCombination;
- (void)setValues:(NSArray *)values;
- (void)setKeys:(NSArray *)keys values:(NSArray *)values;
- (void)setValues:(NSArray *)values viewCombination:(KSSliderViewCombination)viewCombination;
- (void)setKeys:(NSArray *)keys values:(NSArray *)values viewCombination:(KSSliderViewCombination)viewCombination;


@end
