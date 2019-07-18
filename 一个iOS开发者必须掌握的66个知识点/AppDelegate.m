//
//  AppDelegate.m
//  一个iOS开发者必须掌握的66个知识点
//
//  Created by XianCheng Wang on 2018/7/23.
//  Copyright © 2018年 XianCheng Wang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];

    //输出模拟器类型
    NSLog(@"%@",[[UIDevice currentDevice]model]);
    //绑定扑捉异常的函数 当程序崩溃时 会先调用这个函数
    NSSetUncaughtExceptionHandler(&getException);
    return YES;
}

void getException(NSException *exception){
    //遇到特殊情况时 需要把异常的具体信息获取并储存
    NSLog(@"名字----%@",exception.name);
    NSLog(@"原因----%@",exception.reason);
    NSLog(@"用户信息----%@",exception.userInfo);
    NSLog(@"栈内存地址----%@",exception.callStackReturnAddresses);
    NSLog(@"栈描述----%@",exception.callStackSymbols);
    NSString *string = [NSString stringWithFormat:@"名字%@,原因%@,信息%@,栈内存地址%@,栈描述%@",exception.name,exception.reason,exception.userInfo,exception.callStackReturnAddresses,exception.callStackSymbols];
    
    NSLog(@"%@",string);
    NSDate *date = [NSDate date];
    
    //当前的系统版本号
    NSString * version =[[UIDevice currentDevice]systemVersion];
    
    //当前设备型号
    [[UIDevice currentDevice]model];
    
    //储存崩溃信息
    
    NSString * path =[NSHomeDirectory()stringByAppendingPathComponent:@"Library/exception.txt"];
    [string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    //当程序再次启动时 把崩溃信息发送给服务器
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
