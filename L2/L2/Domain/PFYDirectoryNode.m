//
//  PFYDirectoryNode.m
//  L2
//
//  Created by Osipov on 09.10.15.
//  Copyright © 2015 Pavel Osipov. All rights reserved.
//

#import "PFYDirectoryNode.h"
#import <POSRx/POSRx.h>

/// Prefer class continuation category to explicit instance variables (ivars).
@interface PFYDirectoryNode ()
@property (nonatomic) NSMutableArray *contents;
@end

@implementation PFYDirectoryNode

- (void)addNode:(nonnull PFYNode *)node {
    POSRX_CHECK(node);
    node.parent = self;
    [_contents addObject:node];
}

@end
