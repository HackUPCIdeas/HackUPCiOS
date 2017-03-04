//
//  BorderRoundButton.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import "BorderRoundButton.h"

@implementation BorderRoundButton


- (void)drawRect:(CGRect)rect {
    self.layer.cornerRadius = CGRectGetHeight(rect)/2;
    self.layer.masksToBounds = YES;
}


@end
