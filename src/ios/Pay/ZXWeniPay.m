//
//  ZXWeniPay.m
//  唯咛商城
//
//  Created by 许志雄 on 16/10/21.
//
//

#import "ZXWeniPay.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
@implementation ZXWeniPay

- (void)aliPay:(NSString *)order {
    
    //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
    NSString *appScheme = @"alisdkWeiNi";
    [[AlipaySDK defaultService] payOrder:order fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        
        NSLog(@"1reslut = %@",resultDic);
    }];
}

- (void)wxPay:(NSDictionary *)dict {
    //注册微信支付appid
    [WXApi registerApp:dict[@"appid"]];
    
    PayReq *request = [[PayReq alloc] init];
    request.partnerId = dict[@"partnerid"];
    request.prepayId = dict[@"prepayid"];
    request.package = dict[@"package"];
    request.nonceStr = dict[@"noncestr"];
    request.timeStamp = [dict[@"timestamp"] intValue];
    request.sign = dict[@"sign"];
    [WXApi sendReq:request];
    
}

@end
