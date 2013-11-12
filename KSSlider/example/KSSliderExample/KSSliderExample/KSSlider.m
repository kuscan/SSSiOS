//
//  KSSlider.m
//  KSSliderExample
//
//  Created by Faruk Kuşcan on 01.11.2013.
//  Copyright (c) 2013 Faruk Kuşcan. All rights reserved.
//

#import "KSSlider.h"

@interface KSSlider ()

@property (nonatomic, assign) SEL kssliderSelectedItemAtIndexSelector;

@end

@implementation KSSlider

@synthesize delegate;
@synthesize slider;
@synthesize label;
@synthesize keyList;
@synthesize valueList;
@synthesize currentItemIndex;
@synthesize selectedViewCombination;

@synthesize kssliderSelectedItemAtIndexSelector;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initSliderAndLabel];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initSliderAndLabel];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        // TODO implement the init method
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame values:(NSArray *)values
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initSliderAndLabel];
        [self setValueList:values];
        [self kssliderDidEndSliding];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame keys:(NSArray *)keys values:(NSArray *)values
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initSliderAndLabel];
        [self setValueList:values];
        [self setKeyList:keys];
        [self kssliderDidEndSliding];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame values:(NSArray *)values viewCombination:(KSSliderViewCombination)viewCombination
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setSelectedViewCombination:viewCombination];
        [self initSliderAndLabel];
        [self setValueList:values];
        [self kssliderDidEndSliding];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame keys:(NSArray *)keys values:(NSArray *)values viewCombination:(KSSliderViewCombination)viewCombination
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setSelectedViewCombination:viewCombination];
        [self initSliderAndLabel];
        [self setValueList:values];
        [self setKeyList:keys];
        [self kssliderDidEndSliding];
    }
    return self;
}

- (void)setValues:(NSArray *)values
{
    [self initSliderAndLabel];
    [self setValueList:values];
    [self kssliderDidEndSliding];
}

- (void)setKeys:(NSArray *)keys values:(NSArray *)values
{
    [self initSliderAndLabel];
    [self setValueList:values];
    [self setKeyList:keys];
    [self kssliderDidEndSliding];
}

- (void)setValues:(NSArray *)values viewCombination:(KSSliderViewCombination)viewCombination
{
    [self setSelectedViewCombination:viewCombination];
    
    [self initSliderAndLabel];
    [self setValueList:values];
}

- (void)setKeys:(NSArray *)keys values:(NSArray *)values viewCombination:(KSSliderViewCombination)viewCombination
{
    [self setSelectedViewCombination:viewCombination];
    [self initSliderAndLabel];
    [self setValueList:values];
    [self setKeyList:keys];
    [self kssliderDidEndSliding];
}

- (void)initSliderAndLabel
{
    if (label == nil)
    {
        label = [[UILabel alloc] init];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextAlignment:NSTextAlignmentCenter];
    }
    if (slider == nil)
    {
        slider = [[UISlider alloc] init];
        [slider addTarget:self action:@selector(kssliderDidChange) forControlEvents:UIControlEventValueChanged];
        [slider addTarget:self action:@selector(kssliderDidEndSliding) forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
    }
    
    if (selectedViewCombination == KSSliderLabelAtLeft)
    {
        [label setFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width * 1 / 3, self.frame.size.height)];
        [slider setFrame:CGRectMake(label.frame.size.width, 0.0f, self.frame.size.width - label.frame.size.width, self.frame.size.height)];
    }
    else if (selectedViewCombination == KSSliderLabelAtTop)
    {
        [label setFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height / 2)];
        [slider setFrame:CGRectMake(0.0f, label.frame.size.height, self.frame.size.width, self.frame.size.height - label.frame.size.height)];
    }
    else if (selectedViewCombination == KSSliderLabelAtRight)
    {
        [slider setFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width * 2 / 3, self.frame.size.height)];
        [label setFrame:CGRectMake(self.frame.size.width * 2 / 3, 0.0f, self.frame.size.width - slider.frame.size.width, self.frame.size.height)];
    }
    else if (selectedViewCombination == KSSliderLabelAtBottom)
    {
        [slider setFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height / 2)];
        [label setFrame:CGRectMake(0.0f, slider.frame.size.height, self.frame.size.width, self.frame.size.height - slider.frame.size.height)];
    }
    else if (selectedViewCombination == KSSliderLabelHidden)
    {
        [slider setFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height)];
    }
    
    if (label.superview == nil)
    {
        [self addSubview:label];
    }
    if (slider.superview == nil)
    {
        [self addSubview:slider];
    }
}

- (void)initDelegateMethods
{
    kssliderSelectedItemAtIndexSelector = NSSelectorFromString(@"ksslider:selectedItemAtIndex:");
    NSMethodSignature *sign1 = [NSMutableArray instanceMethodSignatureForSelector:kssliderSelectedItemAtIndexSelector];
    NSInvocation *inv1 = [NSInvocation invocationWithMethodSignature:sign1];
    [inv1 setTarget:delegate];
    [inv1 setSelector:kssliderSelectedItemAtIndexSelector];
    [inv1 setArgument:(__bridge void *)(self) atIndex:2];
    [inv1 setArgument:&currentItemIndex atIndex:3];
}

- (void)kssliderDidChange
{
    for (int i = 0; i < valueList.count; i++)
    {
        if (slider.value < (( 1.0f / ( 2 * ( valueList.count - 1 ))) + ( i * ( 1.0f / ( valueList.count - 1 )))))
        {
            currentItemIndex = i;
            break;
        }
    }
    
    if ([[valueList objectAtIndex:currentItemIndex] isKindOfClass:[NSString class]])
    {
        [label setText:[valueList objectAtIndex:currentItemIndex]];
    }
    
//    if (delegate != nil && [delegate respondsToSelector:@selector(ksslider:selectedItemAtIndex:)])
//    {
//        
//    }
//    if (delegate != nil && [delegate respondsToSelector:@selector(kssliderDidChangeValue:)])
//    {
//        [delegate performSelector:@selector(kssliderDidChangeVelue:) withObject:[valueList objectAtIndex:currentItemIndex]];
//    }
}

- (void)kssliderDidEndSliding
{
    [slider setValue:(currentItemIndex * ( 1.0f / ( valueList.count - 1 )))];
    if ([[valueList objectAtIndex:currentItemIndex] isKindOfClass:[NSString class]])
    {
        [label setText:[valueList objectAtIndex:currentItemIndex]];
    }
    
//    if (delegate != nil && [delegate respondsToSelector:@selector(kssliderDidEndSlidingWithKey:value:)])
//    {
//        [delegate performSelector:@selector(kssliderDidEndSlidingWithKey:value:) withObject:[keyList objectAtIndex:currentItemIndex] withObject:[valueList objectAtIndex:currentItemIndex]];
//    }
//    if (delegate != nil && [delegate respondsToSelector:@selector(kssliderDidEndSlidingWithValue:)])
//    {
//        [delegate performSelector:@selector(kssliderDidEndSlidingWithValue:) withObject:[valueList objectAtIndex:currentItemIndex]];
//    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
