//
//  IDZViewController.h
//  IDZAudoPlayerTutorial
//
//  Created by idz on 10/1/12.
//  Copyright (c) 2012 iosdeveloperzone.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;

@property (weak, nonatomic) IBOutlet UISlider *currentTimeSlider;

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

- (IBAction)play:(id)sender;
- (IBAction)pause:(id)sender;

@end
