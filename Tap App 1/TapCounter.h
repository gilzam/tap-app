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
    NSInteger tapCount; // This is a private member of the TapCounter class; should be never accessed directly
}
- (void)incrementTapCount;
- (void)resetTapCount;
- (NSInteger)getTapCount;
@end
