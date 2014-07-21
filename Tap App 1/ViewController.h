//
//  ViewController.h
//  Tap App 1
//
//  Created by Gil Zamir on 7/18/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//  *** You should give this class a more meaningful name.

#import <UIKit/UIKit.h>
#import "TimerController.h"
#import "TapCounter.h"
#import "GameState.h"

@interface ViewController : UIViewController
{
    UITapGestureRecognizer *oneFingerTap;
    UITapGestureRecognizer *twoFingerTap;
    UILongPressGestureRecognizer *longPress;
    GameState *gameState;
    TapCounter *tapCounter;
    NSTimer *timer;
    int milliseconds;
    int maxMilliseconds;
    int wins;
    int level;
    int touchCounter;
}


@end
