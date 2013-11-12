//
//  KSViewController.m
//  KSSliderExample
//
//  Created by Faruk Kuşcan on 01.11.2013.
//  Copyright (c) 2013 Faruk Kuşcan. All rights reserved.
//

#import "KSViewController.h"

@interface KSViewController ()

@end

@implementation KSViewController

@synthesize slider1;
@synthesize slider2;
@synthesize slider3;
@synthesize slider4;
@synthesize slider5;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*
     * Keys and values to fill our slider widget
     */
    NSArray *keys = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], nil];
    NSArray *values = [NSArray arrayWithObjects:@"foo", @"bar", @"joe", @"doe", nil];
    
    /*
     * Set the keys and values of first slider which is initialized in xib
     */
    [slider1 setKeys:keys values:values viewCombination:KSSliderLabelAtTop];
    [slider1 setDelegate:self];
    
    /*
     * Initialize a brand new slider widget programmatically
     */
    slider2 = [[KSSlider alloc] initWithFrame:CGRectMake(20.0f, 100.0f, 280.0f, 60.0f) values:values];
    [slider2 setDelegate:self];
    [slider2 setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:slider2];
    
    slider3 = [[KSSlider alloc] initWithFrame:CGRectMake(20.0f, 180.0f, 130.0f, 60.0f) keys:keys values:values viewCombination:KSSliderLabelAtBottom];
    [slider3 setDelegate:self];
    [slider3 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:slider3];
    
    slider4 = [[KSSlider alloc] initWithFrame:CGRectMake(170.0f, 180.0f, 130.0f, 60.0f) values:values viewCombination:KSSliderLabelAtTop];
    [slider4 setDelegate:self];
    [slider4 setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:slider4];
    
    slider5 = [[KSSlider alloc] initWithFrame:CGRectMake(20.0f, 260.0f, 180.0f, 80.0f) keys:keys values:values viewCombination:KSSliderLabelHidden];
    [slider5 setDelegate:self];
    [slider5 setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:slider5];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
