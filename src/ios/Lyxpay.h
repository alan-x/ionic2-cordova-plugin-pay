//
//  Lyxpay.h
//  PluginTest
//
//  Created by 冬追夏赶 on 9/15/16.
//
//

#import <Cordova/CDVPlugin.h>

@interface Lyxpay : CDVPlugin

- (void)pay:(CDVInvokedUrlCommand*)command;

@end
