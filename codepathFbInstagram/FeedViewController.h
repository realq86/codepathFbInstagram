//
//  FeedViewController.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "codepathFbInstagram-Bridging-Header.h"
@import Parse;
@import ParseLiveQuery;

#import "Post.h"

@interface FeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
    
    
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) PFLiveQueryClient *client;
@property (strong, nonatomic) PFLiveQuerySubscription *subscription;

@end
