//
//  ViewController.h
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *fBloginButton;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

- (IBAction)continueButton:(id)sender;

- (IBAction)fBloginButton:(id)sender;



@end

