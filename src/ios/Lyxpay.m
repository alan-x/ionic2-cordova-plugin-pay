//
// Lyxpay.m
// PluginTest
//
// Created by 冬追夏赶 on 9 / 15 / 16.
//
//

#import "Lyxpay.h"
//#import "ZXWeniPay.h"
#import <AlipaySDK/AlipaySDK.h>


@interface Lyxpay () 
@property (nonatomic, strong) CDVInvokedUrlCommand *tempCommand;
@end

@implementation Lyxpay
- (void)pay : (CDVInvokedUrlCommand *)command
{
    self.tempCommand = command;
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
//    self.commandDelegate
//    ZXWeniPay *pay = [[ZXWeniPay alloc] init];
    if (type == 1) {
        //支付宝
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = @"alisdkWeiNi";
        [[AlipaySDK defaultService] payOrder:command.arguments[1] fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            CDVPluginResult* pluginResult = nil;
            if ([resultDic[@"resultStatus"] integerValue] == 9000) {
                //成功
                
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            } else {
                //失败
                NSLog(@"sadahdasjkd");
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@""];
            }
            
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            NSLog(@"1reslut = %@",resultDic);
        }];
        
        
//        [pay aliPay:command.arguments[1]];
    } else if (type == 2) {
        //微信
        //注册微信支付appid
        [WXApi registerApp:command.arguments[1][@"appid"]];
        
        PayReq *request = [[PayReq alloc] init];
        request.partnerId = command.arguments[1][@"partnerid"];
        request.prepayId = command.arguments[1][@"prepayid"];
        request.package = command.arguments[1][@"package"];
        request.nonceStr = command.arguments[1][@"noncestr"];
        request.timeStamp = [command.arguments[1][@"timestamp"] intValue];
        request.sign = command.arguments[1][@"sign"];
        [WXApi sendReq:request];
//        [pay wxPay:command.arguments[1]];
        
    }
    
    
}

- (void)onResp:(BaseResp *)resp {
    CDVPluginResult* pluginResult = nil;
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp *response = (PayResp*)resp;
        switch(response.errCode){
            case WXSuccess:
                //服务器端查询支付通知或查询API返回的结果再提示成功
                NSLog(@"支付成功");
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                break;
            default:
                NSLog(@"支付失败，retcode=%d",resp.errCode);
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@""];
                break;
        }
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.tempCommand .callbackId];

}

@end
