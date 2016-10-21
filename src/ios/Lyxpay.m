//
// Lyxpay.m
// PluginTest
//
// Created by 冬追夏赶 on 9 / 15 / 16.
//
//

#import "Lyxpay.h"
#import "ZXWeniPay.h"
@implementation Lyxpay
- (void)pay : (CDVInvokedUrlCommand *)command
{
    
    //type  1是支付宝 2是微信
    //param

//    [self.commandDelegate runInBackground:^{
//
//
//        [[AlipaySDK defaultService] payOrder:@"" fromScheme:@"" callback:^(NSDictionary *resultDic) {
//             NSLog(@"reslut = %@",resultDic);
//
//            CDVPluginResult * pluginResult = nil;
//
//            pluginResult =[CDVPluginResult resultWithStatus : CDVCommandStatus_OK messageAsString : @""];
//
//            [self.commandDelegate sendPluginResult : pluginResult callbackId : command.callbackId];
//
//
//        }];
//    }];
    
    
//    CDVPluginResult* pluginResult = nil;
//    NSString* myarg = [command.arguments objectAtIndex:0];

//    if (myarg != nil) {
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
//    } else {
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
//    }
//    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    NSInteger type = [command.arguments[0] integerValue];
    
    ZXWeniPay *pay = [[ZXWeniPay alloc] init];
    if (type == 1) {
        //支付宝
        [pay aliPay:command.arguments[1]];
    } else if (type == 2) {
        //微信
        [pay wxPay:command.arguments[1]];
        
    }
    
    
}

@end
