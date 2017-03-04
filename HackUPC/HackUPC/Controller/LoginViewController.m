//
//  LoginViewController.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "LoginViewController.h"
#import "FEZAuth.h"
#import "ConnectorManager.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)fblogin:(UIButton *)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    if ([UIApplication.sharedApplication canOpenURL:[NSURL URLWithString:@"fb://"]])
    {
        login.loginBehavior = FBSDKLoginBehaviorSystemAccount;
    }
    [login logInWithReadPermissions:@[@"public_profile", @"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Unexpected login error: %@", error);
            NSString *alertMessage = error.userInfo[FBSDKErrorLocalizedDescriptionKey] ?: @"There was a problem logging in. Please try again later.";
            NSString *alertTitle = error.userInfo[FBSDKErrorLocalizedTitleKey] ?: @"Oops";
            [[[UIAlertView alloc] initWithTitle:alertTitle
                                        message:alertMessage
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
        else {
            if(result.token) {
                
                [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                                   parameters:@{@"fields": @"picture, name, email"}]
                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id userinfo, NSError *error) {
                     [FEZAuth signInWithFacebook:result.token.tokenString successCallback:^(FIRUser * _Nullable user) {
                         __weak typeof(self)weakSelf = self;
                         dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                         dispatch_async(queue, ^(void) {
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 __strong typeof(weakSelf)strongSelf = weakSelf;
                                 [ConnectorManager connectAllConnectors];
                                 [strongSelf presentTab];
                                 NSLog(@"%@", userinfo);
                             });
                         });
                     } failureCallback:^(NSError * _Nullable error) {
                         NSLog(@"%@", [error localizedDescription]);
                     }];
                 }];
            } else {
                NSLog(@"Login Cancel");
            }
            
        }
    }];
}

- (void)presentTab {
    [self performSegueWithIdentifier:@"dashboard" sender:self];
}

@end
