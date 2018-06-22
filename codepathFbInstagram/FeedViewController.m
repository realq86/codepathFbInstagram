//
//  FeedViewController.m
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import "FeedViewController.h"
#import "Post.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    
- (IBAction)cameraTapped:(id)sender {
    
    Post *post = [Post new];
    post.postID = @"PostID";
    post.userID = @"userID";
    
    [post saveInBackground];
    [post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
    [self performSegueWithIdentifier:@"showCamera" sender:nil];
}
    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
