//
//  ConnectorManager.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import "ConnectorManager.h"
#import "PostsConnector.h"

@implementation ConnectorManager
+ (void)connectAllConnectors {
    [[PostsConnector sharedConnector] connect];
}
@end
