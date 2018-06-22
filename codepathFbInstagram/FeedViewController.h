//
//  FeedViewController.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
    
    
    @property (strong, nonatomic) IBOutlet UITableView *tableView;
    
@end
