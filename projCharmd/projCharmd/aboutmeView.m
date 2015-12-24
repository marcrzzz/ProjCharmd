//
//  aboutmeView.m
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//


#import "aboutmeView.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@implementation aboutmeView

- (IBAction)fBlogoutButton:(id)sender {

    
    [FBSDKAccessToken setCurrentAccessToken:nil];
    [FBSDKProfile setCurrentProfile:nil];
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];
    
}
@end
