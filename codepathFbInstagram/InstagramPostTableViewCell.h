//
//  InstagramPostTableViewCell.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/30/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import ParseUI;

@interface InstagramPostTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet PFImageView *photoImageView;
@property (strong, nonatomic) Post *post;

@end
