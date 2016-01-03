//
//  ViewController.m
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import "ViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController *recordView = [storyboard instantiateViewControllerWithIdentifier:@"recordView"];
    [top presentViewController:recordView animated:YES completion:nil];
    
    if ([FBSDKAccessToken currentAccessToken]) {
//            self.fBloginButton.hidden=YES;
//            self.firstLabel.hidden=0;
//            self.continueButton.hidden=0;
//            [self.view addSubview:_fBloginButton];
     
        // TODO:Token is already available.
//    }
//    //FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    
//    //loginButton.center = self.view.center;
    }
    else{
            [self.view addSubview:_fBloginButton];
            self.firstLabel.hidden=YES;
            self.continueButton.hidden=YES;
        }
    // Do any additional setup after loading the view, typically from a nib.
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)continueButton:(id)sender {
    NSString * storyboardName = @"Main";
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
            UIViewController *aboutmeView = [storyboard instantiateViewControllerWithIdentifier:@"aboutmeInfo"];
            [self presentViewController:aboutmeView animated:YES completion:nil];
}

- (IBAction)fBloginButton:(id)sender {
    if ([FBSDKAccessToken currentAccessToken]){
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]
                         fromViewController:self
                                    handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                        if (error) {
                                            NSLog(@"Process error");
                                        } else if (result.isCancelled) {
                                            NSLog(@"Cancelled");
                                        } else {
                                            NSLog(@"Logged in");
                                        }
                                        self.firstLabel.hidden=YES;
                                        self.continueButton.hidden=0;
                                        
                                        //process error or result
                                    }];
    }

   
}
@end
