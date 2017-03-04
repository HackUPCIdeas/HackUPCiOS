//
//  Post.h
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirebaseModel.h"

@interface Post : NSObject <FirebaseModel>
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *eventDate;
@property (nonatomic, strong) NSString *creationDate;
@end
