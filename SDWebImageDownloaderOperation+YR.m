////
//  SDWebImageDownloaderOperation+YR.m
//  Forum
//
//  Created by YR on 2018/1/25.
//  Copyright © 2018年 mouluntan. All rights reserved.
//
//  QQ : 281644583
//  Email: duanyongrui@gmail.com
//

#import "SDWebImageDownloaderOperation+YR.h"
#import <YYKit/YYCache.h>

@implementation SDWebImageDownloaderOperation (YR)

+ (void)load {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		Method originalMethod = class_getInstanceMethod([self classForCoder], @selector(URLSession:dataTask:didReceiveResponse:completionHandler:));
		Method currentMethod = class_getInstanceMethod([self classForCoder], @selector(yr_URLSession:dataTask:didReceiveResponse:completionHandler:));
		method_exchangeImplementations(originalMethod, currentMethod);
	});
}

- (void)yr_URLSession:(NSURLSession *)session
			 dataTask:(NSURLSessionDataTask *)dataTask
   didReceiveResponse:(NSURLResponse *)response
	completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	[[BRCacheManager shared].imageModifyDateCache setObject:httpResponse.allHeaderFields forKey:[[SDWebImageManager sharedManager] cacheKeyForURL:httpResponse.URL]];
	[self yr_URLSession:session dataTask:dataTask didReceiveResponse:response completionHandler:completionHandler];
}

@end
