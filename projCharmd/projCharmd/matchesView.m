//
//  matchesView.m
//  projCharmd
//
//  Created by Marilyn Cruz on 12/19/15.
//  Copyright © 2015 Marilyn Cruz. All rights reserved.
//

#import "matchesView.h"

@implementation matchesView




- (IBAction)gotoPastMatches:(id)sender {
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"pastMatches"];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
