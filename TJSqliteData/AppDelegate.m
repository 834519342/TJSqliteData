//
//  AppDelegate.m
//  TJSqliteData
//
//  Created by 谭杰 on 2017/1/16.
//  Copyright © 2017年 谭杰. All rights reserved.
//

#import "AppDelegate.h"
#import "DataModel.h"
#import <objc/runtime.h>
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSArray *arr = [self getPropertyNameList];
    for (NSString *str in arr) {
        NSLog(@"%@",str);
    }
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    return YES;
}

//获取类所有属性名
- (NSArray *)getPropertyNameList{
    
    u_int count = 0;
    
    objc_property_t *property = class_copyPropertyList([DataModel class], &count);
    
    NSMutableArray *propertyNameArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i=0; i<count; i++){
        
        const char* propertyName =property_getName(property[i]);
        
        [propertyNameArray addObject: [NSString stringWithUTF8String:propertyName]];
        
    }
    
    free(property);
    
    return propertyNameArray;
    
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
