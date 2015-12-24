//
//  matchesView.m
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import "matchesView.h"

@implementation matchesView
AVAudioPlayer *player2;

-(void)viewDidLoad{
    [super viewDidLoad];
    self.matchesPic.hidden=YES;
    self.matchesName.hidden=YES;

    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"andrewAudio" ofType:@"mp3"];
    NSURL *outputFileURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    
    
    player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:outputFileURL error:nil];
    
    
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [_playButton setTitle:@"Play" forState:UIControlStateNormal];
    self.matchesPic.hidden=0;
    self.matchesName.hidden=0;
    
}

- (IBAction)pressedPlay:(id)sender {
    if (!player2.playing){
        [player2 setDelegate:self];
        [player2 setVolume:100];
        [player2 play];
        [_playButton setTitle:@"Pause" forState:UIControlStateNormal];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25
                                                      target:self
                                                    selector:@selector(updateProgress)
                                                    userInfo:nil
                                                     repeats:YES];
        
        
        
    }
    else {
        
        // Pause recording
        
        [player2 pause];
        [_playButton setTitle:@"Play" forState:UIControlStateNormal];
    }
}

- (void)updateProgress
{
    float timeLeft = player2.currentTime/player2.duration;
    
    // upate the UIProgress
    
    self.audioProgress.progress= timeLeft;
}




- (IBAction)gotoPastMatches:(id)sender {
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"pastMatches"];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
