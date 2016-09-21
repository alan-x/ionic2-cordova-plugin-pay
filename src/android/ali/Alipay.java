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
                callbackContext.success();
                callbackContext.error("error"+result);
            }
        });

    }
}
