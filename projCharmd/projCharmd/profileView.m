//
//  profileView.m
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import "profileView.h"
#import <AVFoundation/AVFoundation.h>

@implementation profileView
AVAudioPlayer *play;


-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"taysAudio" ofType:@"m4a"];
    NSURL *outputFileURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];


    play = [[AVAudioPlayer alloc] initWithContentsOfURL:outputFileURL error:nil];
    
    
}
- (IBAction)play:(id)sender {
    if (!play.playing){
        [play setDelegate:self];
        [play setVolume:100];
        [play play];
        [_playButton setTitle:@"Pause" forState:UIControlStateNormal];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25
                                                      target:self
                                                    selector:@selector(updateProgress)
                                                    userInfo:nil
                                                     repeats:YES];
       
        
        
    }
    else {
        
        // Pause recording
       
        [play pause];
        [_playButton setTitle:@"Play" forState:UIControlStateNormal];
    }
    
//    CFBundleRef mainBundle =CFBundleGetMainBundle();
//    CFURLRef soundFileURLRef;
//    soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"taysAudio", CFSTR ("m4a"), NULL);
//    UInt32 soundID;
//    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
//    AudioServicesPlaySystemSound(soundID);
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [_playButton setTitle:@"Play" forState:UIControlStateNormal];
    
}

- (void)updateProgress
{
    float timeLeft = play.currentTime/play.duration;
    
    // upate the UIProgress
    
    self.audioProgress.progress= timeLeft;
}
@end
