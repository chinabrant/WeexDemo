//
//  AppDelegate.m
//  WeexDemo
//
//  Created by brant on 2018/3/30.
//  Copyright © 2018年 Brant. All rights reserved.
//

#import "AppDelegate.h"
#import <WeexSDK.h>
#import <SDWebImage/SDWebImageManager.h>
#import "WXRouterModule.h"
#import "NSString+md5.h"

@interface AppDelegate () <WXImageOperationProtocol, WXImgLoaderProtocol, WXModuleProtocol>

@end

@implementation AppDelegate

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock {
    
    // 先从缓存拿图片
    SDImageCache *cache = [SDImageCache sharedImageCache];
    UIImage *image = [cache imageFromCacheForKey:[url yt_md5Str]];
    if (image) {
        completedBlock(image, nil, YES);
        return nil;
    }
    
    return (id<WXImageOperationProtocol>)[[SDWebImageManager sharedManager].imageDownloader downloadImageWithURL:[NSURL URLWithString:url] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        if (completedBlock) {
            completedBlock(image, error, finished);
        }
        
        if (image) {
            SDImageCache *cache = [SDImageCache sharedImageCache];
            [cache storeImage:image forKey:[url yt_md5Str] toDisk:YES completion:nil];
        }
    }];
}

- (void)cancel {
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    [WXAppConfiguration setAppGroup:@"test"];
    [WXAppConfiguration setAppName:@"WeexDemo"];
    [WXAppConfiguration setAppVersion:@"1.0.0"];
    
    //init sdk environment
    [WXSDKEngine initSDKEnvironment];
    
    [WXSDKEngine registerHandler:self withProtocol:@protocol(WXImgLoaderProtocol)];
    
    [WXSDKEngine registerModule:@"router" withClass:[WXRouterModule class]];
    
    //register custom module and component，optional
//    [WXSDKEngine registerComponent:@"MyView" withClass:[MyViewComponent class]];
//    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
    
    //register the implementation of protocol, optional
//    [WXSDKEngine registerHandler:[WXNavigationDefaultImpl new] withProtocol:@protocol(WXNavigationProtocol)];
    
    //set the log level
    [WXLog setLogLevel: WXLogLevelAll];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
