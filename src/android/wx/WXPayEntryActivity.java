package com.weni.shop.wxapi;

import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;

import com.lyx.pay.wx.Wxpay;
import com.tencent.mm.sdk.constants.ConstantsAPI;
import com.tencent.mm.sdk.modelbase.BaseReq;
import com.tencent.mm.sdk.modelbase.BaseResp;
import com.tencent.mm.sdk.openapi.IWXAPI;
import com.tencent.mm.sdk.openapi.IWXAPIEventHandler;

import android.app.Activity;

import com.tencent.mm.sdk.openapi.WXAPIFactory;

import org.chromium.base.Log;

public class WXPayEntryActivity extends Activity implements IWXAPIEventHandler {


    private static final String TAG = "Weni.WXPayEntryActivity";

    private IWXAPI api;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        api = WXAPIFactory.createWXAPI(this, "wx4fd357e3019b6cd2");
        api.handleIntent(getIntent(), this);
        finish();
    }

    @Override
    public void onReq(BaseReq baseReq) {
        Log.e("type", "2");

    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        api.handleIntent(intent, this);
    }

    @Override
    public void onResp(BaseResp baseResp) {
        Log.e("type", baseResp.getType() + "");
        if (baseResp.getType() == ConstantsAPI.COMMAND_PAY_BY_WX) {
            if (baseResp.errCode == 0) {
                Log.e("success", "success");
                Wxpay.callbackContext.success();
            } else {
                Wxpay.callbackContext.error("支付失败");
            }
        } else {
        }
    }
}
