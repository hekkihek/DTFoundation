//
//  UIApplication+DTNetworkActivity.m
//  DTFoundation
//
//  Created by Oliver Drobnik on 5/21/12.
//  Copyright (c) 2012 Cocoanetics. All rights reserved.
//

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>
#import "UIApplication+DTNetworkActivity.h"

static NSUInteger __internalOperationCount = 0;

@implementation UIApplication (DTNetworkActivity)

- (void)pushActiveNetworkOperation
{
	@synchronized(self)
	{
		__internalOperationCount++;
		
#if !TARGET_OS_TV
        dispatch_async(dispatch_get_main_queue(), ^{

			if (!self.isNetworkActivityIndicatorVisible && __internalOperationCount)
			{
				self.networkActivityIndicatorVisible = YES;
			}
		});
#endif
    }
}

- (void)popActiveNetworkOperation
{
	@synchronized(self)
	{
		if (__internalOperationCount==0)
		{
			// nothing to do
			return;
		}
		
		__internalOperationCount--;
#if !TARGET_OS_TV
		dispatch_async(dispatch_get_main_queue(), ^{
			if (self.isNetworkActivityIndicatorVisible && !__internalOperationCount)
			{
				self.networkActivityIndicatorVisible = NO;
			}
		});
#endif
    }
}

@end

#endif
