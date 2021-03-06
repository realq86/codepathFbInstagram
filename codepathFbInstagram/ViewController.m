//
//  ViewController.m
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/20/18.
//  Copyright © 2018 CodePath. All rights reserved.
//
#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse#user-registration

#import "ViewController.h"
#import "Parse/Parse.h"
#import "FeedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.userNameField.text = @"myUsername";
    self.passwordField.text = @"myPassword";
    self.emailField.text = @"myEmail@email.com";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signButtonTapped:(UIButton *)sender {
    [self registerUser];
}
    
- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.userNameField.text;
    newUser.email = self.emailField.text;
    newUser.password = self.passwordField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            
            // manually segue to logged in view
        }
    }];
}
    
- (IBAction)signInButtonTapped:(id)sender {
    [self loginUser];
}
    
- (void)loginUser {
    NSString *username = self.userNameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            FeedViewController *feedVC = [storyboard instantiateViewControllerWithIdentifier:@"AuthenticatedViewController"];
            [self presentViewController:feedVC animated:YES completion:nil];
        }
    }];
}
    
    
- (IBAction)logoutButtonTapped:(UIButton *)sender {

[PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
    // PFUser.current() will now be nil
}];

}
    
#pragma mark #1 END
    

@end
