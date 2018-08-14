//
//  CameraViewController.h
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Creating-a-Custom-Camera-View#step-4-define-instance-variables

#import <UIKit/UIKit.h>
@import AVKit;

@interface CameraViewController : UIViewController <AVCapturePhotoCaptureDelegate>
@property (strong, nonatomic) IBOutlet UIView *previewView;
@property (strong, nonatomic) IBOutlet UIImageView *captureImageView;

@end
#pragma mark #1 END
