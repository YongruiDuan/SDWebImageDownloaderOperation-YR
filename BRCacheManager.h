////
//  BRCacheManager.h
//  Forum
//
//  Created by YR on 2018/1/26.
//  Copyright © 2018年 mouluntan. All rights reserved.
//
//  QQ : 281644583
//  Email: duanyongrui@gmail.com
//

#import <Foundation/Foundation.h>
#import <YYKit/YYCache.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRCacheManager : NSObject

singleton_h();

@property (nonatomic, strong, readonly) YYCache *imageModifyDateCache;

@end

NS_ASSUME_NONNULL_END
