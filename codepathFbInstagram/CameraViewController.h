//
//  CameraViewController.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVKit;

@interface CameraViewController : UIViewController <AVCapturePhotoCaptureDelegate>
@property (strong, nonatomic) IBOutlet UIView *previewView;
@property (strong, nonatomic) IBOutlet UIImageView *captureImageView;

@end
