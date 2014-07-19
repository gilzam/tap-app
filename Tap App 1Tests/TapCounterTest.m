//
//  TapCounterTest.m
//  Tap App 1
//
//  Created by Alex Bardasu on 19/07/14.
//  Copyright (c) 2014 ___Social_Party___. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TapCounter.h"

@interface TapCounterTest : XCTestCase
{
    TapCounter *tapCounter;
}

@end

@implementation TapCounterTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Test that the initial value is zero
- (void)testInitialValue
{
    tapCounter = [[TapCounter alloc] init];
    XCTAssertEqual(0, [tapCounter getTapCount]);
}

// Test that the tapCounter only gets incremented by 1
- (void)testIncrementAmount
{
    tapCounter = [[TapCounter alloc] init];
    NSInteger oldValue = [tapCounter getTapCount];
    [tapCounter incrementTapCount];
    NSInteger newValue = [tapCounter getTapCount];
    
    XCTAssertEqual(1, newValue-oldValue);
}

// Test that the counter gets correctly reset
- (void)testResetCounter
{
    tapCounter = [[TapCounter alloc] init];
    [tapCounter incrementTapCount];
    XCTAssertTrue([tapCounter getTapCount] != 0);
    [tapCounter resetTapCount];
    XCTAssertEqual(0, [tapCounter getTapCount]);
}

@end
