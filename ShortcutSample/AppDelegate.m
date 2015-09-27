//
//  AppDelegate.m
//  ShortcutSample
//
//  Created by mineharu on 2015/09/27.
//  Copyright © 2015年 Mineharu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // ショートカット2つ追加
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch]; // アイコン
    UIMutableApplicationShortcutItem *shortcut3 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"aaa" localizedTitle:@"title" localizedSubtitle:@"subtitle" icon:icon3 userInfo:@{@"key": @"あああ"}];
    UIApplicationShortcutIcon *icon4 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    UIMutableApplicationShortcutItem *shortcut4 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"bbb" localizedTitle:@"title2" localizedSubtitle:@"subtitle2" icon:icon4 userInfo:@{@"key": @"いいい"}];
    application.shortcutItems = @[shortcut3, shortcut4];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    // 押された時の処理
    if ([shortcutItem.type isEqualToString:@"aaa"]) {
        // aaa押された時の処理
    } else if ([shortcutItem.type isEqualToString:@"bbb"]) {
        // bbb押された時の処理
    } else if ([shortcutItem.type isEqualToString:@"ccc"]) {
        // Play押された時の処理
    } else if ([shortcutItem.type isEqualToString:@"ddd"]) {
        // NewPost押された時の処理
    }
    
    // タイトルそのままアラートに出すだけ。
    // ここで特定の画面呼ぶ場合ってそうゆうことができるように画面を設計しないといけない？
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:shortcutItem.localizedTitle message:shortcutItem.localizedSubtitle preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [_window.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
