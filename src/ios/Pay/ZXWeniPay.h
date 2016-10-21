//
//  ZXWeniPay.h
//  唯咛商城
//
//  Created by 许志雄 on 16/10/21.
//
//

#import <Foundation/Foundation.h>

@interface ZXWeniPay : NSObject
- (void)aliPay:(NSString *)order;
- (void)wxPay:(NSDictionary *)dict;
@end
