//
//  PostsConnector.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import "PostsConnector.h"
#import "FEZDatabaseConnector.h"
#import "Constants.h"

@interface PostsConnector () <FEZDatabaseConnectorDelegate>
@property (nonatomic, strong) FEZDatabaseConnector *postsConnector;
@end

@implementation PostsConnector
+ (instancetype)sharedConnector {
    static dispatch_once_t onceToken;
    static PostsConnector *connector = nil;
    dispatch_once(&onceToken, ^{
        connector = [PostsConnector new];
    });
    
    return connector;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _postsConnector = [FEZDatabaseConnector linkWithDatabaseName:@"/posts"];
        _postsConnector.delegate = self;
    }
    return self;
}

- (void)connect {
    [_postsConnector observeWithType:FEZDatabaseEventAddedObject];
    [_postsConnector observeWithType:FEZDatabaseEventRemovedObject];
}

- (NSArray<Post *> *)posts {
    return [_postsConnector.objects copy];
}

#pragma mark - FEZDatabaseConnector Delegate
- (void)databaseConnector:(FEZDatabaseConnector *)databaseConnector
         objectIdentifier:(NSString *)identifier
          didAddNewObject:(id)object {
    [[NSNotificationCenter defaultCenter] postNotificationName:kTReloadPostsNotification object:nil];
}

- (void)databaseConnector:(FEZDatabaseConnector *)databaseConnector objectIdentifier:(NSString *)identifier didRemoveObject:(id)object {
    [[NSNotificationCenter defaultCenter] postNotificationName:kTReloadPostsNotification object:nil];
}
@end
