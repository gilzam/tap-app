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
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

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
    
    longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(doTwoFingerTap:)];
    [self.view addGestureRecognizer:longPress];

    twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTwoFingerTap:)];
    [twoFingerTap setNumberOfTapsRequired:1];
    [twoFingerTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerTap];

    gameState = [[GameState alloc] init];
    tapCounter = [[TapCounter alloc] init];
    [gameState setWinning:true];
    maxMilliseconds = 300;
    wins = 0;
    level = 1;
//    [NSTimer scheduledTimerWithTimeInterval:2.0
//                                     target:self
//                                   selector:@selector(vibrate)
//                                   userInfo:nil
//                                    repeats:NO];
    

    
//    self.tapDisplay.text = [NSString stringWithFormat:@"%d", [tapCounter getTapCount]];
    [self updateView:@"Tap the screen and keep tapping!\nOnce you feel a vibration, stop tapping to win!"];
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
        [tapCounter incrementTapCount];
        if ([tapCounter getTapCount] == 1) {
            milliseconds = maxMilliseconds;
            timer = [NSTimer scheduledTimerWithTimeInterval:.001 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
//            start = [NSDate date];
            //[TimerController startTimer];
        }
        milliseconds = maxMilliseconds;
        NSLog(@"Current tapCount: %ld", (long)[tapCounter getTapCount]);
        if ([tapCounter getTapCount] == [gameState getTapBreakNumber]) {
            NSLog(@"Taps Equals Break Number!");
            [self vibrate];
            [self performSelector:@selector(checkForWin) withObject:nil afterDelay:maxMilliseconds/100*.5];
        } else if ([tapCounter getTapCount] > [gameState getTapBreakNumber]) {
            NSLog(@"Taps Exceeds Break Number!");
            [gameState setWinning:false];
            [NSObject cancelPreviousPerformRequestsWithTarget:self];
            [self performSelector:@selector(checkForWin) withObject:nil afterDelay:0];
            [self checkForWin];
        }
        [self updateView:@""];
    }
}


- (void)doTwoFingerTap:(UITapGestureRecognizer *) sender
{
    if ([sender state] == UIGestureRecognizerStateRecognized)
    {
        [tapCounter resetTapCount];
        oneFingerTap.enabled = true;
        milliseconds = maxMilliseconds;
        if (timer) {
            [timer invalidate];
            timer = nil;
        }
        [self updateView:@"Tap the screen and keep tapping!\nOnce you feel a vibration, stop tapping to win!"];
        
        [gameState resetGameState];
    }
}

- (void)timerTick:(NSTimer *)timer {
    milliseconds--;
    if (milliseconds <= 0) {
        [gameState setWinning:false];
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        [self performSelector:@selector(checkForWin) withObject:nil afterDelay:0];
        [self checkForWin];
    }
    [self updateView:@""];
}

- (void)checkForWin
{
    if ([tapCounter getTapCount] != 0) {
        oneFingerTap.enabled = false;
        if (timer) {
            [timer invalidate];
            timer = nil;
        }
        if ([gameState isWinning]) {
            [self runWin];
        } else {
            [self runLose];
        }
    }
}

- (void)runWin
{
    NSLog(@"runWin:");
    wins++;
    if (wins % 3 == 0) {
        maxMilliseconds -= maxMilliseconds * .05;
        level++;
    }
    NSLog(@"Wins: %d", wins);
    NSLog(@"maxMilliseconds: %d", maxMilliseconds);
    [self updateView:@"You win! Hold finger down and release to restart!"];
}

- (void)runLose
{
    NSLog(@"runLose:");
    if (wins > 0) {
        wins--;
    }
    [self vibrate];
    [self updateView:@"You lost...hold finger down and release to restart."];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [tapCounter resetTapCount];
}

- (void)updateView:(NSString *)text;
{
    self.timerLabel.text = [NSString stringWithFormat:@"Time left to tap: %d", milliseconds];
    self.levelLabel.text = [NSString stringWithFormat:@"Level: %d", level];
    self.tapDisplay.text = text;
}

- (void)vibrate
{
    NSLog(@"Vibrate");
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    AudioServicesPlaySystemSoundWithVibration(kSystemSoundID_Vibrate, nil, NSDictionary* vibratePattern)

}

@end
