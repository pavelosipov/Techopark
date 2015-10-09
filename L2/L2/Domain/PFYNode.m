//
//  PFYNode.m
//  L2
//
//  Created by Osipov on 09.10.15.
//  Copyright © 2015 Pavel Osipov. All rights reserved.
//

#import "PFYNode.h"
#import <POSRx/POSRx.h>

@implementation PFYNode

/// Preventing client code to initialize node without name.
POSRX_DEADLY_INITIALIZER(init)

- (instancetype)initWithName:(nonnull NSString *)name {
    // Methods of the nil objects return default values,
    // so if name is nil then 'length' method will return 0.
    POSRX_CHECK(name.length > 0);
    if (self = [super init]) {
        //
        // Copying name ensures node that the value of
        // name will not changes after verification.
        // For example some buggly code may do this:
        //
        // NSMutableString *name = @"01.pptx";
        // PFYNode *node = [[PFYNode alloc] initWithName:name];
        // [name setString:@""];
        //
        // See unit tests for example.
        //
        _name = [name copy];
    }
    return self;
}

@end
