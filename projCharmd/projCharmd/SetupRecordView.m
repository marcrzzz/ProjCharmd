//
//  SetupRecordView.m
//  projCharmd
//
//  Created by Marilyn Cruz on 12/20/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import "SetupRecordView.h"
#import <AVFoundation/AVFoundation.h>



@implementation SetupRecordView
AVAudioRecorder *recorder;
AVAudioPlayer *player;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_stopButton setEnabled:NO];
    [_playButton setEnabled:NO];
    
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyRecording.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:NULL];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
    
    
}


- (IBAction)recordTapped:(id)sender {
    
    // Stop the audio player before recording
    if (player.playing) {
        [player stop];
    }
    
    if (!recorder.recording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [self.timer invalidate];
        [self.audioProgress setHidden:YES];
        // Start recording
        [recorder record];
        [_recordButton setTitle:@"Pause" forState:UIControlStateNormal];
        
        
    } else {
        
        // Pause recording
        [recorder pause];
        [_recordButton setTitle:@"Record" forState:UIControlStateNormal];
    }
    
    [_stopButton setEnabled:YES];
    [_playButton setEnabled:NO];
}










- (IBAction)stopRecord:(id)sender {
    [recorder stop];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
    [_playButton setEnabled:YES];
}



- (IBAction)playRecording:(id)sender {
    if (!recorder.recording){
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
        [player setDelegate:self];
        [player setVolume:100];
        [player play];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25
                                                      target:self
                                                    selector:@selector(updateProgress)
                                                    userInfo:nil
                                                     repeats:YES];
        [self.audioProgress setHidden:NO];
        
    }
}


- (void)updateProgress
{
    float timeLeft = player.currentTime/player.duration;
    
    // upate the UIProgress
    
    self.audioProgress.progress= timeLeft;
}
- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    [_recordButton setTitle:@"Record" forState:UIControlStateNormal];
    
    [_playButton setEnabled:YES];
    [_stopButton setEnabled:NO];
    
}

@end
