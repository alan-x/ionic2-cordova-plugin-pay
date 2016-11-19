//
//  Lyxpay.h
//  PluginTest
//
//  Created by 冬追夏赶 on 9/15/16.
//
//

#import <Cordova/CDVPlugin.h>
#import "WXApi.h"
@interface Lyxpay : CDVPlugin <WXApiDelegate>

- (void)pay:(CDVInvokedUrlCommand*)command;

@end
