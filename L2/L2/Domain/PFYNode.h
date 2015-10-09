//
//  PFYNode.h
//  L2
//
//  Created by Osipov on 09.10.15.
//  Copyright © 2015 Pavel Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Forward declaration.
@class PFYDirectoryNode;

@interface PFYNode : NSObject

/// Parent of the current node. May be nil for tree's root node.
@property (nonatomic, weak, nullable) PFYDirectoryNode *parent;

/// Name of the node. Its length always more than 0.
@property (nonatomic, nonnull) NSString *name;

/// Date of the last modification. May be nil.
@property (nonatomic, nullable) NSDate *modified;

/// @brief The designated initializer. Note that 'init' is a deadly initializer.
/// @param name Length should be greater than 0.
- (nonnull instancetype)initWithName:(nonnull NSString *)name;

@end
