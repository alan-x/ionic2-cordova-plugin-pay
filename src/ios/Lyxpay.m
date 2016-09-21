//
//  Lyxpay.m
//  PluginTest
//
//  Created by 冬追夏赶 on 9/15/16.
//
//

#import "Lyxpay.h"

@implementation Lyxpay

-(void)pay:(CDVInvokedUrlCommand *)command
{
    
    id level = [command argumentAtIndex:0];
    id message = [command argumentAtIndex:1];
    
    NSLog(@"%@", level);
    NSLog(@"%@", message);
}

@end
