////
//  BRCacheManager.m
//  Forum
//
//  Created by YR on 2018/1/26.
//  Copyright © 2018年 mouluntan. All rights reserved.
//
//  QQ : 281644583
//  Email: duanyongrui@gmail.com
//

#import "BRCacheManager.h"

NS_ASSUME_NONNULL_BEGIN

static NSString * const imageModifyDateCacheName = @"com.imageModifyDateCacheName";

@implementation BRCacheManager

@synthesize imageModifyDateCache = _imageModifyDateCache;

singleton_m();

- (YYCache *)imageModifyDateCache {
	if (!_imageModifyDateCache) {
		_imageModifyDateCache = [[YYCache alloc] initWithName:imageModifyDateCacheName];
	}
	return _imageModifyDateCache;
}

@end

NS_ASSUME_NONNULL_END
