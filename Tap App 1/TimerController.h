//
//  TimerController.h
//  Tap App 1
//
//  Created by Gil Zamir on 7/20/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerController : NSObject
{
    NSTimer *timer;
}

- (void)startTimer;
- (void)stopTimer;
- (void)resetTimer;

- (void)showActivity;

@end
