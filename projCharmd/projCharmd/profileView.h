//
//  profileView.h
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface profileView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userName;
- (IBAction)play:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *userAge;



@end
