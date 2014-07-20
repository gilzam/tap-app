//
//  ViewController.m
//  Tap App 1
//
//  Created by Gil Zamir on 7/18/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tapDisplay;

@end

@implementation ViewController

#import <AudioToolbox/AudioToolbox.h>

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"View loaded");
    oneFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doOneFingerTap:)];
    [oneFingerTap setNumberOfTapsRequired:1];
    [oneFingerTap setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneFingerTap];
    
    twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTwoFingerTap:)];
    [twoFingerTap setNumberOfTapsRequired:1];
    [twoFingerTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerTap];

    // Initialize the tap counter on view load
    tapCounter = [[TapCounter alloc] init];
    winning = true;
    
//    self.tapDisplay.text = [NSString stringWithFormat:@"%d", [tapCounter getTapCount]];
    [self updateView:@"Tap until you feel a vibration!"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doOneFingerTap:(UITapGestureRecognizer *) sender
{
    if ([sender state] == UIGestureRecognizerStateRecognized)
    {
        NSLog(@"Tap detected");
        // Here's where you trigger whatever action you need to.
        // In this example, you want to increment |tapCounter| and log it.
        // You will also want to trigger a vibration here.
        [tapCounter incrementTapCount];
        NSLog(@"Current tapCount: %ld", (long)[tapCounter getTapCount]);
        if ([tapCounter tapsEqualsBreakNumber]) {
            NSLog(@"Taps Equals Break Number!");
            [self vibrate];
            [self performSelector:@selector(checkForWin) withObject:nil afterDelay:1.5];
        } else if ([tapCounter tapsExceedsBreakNumber]) {
            NSLog(@"Taps Exceeds Break Number!");
            winning = false;
            [NSObject cancelPreviousPerformRequestsWithTarget:self];
            [self performSelector:@selector(checkForWin) withObject:nil afterDelay:.0001];
            [self checkForWin];
        }
        [self updateView:@""];
    }
}


- (void)doTwoFingerTap:(UITapGestureRecognizer *) sender
{
    if ([sender state] == UIGestureRecognizerStateRecognized)
    {
        [self restartGame];
    }
}

// When the view disappears (say you press the home button), reset the tapCount
// Of course, you may want instead to just stop the timer, but that's your decision.
- (void)viewDidDisappear:(BOOL)animated
{
    [tapCounter resetTapCount];
}

- (void)updateView:(NSString *)text;
{
    self.tapDisplay.text = text;
}

- (void)checkForWin
{
    if ([tapCounter getTapCount] != 0) {
        oneFingerTap.enabled = false;
        if (winning) {
            [self runWin];
        } else {
            [self runLose];
        }
    }
}

- (void)runWin
{
    NSLog(@"runWin:");
    [self updateView:@"You win! Two finger tap to restart!"];
}

- (void)runLose
{
    NSLog(@"runLose:");
    [self updateView:@"You lost...two finger tap to restart."];
}

- (void)restartGame
{
    [tapCounter resetTapCount];
    winning = true;
    oneFingerTap.enabled = true;
    [self updateView:@"Tap until you feel a vibration!"];
}

- (void)vibrate
{
    NSLog(@"Vibrate");
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    AudioServicesPlaySystemSoundWithVibration(kSystemSoundID_Vibrate, nil,NSDictionary* vibratePattern)

}

@end
