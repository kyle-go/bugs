//
//  IDZViewController.m
//  IDZAudoPlayerTutorial
//
//  Created by idz on 10/1/12.
//  Copyright (c) 2012 iosdeveloperzone.com. All rights reserved.
//

#import "ViewController.h"


#define IDZTrace() NSLog(@"%s", __PRETTY_FUNCTION__)

@interface ViewController ()

@property (nonatomic, strong) AVAudioPlayer* player;
@property (nonatomic, strong) NSTimer* timer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.  
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"1" withExtension:@"mp3"];
    NSAssert(url, @"URL is valid."); 
    NSError* error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if(!self.player)
    {
        NSLog(@"Error creating player: %@", error);
    }
    self.player.delegate = self;
    [self.player prepareToPlay];
    
    self.currentTimeSlider.minimumValue = 0.0f;
    self.currentTimeSlider.maximumValue = self.player.duration;
    self.currentTimeSlider.value = 0.0f;
    self.totalTimeLabel.text =[@([@(self.player.duration) intValue]) stringValue];
}

- (void)startTimer
{
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.314 target:self selector:@selector(updateDisplay:) userInfo:nil repeats:YES];
    }
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - Actions
- (IBAction)play:(id)sender {
    IDZTrace();
    [self.player play];
    [self startTimer];
}

- (IBAction)pause:(id)sender {
    IDZTrace();
    [self.player pause];
    [self stopTimer];
}

//touch up
- (IBAction)touchUp:(id)sender
{
    if (self.player.playing) {
        [self startTimer];
    }
    
    self.player.currentTime = self.currentTimeSlider.value;
    NSLog(@"Touch Up...");
}

- (IBAction)touchDown:(id)sender {
    [self stopTimer];
    NSLog(@"Touch Down...");
}

- (IBAction)valueChanged:(id)sender {
    self.durationLabel.text = [@([@(self.currentTimeSlider.value) intValue]) stringValue];
}

#pragma mark - Display Update
- (void)updateDisplay:(NSTimer *)timer
{
    assert([NSThread mainThread]);
    NSLog(@"update display %f", self.player.currentTime);
    self.currentTimeSlider.value = self.player.currentTime;
    self.durationLabel.text = [@([@(self.player.currentTime) intValue]) stringValue];
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"%s successfully=%@", __PRETTY_FUNCTION__, flag ? @"YES"  : @"NO");
    [self stopTimer];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"%s error=%@", __PRETTY_FUNCTION__, error);
    [self stopTimer];
}

@end
