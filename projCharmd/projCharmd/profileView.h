//
//  profileView.h
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface profileView : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIProgressView *audioProgress;
@property (weak, nonatomic) IBOutlet UIImageView *profile_image;


- (IBAction)gotoProfile:(id)sender;

- (IBAction)buttonTapped:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *userAge;



@end
