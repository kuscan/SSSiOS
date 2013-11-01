//
//  KSSlider.m
//  KSSliderExample
//
//  Created by Faruk Kuşcan on 01.11.2013.
//  Copyright (c) 2013 Faruk Kuşcan. All rights reserved.
//

#import "KSSlider.h"

@implementation KSSlider

@synthesize slider;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // TODO implement the initWithFrame method
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 30.0f)];
        [label setText:@"faruk"];
        [self addSubview:label];
        
        [slider addTarget:self action:@selector(sliderDidEndSliding) forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
