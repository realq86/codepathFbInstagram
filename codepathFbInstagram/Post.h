//
//  Post.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//
#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse#use-case-post-photos-to-instagram-parse

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

@interface Post : PFObject<PFSubclassing>

@property (retain) NSString *postID;
@property (retain) NSString *userID;
@property (retain) PFUser *author;

@property (retain) NSString *caption;
@property (retain) PFFile *image;
@property (retain) NSNumber *likeCount;
@property (retain) NSNumber *commentCount;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;

@end
#pragma mark #1 END
