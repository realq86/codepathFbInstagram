//
//  FeedViewController.m
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import "FeedViewController.h"
#import "Post.h"
#import "InstagramPostTableViewCell.h"
#import "AppDelegate.h"
//#import "Parse/Parse.h"

@interface FeedViewController ()

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSArray new];
    // Do any additional setup after loading the view.
    
//    PFQuery *postQuery = [PFQuery queryWithClassName:@"Post"];
//    [postQuery whereKeyExists:@"image"];
////    [postQuery orderByAscending:@"createdAt"];
//
//    self.client = [PFLiveQueryClient sharedClient];
//    self.subscription = [[self.client subscribeToQuery:postQuery] addCreateHandler:^(PFQuery<PFObject *> *query, PFObject *obj) {
//        Post *post = (Post *)obj;
//        NSLog(@"New Post added by %@", post.userID);
//    }];

    // construct PFQuery
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;

    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        
        if (posts) {
            // do something with the data fetched
            NSLog(@"~~~~~~DOWNLOADED~~~~~~~~~~~~ %@", ((Post *)posts[0]).author.email);
            self.dataArray = posts;

            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        }
        else {
            // handle error
        }
    }];
}

- (IBAction)logoutButtonPressed:(id)sender {
    
//    [((id<LogoutProtocol>)UIApplication.sharedApplication.delegate) logout];
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"didLogout" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InstagramPostTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    
    if (cell) {
        
        cell.post = self.dataArray[indexPath.row];
        return cell;
    }
    
    return nil;
}
    
- (IBAction)cameraTapped:(id)sender {
    
#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Camera-Quickstart#permissions
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        UIImagePickerController *imagePickerVC = [UIImagePickerController new];
//        imagePickerVC.delegate = self;
//        imagePickerVC.allowsEditing = YES;
//        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
//
//        [self presentViewController:imagePickerVC animated:YES completion:nil];
//    }
//    else {
//        UIImagePickerController *imagePickerVC = [UIImagePickerController new];
//        imagePickerVC.delegate = self;
//        imagePickerVC.allowsEditing = YES;
//        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//
//        [self presentViewController:imagePickerVC animated:YES completion:nil];
//    }
    
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

    [self performSegueWithIdentifier:@"showCamera" sender:nil];
}
    
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
#pragma mark #2 Code snippet for : https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse#pfobject
//    PFObject *post = [[PFObject alloc] initWithClassName:@"Post"];
//    post[@"postID"] = @"PostID";
//    post[@"userID"] = @"userID";
//    PFFile *imageFile = [PFFile fileWithName:@"photo.png" data:UIImagePNGRepresentation(editedImage)]; //editedImage is UIImage *
//    post[@"image"] = imageFile;
//
//    //    Post *post = [Post new];
//    //    post.postID = @"PostID";
//    //    post.userID = @"userID";
//    //    post.image =
    
//    [post saveInBackground];
//    [post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            // The object has been saved.
//        }
//        else {
//            NSLog(@"%@", error.localizedDescription);
//        }
//    }];
#pragma mark #2 END

    //OR
    
    [Post postUserImage:editedImage withCaption:@"Caption" withCompletion:nil];
    
}
#pragma mark #1 END

@end
