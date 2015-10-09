//
//  L2Tests.m
//  L2Tests
//
//  Created by Osipov on 09.10.15.
//  Copyright © 2015 Pavel Osipov. All rights reserved.
//

#import "PFYDirectoryNode.h"
#import <POSAllocationTracker/POSAllocationTracker.h>
#import <XCTest/XCTest.h>

@interface L2Tests : XCTestCase

@end

@implementation L2Tests

- (void)testImpossibleToCreateNodeWithoutName {
    XCTAssertThrows([PFYNode new]);
    XCTAssertThrows([PFYDirectoryNode new]);
    // This is an example that nonnull attribte of the argument does not
    // trigger an XCode IDE to show us event a warning. So manual check
    // all input argumnts is important.
    NSString *badName = nil;
    XCTAssertThrows([[PFYNode alloc] initWithName:badName]);
    XCTAssertThrows([[PFYNode alloc] initWithName:@""]);
}

- (void)testImpossibleToChangeNameAfterInitialization {
    NSMutableString *evilName = [NSMutableString stringWithString:@"02.pptx"];
    PFYNode *node = [[PFYNode alloc] initWithName:evilName];
    [evilName setString:@""];
    XCTAssertEqualObjects(node.name, @"02.pptx");
}

- (void)testLeaksAbsence {
    @autoreleasepool {
        PFYDirectoryNode *lections = [[PFYDirectoryNode alloc] initWithName:@"lections"];
        PFYNode *lection2 = [[PFYNode alloc] initWithName:@"02.pptx"];
        [lections addNode:lection2];
    }
    XCTAssert([POSAllocationTracker instanceCountForClass:PFYNode.class] == 0);
    XCTAssert([POSAllocationTracker instanceCountForClass:PFYDirectoryNode.class] == 0);
}

- (void)testLeakPresenceAfterException {
    @autoreleasepool {
        [self demoAutoreleasePoolWithException:YES];
        XCTAssert([POSAllocationTracker instanceCountForClass:PFYNode.class] == 1);
    }
}

- (void)testLeakAbsenseWithoutException {
    @autoreleasepool {
        [self demoAutoreleasePoolWithException:NO];
        XCTAssert([POSAllocationTracker instanceCountForClass:PFYNode.class] == 0);
    }
}

- (void)demoAutoreleasePoolWithException:(BOOL)shouldThrowException {
    @try {
        @autoreleasepool {
            __unused PFYNode *lection2 = [[PFYNode alloc] initWithName:@"02.pptx"];
            if (shouldThrowException) {
                @throw @"Bad days happen";
            }
        }
    } @catch (NSString *what) {
        NSLog(@"Exception: %@", what);
    }
}

@end
