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

-(IBAction)charmd {
    UIAlertViewStylePlainTextInput;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.matchesPic.layer.cornerRadius = self.matchesPic.frame.size.width / 2;
    self.matchesPic.clipsToBounds = YES;
    self.matchesPic.contentMode = UIViewContentModeScaleAspectFill;
    self.matchesPic.hidden=YES;
    self.matchesName.hidden=YES;
    [_charmd_btn setEnabled:NO];
    [_pass_btn setEnabled:NO];

    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"andrewAudio" ofType:@"mp3"];
    NSURL *outputFileURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    
    
    player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:outputFileURL error:nil];
    
    
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    _playButton.selected=NO;
    self.matchesPic.hidden=0;
    self.matchesName.hidden=0;
    [_charmd_btn setEnabled:YES];
    [_pass_btn setEnabled:YES];
    
}

- (IBAction)pressedPlay:(UIButton *)sender {
//    if (!player2.playing){
//        [player2 setDelegate:self];
//        [player2 setVolume:100];
//        [player2 play];
//        [_playButton setTitle:@"Pause" forState:UIControlStateNormal];
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25
//                                                      target:self
//                                                    selector:@selector(updateProgress)
//                                                    userInfo:nil
//                                                     repeats:YES];
//        
//        
//        
//    }
//    else {
//        
//        // Pause recording
//        
//        [player2 pause];
//        [_playButton setTitle:@"Play" forState:UIControlStateNormal];
//    }
    if (sender.selected) {
        
        [player2 pause];
        sender.selected=NO;
    }
    else{
        [player2 setDelegate:self];
        [player2 setVolume:100];
        [player2 play];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25
                                                      target:self
                                                    selector:@selector(updateProgress)
                                                    userInfo:nil
                                                     repeats:YES];
        
        sender.selected=YES;
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
