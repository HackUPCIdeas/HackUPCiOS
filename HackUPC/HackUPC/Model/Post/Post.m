//
//  Post.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import "Post.h"

@implementation Post
@synthesize json;

- (NSString *)json {
    NSDictionary *dict = @{
                           @"title" : self.title,
                           @"description" : self.desc,
                           @"user_id" : self.userID,
                           @"event_date" : self.eventDate,
                           @"creation_date" : self.creationDate
                           };
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
@end
