package com.lyx.pay.wx;

import android.content.Context;

import com.lyx.pay.Pay;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;

/**
 * Created by FollowWinter on 9/15/16.
 */
public class Wxpay extends Pay{
    @Override
    public void pay(CordovaInterface cordova, String param, CallbackContext callbackContext) {
        callbackContext.success();

    }
}