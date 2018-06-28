//
//  FeedViewController.m
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import "FeedViewController.h"
#import "Post.h"
#import "Parse/Parse.h"


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
    
#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Camera-Quickstart#permissions
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePickerVC = [UIImagePickerController new];
        imagePickerVC.delegate = self;
        imagePickerVC.allowsEditing = YES;
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:imagePickerVC animated:YES completion:nil];
    }
    else {
        UIImagePickerController *imagePickerVC = [UIImagePickerController new];
        imagePickerVC.delegate = self;
        imagePickerVC.allowsEditing = YES;
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

        [self presentViewController:imagePickerVC animated:YES completion:nil];
    }
    
//    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
//    imagePickerVC.delegate = self;
//    imagePickerVC.allowsEditing = YES;
//
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
//    }
//    else {
//        NSLog(@"Camera 🚫 available so we will use photo library instead");
//        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    }
//
//    [self presentViewController:imagePickerVC animated:YES completion:nil];

    
}
    
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
#pragma mark #2 Code snippet for : https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse#pfobject
    PFObject *post = [[PFObject alloc] initWithClassName:@"Post"];
    post[@"postID"] = @"PostID";
    post[@"userID"] = @"userID";
    PFFile *imageFile = [PFFile fileWithName:@"photo.png" data:UIImagePNGRepresentation(editedImage)]; //editedImage is UIImage *
    post[@"image"] = imageFile;
    
    //    Post *post = [Post new];
    //    post.postID = @"PostID";
    //    post.userID = @"userID";
    //    post.image =
    
    [post saveInBackground];
    [post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
#pragma mark #2 END

    
}
#pragma mark #1 END

@end
