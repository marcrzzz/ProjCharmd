//
//  profiles.h
//  projCharmd
//
//  Created by Marilyn Cruz on 1/3/16.
//  Copyright © 2016 Marilyn Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profiles : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)play:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIProgressView *progess;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@end
