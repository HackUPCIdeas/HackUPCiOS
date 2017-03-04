//
//  Performancer.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import "Performancer.h"

@implementation Performancer
@synthesize json;

- (NSString *)json {
    NSDictionary *dict = @{
                           @"name" : self.name,
                           @"surname" : self.surname,
                           @"company" : self.company,
                           @"city" : self.city,
                           @"country" : self.country,
                           @"email" : self.email,
                           @"phone" : self.phone,
                           @"desc" : self.desc,
                           @"donateURI" : self.donateURI,
                           @"age" : self.age,
                           @"active" : @(self.active),
                           @"lat" : @(self.lat),
                           @"lon" : @(self.lon)
                            };
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}
@end
