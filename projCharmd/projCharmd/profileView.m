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

    self.profile_image.layer.cornerRadius = self.profile_image.frame.size.width / 2;
    self.profile_image.clipsToBounds = YES;
    self.profile_image.contentMode = UIViewContentModeScaleAspectFill;
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"taysAudio" ofType:@"m4a"];
    NSURL *outputFileURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];


    play = [[AVAudioPlayer alloc] initWithContentsOfURL:outputFileURL error:nil];
    
    
}


    
    


- (IBAction)gotoProfile:(id)sender {
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"profiles"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)buttonTapped:(UIButton *)sender{
    
    
    //first time sender.selected is No
    if (sender.selected) {
        
        [play pause];
        sender.selected=NO;
    }
    else{
        [play setDelegate:self];
        [play setVolume:100];
        [play play];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25
                                                      target:self
                                                    selector:@selector(updateProgress)
                                                    userInfo:nil
                                                     repeats:YES];
        
        sender.selected=YES;
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    _playButton.selected=NO;
    
}

- (void)updateProgress
{
    float timeLeft = play.currentTime/play.duration;
    
    // upate the UIProgress
    
    self.audioProgress.progress= timeLeft;
}
@end
