package com.lyx.pay.ali;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

import com.alipay.sdk.app.PayTask;
import com.lyx.pay.Pay;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;


/**
 * Created by FollowWinter on 9/15/16.
 */
public class Alipay extends Pay{
    private Context context;
    @Override
    public void pay(final CordovaInterface cordova, final String param, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                PayTask alipay = new PayTask(cordova.getActivity());
                // 调用支付接口，获取支付结果
                String result = alipay.pay(param, true);
                PayResult payResult = new PayResult(result);
                String resultInfo = payResult.getResult();// 同步返回需要验证的信息

                String resultStatus = payResult.getResultStatus();

                if (TextUtils.equals(resultStatus, "9000")) {
                    callbackContext.success();
                } else {
                    // 判断resultStatus 为非"9000"则代表可能支付失败
                    // "8000"代表支付结果因为支付渠道原因或者系统原因还在等待支付结果确认，最终交易是否成功以服务端异步通知为准（小概率状态）
                    if (TextUtils.equals(resultStatus, "8000")) {
                        Toast.makeText(cordova.getActivity(), "支付结果确认中", Toast.LENGTH_SHORT).show();
                    } else {
                        // 其他值就可以判断为支付失败，包括用户主动取消支付，或者系统返回的错误
                        callbackContext.error("支付失败");

                    }
                }
            }
        });

    }
}
