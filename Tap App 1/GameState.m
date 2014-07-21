//
//  GameState.m
//  Tap App 1
//
//  Created by Gil Zamir on 7/20/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//

#import "GameState.h"

@implementation GameState

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self resetGameState];
    }
    
    return self;
}


- (void)resetGameState
{
    winning = true;
    maxTapBreakNumber = 25;
    tapBreakNumber = arc4random_uniform(maxTapBreakNumber-1)+2;
    NSLog(@"tapBreakNumber: %d", tapBreakNumber);
}

// Return the current counter
- (NSInteger)getTapBreakNumber
{
    return tapBreakNumber;
}

- (BOOL)isWinning
{
    return winning;
}

- (void)setWinning:(BOOL)value
{
    winning = value;
}

@end
