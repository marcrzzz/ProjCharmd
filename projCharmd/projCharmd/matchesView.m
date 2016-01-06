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
    self.matchesPic.layer.cornerRadius = self.matchesPic.frame.size.width / 2;
    self.matchesPic.clipsToBounds = YES;
    self.matchesPic.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2;
    self.profileImage.clipsToBounds = YES;
    self.profileImage.contentMode = UIViewContentModeScaleAspectFill;
    self.matchesPic.hidden=YES;
    self.matchesName.hidden=YES;
    [_charmd_btn setEnabled:NO];
    [_pass_btn setEnabled:NO];

    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"andrew_Audio" ofType:@"m4a"];
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

- (IBAction)play:(UIButton *)sender{
    
    
    //first time sender.selected is No
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

- (IBAction)pressedCharmd:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"MATCH"
                                          message:@"You have charm'd each other!"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *chatAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Chat", @"chat action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSString * storyboardName = @"Main";
                                   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
                                   UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"chatView"];
                                   [self.navigationController pushViewController:controller animated:YES];
                               }];
    UIAlertAction *profileAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Profile", @"profile action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSString * storyboardName = @"Main";
                                   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
                                   UIViewController *controller2 = [storyboard instantiateViewControllerWithIdentifier:@"profileAndrew"];
                                   [self.navigationController pushViewController:controller2 animated:YES];                               }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:profileAction];
    [alertController addAction:chatAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
     
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
