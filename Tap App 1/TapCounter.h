//
//  TapCounter.h
//  Tap App 1
//
//  Created by Gil Zamir on 19/07/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TapCounter : NSObject
{
    NSInteger tapCount;
}
- (void)incrementTapCount;
- (void)resetTapCount;
- (NSInteger)getTapCount;
@end
