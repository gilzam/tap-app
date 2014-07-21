//
//  GameState.h
//  Tap App 1
//
//  Created by Gil Zamir on 7/20/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameState : NSObject
{
    NSInteger tapBreakNumber;
    NSInteger maxTapBreakNumber;
    BOOL winning;
    NSTimeInterval timer;
}

- (void)resetGameState;
- (NSInteger)getTapBreakNumber;
- (BOOL)isWinning;
- (void)setWinning:(BOOL)value;

@end
