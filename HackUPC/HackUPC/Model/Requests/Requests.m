//
//  Requests.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import "Requests.h"

@implementation Requests
#pragma mark - Class funcs
+ (NSString *)serverURL {
    return @"http://10.4.180.83:8989";
}

#pragma mark - Performancers requests -
+ (void)performancersWithSuccess:(SuccessBlock)success
                         failure:(FailureBlock)failure {
    [self getAllObjectFromTable:@"performancer" withSuccess:success failure:failure];
    
}

+ (void)createPerformancer:(Performancer *)performancer
               withSuccess:(SuccessBlock)success
                   failure:(FailureBlock)failure {
    
    NSString *url = [NSString stringWithFormat:@"%@/performancer", [self serverURL]];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSString *body = performancer.json;
    NSMutableURLRequest *req = [self requestWithBody:body method:@"POST" url:url];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            if ([responseObject[@"code"] integerValue] == 200) {
                success(responseObject);
            } else {
                failure(responseObject, nil);
            }
        } else {
            failure(responseObject, error);
        }
    }] resume];
    
}

#pragma mark - Posts requets -
+ (void)postsWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    [self getAllObjectFromTable:@"posts" withSuccess:success failure:failure];
}

+ (void)submitPost:(Post *)post withSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    NSString *url = [NSString stringWithFormat:@"%@/posts", [self serverURL]];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSString *body = post.json;
    NSMutableURLRequest *req = [self requestWithBody:body method:@"POST" url:url];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            if ([responseObject[@"code"] integerValue] == 200) {
                success(responseObject);
            } else {
                failure(responseObject, nil);
            }
        } else {
            failure(responseObject, error);
        }
    }] resume];
}

#pragma mark - User requests -
+ (void)createUser:(User *)userInfo withSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    
}

+ (void)updateUser:(User *)user withSuccess:(SuccessBlock)success
           failure:(FailureBlock)failure {
    
}

+ (void)logInWithUserMail:(NSString *)mail
                 password:(NSString *)pass
              withSuccess:(SuccessBlock)success
                  failure:(FailureBlock)failure {
    NSDictionary *dict = @{@"username" : mail, @"password" : pass};
    NSString *body = [self jsonByDictionary:dict];
    
    NSString *url = [NSString stringWithFormat:@"%@/login", [self serverURL]];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [self requestWithBody:body method:@"POST" url:url];
    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            if ([responseObject[@"code"] integerValue] == 200) {
                success(responseObject);
            } else {
                failure(responseObject, nil);
            }
        } else {
            failure(responseObject, error);
        }
    }] resume];
    
}

#pragma mark - Private Api -
+ (NSString *)jsonByDictionary:(NSDictionary *)dict {
    NSData *json = [NSJSONSerialization
                    dataWithJSONObject:dict
                    options:NSJSONWritingPrettyPrinted
                    error:nil];
    return [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
}

+ (NSMutableURLRequest *)requestWithMethod:(NSString *)method url:(NSString *)url {
    return [self requestWithBody:nil method:method url:url];
}

+ (void)getAllObjectFromTable:(NSString *)table
                  withSuccess:(SuccessBlock)success
                      failure:(FailureBlock)failure {
   
    NSString *url = [NSString stringWithFormat:@"%@/%@", [self serverURL], table];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [self requestWithMethod:@"GET" url:url];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            if ([responseObject[@"code"] integerValue] == 200) {
                success(responseObject);
            } else {
                failure(responseObject, nil);
            }
        } else {
            failure(responseObject, error);
        }
    }] resume];
    
}

+ (NSMutableURLRequest *)requestWithBody:(NSString *)body method:(NSString *)method url:(NSString *)url {
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:url parameters:nil error:nil];
    [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (body != nil) [req setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    return req;
}
@end
