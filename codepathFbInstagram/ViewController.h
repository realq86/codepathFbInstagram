//
//  ViewController.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/20/18.
//  Copyright © 2018 CodePath. All rights reserved.
//
#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse#user-registration
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
    @property (strong, nonatomic) IBOutlet UITextField *userNameField;
    @property (strong, nonatomic) IBOutlet UITextField *passwordField;
    @property (strong, nonatomic) IBOutlet UITextField *emailField;
    @property (strong, nonatomic) IBOutlet UIButton *signButton;
    @property (strong, nonatomic) IBOutlet UIButton *logoutButton;
    
@end

#pragma mark #1 END
