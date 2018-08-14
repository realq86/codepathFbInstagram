//
//  CameraViewController.m
//  codepathFbInstagram
//
//  Created by Chi Hwa Michael Ting on 6/21/18.
//  Copyright © 2018 CodePath. All rights reserved.
//
#pragma mark #1 Code snippet for : https://guides.codepath.com/ios/Creating-a-Custom-Camera-View#step-4-define-instance-variables
#import "CameraViewController.h"
@import AVKit;

@interface CameraViewController ()
@property (nonatomic) AVCaptureSession *capturesSession;
@property (nonatomic) AVCapturePhotoOutput *stillImageOutput;
@property (nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Setup your camera here...
    
    self.capturesSession = [AVCaptureSession new];
    self.capturesSession.sessionPreset = AVCaptureSessionPresetPhoto;
    
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!backCamera) {
        NSLog(@"Unable to access back camera!");
        return;
    }
    
    NSError *error;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:backCamera
                                                                        error:&error];
    
    if (!error) {
        
        self.stillImageOutput = [AVCapturePhotoOutput new];
        
        if ([self.capturesSession canAddInput:input] && [self.capturesSession canAddOutput:self.stillImageOutput]) {
            
            [self.capturesSession addInput:input];
            [self.capturesSession addOutput:self.stillImageOutput];
            [self setupLivePreview];
        }
    }
    else {
        NSLog(@"Error Unable to initialize back camera: %@", error.localizedDescription);
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.capturesSession stopRunning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupLivePreview {
    
    self.videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.capturesSession];
    if (self.videoPreviewLayer) {
        
        self.videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        self.videoPreviewLayer.connection.videoOrientation = AVCaptureVideoOrientationPortrait;
        [self.previewView.layer addSublayer:self.videoPreviewLayer];
        
        dispatch_queue_t globalQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        dispatch_async(globalQueue, ^{
            [self.capturesSession startRunning];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.videoPreviewLayer.frame = self.previewView.bounds;
            });
        });
    }
}

- (IBAction)xTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTakePhoto:(id)sender {
    
    AVCapturePhotoSettings *settings = [AVCapturePhotoSettings photoSettingsWithFormat:@{AVVideoCodecKey: AVVideoCodecTypeJPEG}];

    [self.stillImageOutput capturePhotoWithSettings:settings delegate:self];
}

- (void)captureOutput:(AVCapturePhotoOutput *)output didFinishProcessingPhoto:(AVCapturePhoto *)photo error:(nullable NSError *)error {
    
    NSData *imageData = photo.fileDataRepresentation;
    
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        // Add the image to captureImageView here...
        self.captureImageView.image = image;
    }
}

@end
#pragma mark #1 END

