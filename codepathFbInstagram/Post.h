//
//  Post.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

@interface Post : PFObject<PFSubclassing>

    @property (retain) NSString *postID;
    @property (retain) NSString *userID;
    @property (retain) NSString *description;
    
    @property (retain) UIImage *image;
    
@end
