//
//  ViewController.m
//  Tap App 1
//
//  Created by Gil Zamir on 7/18/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"View loaded"); //try logging meaningful events for easy debugging
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [tapGesture setNumberOfTapsRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    // Initialize the tap counter on view load
    tapCounter = [[TapCounter alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *) sender
{
    if ([sender state] == UIGestureRecognizerStateRecognized)
    {
        NSLog(@"Tap detected");
        // Here's where you trigger whatever action you need to.
        // In this example, you want to increment |tapCounter| and log it.
        // You will also want to trigger a vibration here.
        [tapCounter incrementTapCount];
        NSLog(@"Current tapCount: %ld", (long)[tapCounter getTapCount]);
    }
}

// When the view disappears (say you press the home button), reset the tapCount
// Of course, you may want instead to just stop the timer, but that's your decision.
- (void)viewDidDisappear:(BOOL)animated
{
    [tapCounter resetTapCount];
}

@end
