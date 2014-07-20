//
//  TapCounter.h
//  Tap App 1
//
//  Created by Alex Bardasu on 19/07/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TapCounter : NSObject
{
    // These are private members of the TapCounter class; should be never accessed directly
    NSInteger tapCount;
    NSInteger tapBreakNumber;
    NSInteger maxTapBreakNumber;
}
- (void)incrementTapCount;
- (void)resetTapCount;
- (NSInteger)getTapCount;
- (NSInteger)getTapBreakNumber;
- (BOOL)tapsEqualsBreakNumber;
- (BOOL)tapsExceedsBreakNumber;
@end
