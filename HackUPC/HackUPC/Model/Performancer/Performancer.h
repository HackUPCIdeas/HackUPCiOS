//
//  Performancer.h
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirebaseModel.h"

@interface Performancer : NSObject <FirebaseModel>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *donateURI;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, assign) BOOL active;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lon;
@end
