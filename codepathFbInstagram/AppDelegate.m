//
//  AppDelegate.m
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/20/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import "AppDelegate.h"
#import "Parse/Parse.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse#debugging

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // set init log level
    [Parse setLogLevel:PFLogLevelDebug];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(receiveWillSendURLRequestNotification:) name:PFNetworkWillSendURLRequestNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(receiveDidReceiveURLResponseNotification:) name:PFNetworkDidReceiveURLResponseNotification object:nil];
    
#pragma mark #2 Code snippet for : https://guides.codepath.com/ios/Configuring-a-Parse-Server#enabling-client-sdk-integration

    ParseClientConfiguration *config = [ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        
        configuration.applicationId = @"codepathInstagram";
        configuration.clientKey = @"codepathInstagramMaster";
        configuration.server = @"http://codepathfbinstagram.herokuapp.com/parse";
    }];
    
    [Parse initializeWithConfiguration:config];
#pragma mark #2 END
    
    if (PFUser.currentUser) {        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        self.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"AuthenticatedViewController"];
    }
    
    
    
    return YES;
}


- (void)receiveWillSendURLRequestNotification:(NSNotification *) notification {
    
    id request = notification.userInfo[PFNetworkNotificationURLRequestUserInfoKey];
    
    if ([request isKindOfClass:[NSMutableURLRequest class]]) {
        NSMutableURLRequest *urlRequest = (NSMutableURLRequest *)request;
        NSLog(@"------------ URL: %@", urlRequest.URL.absoluteString);
    }
}

- (void)receiveDidReceiveURLResponseNotification:(NSNotification *) notification {
    
    id response = notification.userInfo[PFNetworkNotificationURLResponseUserInfoKey];
    id responseBody = notification.userInfo[PFNetworkNotificationURLResponseBodyUserInfoKey];
    
    if ( [response isKindOfClass:[NSHTTPURLResponse class]] ) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSLog(@"---------- Status Code: %ld", (long)httpResponse.statusCode);
        
        if ( [responseBody isKindOfClass:[NSString class]] ) {
            NSLog(@"--------- Response Body: %@", (NSString *)responseBody);
        }
    }
}
#pragma mark #1 END

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
