//
//  AppDelegate.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "AppDelegate.h"
#import "Requests.h"
#import "Performancer.h"
#import "ConnectorManager.h"
#import "FEZManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    [[FEZManager sharedManager] configure];
    if ([FBSDKAccessToken currentAccessToken]) {
        [self startTabBar];
        [ConnectorManager connectAllConnectors];
    }
    
//    [self testLogin];
//    [self testCreatePerformancer];
//    [self testPerformancers];
//    [self testCreatePost];
//    [self testPosts];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:sourceApplication
                                                               annotation:annotation
                    ];
    // Add any custom logic here.
    return handled;
}

#pragma mark - Private api

- (void)startTabBar {
    UIViewController *tabBarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"TabBarController"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
}

- (void)testLogin {
    [Requests logInWithUserMail:@"joan@joan.com" password:@"123" withSuccess:^(id responseObject) {
        NSLog(@"TEST LOGIN : OK");
    } failure:^(id responseObject, NSError *error) {
        NSLog(@"TEST ERROR : %@", error.localizedDescription);
    }];
}

- (void)testCreatePost {
    Post *p = [Post new];
    p.title = @"post 1";
    p.desc = @"p1 desc";
    p.userID = @"1234";
    p.eventDate = @"05-05-2017T14:00:00";
    p.creationDate = @"01-03-2017T14:00:00";
    
    [Requests submitPost:p
             withSuccess:^(id responseObject) {
        NSLog(@"TEST CREATE POST : OK");
    } failure:^(id responseObject, NSError *error) {
        NSLog(@"TEST CREATE POST ERROR : %@", error.localizedDescription);
    }];
 }

- (void)testPosts {
    [Requests postsWithSuccess:^(id responseObject) {
        NSLog(@"TEST ALL POSTS : %@", responseObject);
    } failure:^(id responseObject, NSError *error) {
        NSLog(@"TEST ALL POST ERROR : %@", error.localizedDescription);
    }];
}

- (void)testCreatePerformancer {
    Performancer *perf = [Performancer new];
    perf.name = @"Performancer 1";
    perf.surname = @"P1 surname";
    perf.company = @"n/d";
    perf.city = @"Barcelona";
    perf.country = @"Catalunya";
    perf.email = @"joan@joan.com";
    perf.phone = @"+34 666666666";
    perf.desc = @"An awesome musician";
    perf.donateURI = @"";
    perf.age = @"18";
    perf.active = YES;
    perf.lat = 41.0000;
    perf.lon = 2.5124;
    [Requests createPerformancer:perf
                     withSuccess:^(id responseObject) {
        NSLog(@"TEST CREATE PERFORMANCER : OK");
    } failure:^(id responseObject, NSError *error) {
        NSLog(@"TEST CREATE PERFORMANCER ERROR : %@", error.localizedDescription);
    }];
}

- (void)testPerformancers {
    [Requests performancersWithSuccess:^(id responseObject) {
        NSLog(@"TEST ALL PERFORMANCERS : OK -> %@", responseObject);
    } failure:^(id responseObject, NSError *error) {
        NSLog(@"TEST ALL PERFORMANCERS ERROR : %@", error.localizedDescription);
    }];
}
@end
