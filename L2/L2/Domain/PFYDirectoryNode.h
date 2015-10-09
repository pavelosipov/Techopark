//
//  PFYDirectoryNode.h
//  L2
//
//  Created by Osipov on 09.10.15.
//  Copyright © 2015 Pavel Osipov. All rights reserved.
//

#import "PFYNode.h"

@interface PFYDirectoryNode : PFYNode

/// @brief Adds node to directory.
/// @remark Postcondition: sets itself as parent of inserted node.
- (void)addNode:(nonnull PFYNode *)node;

@end
