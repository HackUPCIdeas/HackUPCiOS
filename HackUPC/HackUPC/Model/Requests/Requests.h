//
//  Requests.h
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Post.h"
#import "User.h"
#import "Performancer.h"

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(id responseObject, NSError *error);

@interface Requests : NSObject

+ (void)performancersWithSuccess:(SuccessBlock)success
                         failure:(FailureBlock)failure;
+ (void)createPerformancer:(Performancer *)performancer
               withSuccess:(SuccessBlock)success
                   failure:(FailureBlock)failure;

+ (void)postsWithSuccess:(SuccessBlock)success
                 failure:(FailureBlock)failure;
+ (void)submitPost:(Post *)post
       withSuccess:(SuccessBlock)success
           failure:(FailureBlock)failure;


+ (void)updateUser:(User *)user withSuccess:(SuccessBlock)success
                      failure:(FailureBlock)failure;
+ (void)createUser:(User *)userInfo
       withSuccess:(SuccessBlock)success
           failure:(FailureBlock)failure;

+ (void)logInWithUserMail:(NSString *)mail
                 password:(NSString *)pass
              withSuccess:(SuccessBlock)success
                  failure:(FailureBlock)failure;


@end
