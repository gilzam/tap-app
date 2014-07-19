//
//  TapCounter.m
//  Tap App 1
//
//  Created by Alex Bardasu on 19/07/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//
//  This is a model class; contains no controller or view logic whatsoever.

#import "TapCounter.h"

@implementation TapCounter


- (id)init
{
    self = [super init];
    
    if (self)
    {
        tapCount = 0;
    }
    
    return self;
}

// You never explicitely set the value of the tap count,
// instead, you expose an API for incrementing it.
- (void)incrementTapCount
{
    tapCount = tapCount + 1;
}

// A way of resetting the count
- (void)resetTapCount
{
    tapCount = 0;
}

// Return the current counter
- (NSInteger)getTapCount
{
    return tapCount;
}
@end
