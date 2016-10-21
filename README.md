### cordova-plugin-pay

> 其实是给ionic2做的插件，未经过cordova测试，需要将ionic-native替换成我的源，等做完再详细写

===
1. Android支付宝支付 完成
2. Android微信支付   完成
3. IOS支付宝支付     完成
4. IOS微信支付       文成

### 负责人
- 设计:林耀鑫
- Android平台的微信/支付宝接入:林耀鑫
- IOS平台的微信/支付宝接入:许志雄

===
#### 调用示例

- 引入LyxPay： `import {StatusBar, Lyxpay,PayCallBack} from 'ionic-native';`
- 继承 `PayCallBack`接口，重写`success`和`failure`方法

    ```
class CallBack implements PayCallBack{
  success(): any {
    alert("success");
  }

  failure(msg: string): any {
    alert(msg);
  }

}


    ```
===
- 调用` Lyxpay.pay(1,data.text(),new CallBack());`
    - 参数一是支付类型：1是支付宝，2是微信
    - 参数二是支付字符串
    - 参数三是重写的回调方法


