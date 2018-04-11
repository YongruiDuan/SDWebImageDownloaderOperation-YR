
## Welcome to GitHub Pages


``` markdown

# 改进SDWebimage的图片更新机制

- 依赖库

1. SDWebimage
2. YYCache

> SDWebimage 使用SDWebImageRefreshCached缓存策略时，是通过NSURL来缓存图片的，当url未发生改变，而图片内容已发生变化时，SDWebimage并不能及时更新图片，以下是我的解决方案，部分内容参考[博客](http://blog.handy.wang/blog/2016/01/29/sdwebimagehuan-cun-zhi-tu-pian-urlbu-bian/)

**注意**
1. 缓存策略要选择SDWebImageRefreshCached
2. 需要在下载图片之前调用一下方法添加请求headers

/**
配置SDWebImage在URL不变时可以更新到最新的图片
*/
- (void)configSDWebimageDownloader {
	SDWebImageDownloader *imgDownloader = SDWebImageManager.sharedManager.imageDownloader;
	imgDownloader.headersFilter  = ^NSDictionary *(NSURL *url, NSDictionary *headers) {

		NSMutableDictionary *mutableHeaders = [headers mutableCopy];
		NSDictionary *preResponseHeaders = ( NSDictionary * _Nullable )[[BRCacheManager shared].imageModifyDateCache objectForKey:[[SDWebImageManager sharedManager] cacheKeyForURL:url]];
		if (preResponseHeaders) {
			NSString *lastModifiedStr = preResponseHeaders[@"Last-Modified"];
			lastModifiedStr = lastModifiedStr? : @"";
			[mutableHeaders setValue:lastModifiedStr forKey:@"If-Modified-Since"];
			NSString *etag = preResponseHeaders[@"Etag"];
			etag = etag?:@"";
			[mutableHeaders setValue:etag forKey:@"Etag"];
		}
		return mutableHeaders;
	};
}


```
