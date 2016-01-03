//
//  matchesView.h
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface matchesView : UIViewController <AVAudioPlayerDelegate>


@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIProgressView *audioProgress;
@property (weak, nonatomic) IBOutlet UILabel *matchesName;
@property (weak, nonatomic) IBOutlet UIImageView *matchesPic;

- (IBAction)play:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *charmd_btn;
@property (weak, nonatomic) IBOutlet UIButton *pass_btn;




- (IBAction)gotoPastMatches:(id)sender;


@end
