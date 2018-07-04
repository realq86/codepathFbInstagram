//
//  AppDelegate.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/20/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LogoutProtocol

- (void)logout;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate, LogoutProtocol>

@property (strong, nonatomic) UIWindow *window;

- (void)logout;

@end

