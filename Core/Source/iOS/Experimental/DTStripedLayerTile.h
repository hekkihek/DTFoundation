//
//  DTStripedLayerTile.h
//  DTFoundation
//
//  Created by Oliver Drobnik on 01.03.13.
//  Copyright (c) 2013 Cocoanetics. All rights reserved.
//

#if TARGET_OS_IPHONE

#import <QuartzCore/QuartzCore.h>

@interface DTStripedLayerTile : CALayer

@property (nonatomic, assign) NSUInteger index;

@end

#endif
