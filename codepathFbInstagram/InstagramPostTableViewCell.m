//
//  InstagramPostTableViewCell.m
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/30/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import "InstagramPostTableViewCell.h"

@implementation InstagramPostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPost:(Post *)post {
#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse
    _post = post;
    
    self.photoImageView.file = post[@"image"];
    [self.photoImageView loadInBackground];
#pragma mark #1 END

}


@end
