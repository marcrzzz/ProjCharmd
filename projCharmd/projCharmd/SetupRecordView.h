//
//  SetupRecordView.h
//  projCharmd
//
//  Created by Marilyn Cruz on 12/20/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AvFoundation/AvFoundation.h>



@interface SetupRecordView : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIProgressView *audioProgress;
@property (strong, nonatomic) NSTimer *timer;


- (IBAction)recordTapped:(id)sender;
- (IBAction)stopRecord:(id)sender;
- (IBAction)playRecording:(id)sender;



@end
