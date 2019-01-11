//
//  AppDelegate.m
//  CollectCrashLog
//
//  Created by lwmini on 2019/1/11.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        // 将沙盒中的错误信息传递给服务器此处未上传。
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [[paths objectAtIndex:0] stringByAppendingString:@"Exception.txt"];
    if ([fileManager fileExistsAtPath:docDir]==YES) {
        NSLog(@"File exists");
    }
    
    // 设置捕捉异常的回调
    NSSetUncaughtExceptionHandler(handleException);
    
    return YES;
}
/**
 * 拦截异常
 */
void handleException(NSException *exception)
{
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    info[@"callStack"] = [exception callStackSymbols]; // 调用栈信息（错误来源于哪个方法）
    info[@"name"] = [exception name]; // 异常名字
    info[@"reason"] = [exception reason]; // 异常描述（报错理由）
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, NO);
    NSString *path = [[[pathArray lastObject] stringByAppendingString:@"Exception.txt"] stringByExpandingTildeInPath];
    BOOL isWrite = [info writeToFile:path atomically:YES];
    NSLog(@"isWrite %d",isWrite);
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
