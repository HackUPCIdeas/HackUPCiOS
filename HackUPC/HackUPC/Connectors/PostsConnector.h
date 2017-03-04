//
//  PostsConnector.h
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface PostsConnector : NSObject
@property (nonatomic, strong, readonly) NSMutableArray<Post *> *posts;

+ (instancetype)sharedConnector;
- (void)connect;
@end
