package com.lyx.pay;

import com.lyx.pay.ali.Alipay;
import com.lyx.pay.wx.Wxpay;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;

/**
 * Created by FollowWinter on 9/15/16.
 */
public class PayFactory extends CordovaPlugin{
    public static final int TYPE_ALIPAY=1;
    public static final int TYPE_WXPAY=2;

    public static final String ACT_PAY="pay";

    private static PayFactory payFactory;

    private Pay pay;

//    private PayFactory(){}

//    public static PayFactory getInstance(){
//        if (payFactory==null){
//            payFactory=new PayFactory();
//        }
//        return payFactory;
//    }
//
//    public void pay(){
//
//    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        if (ACT_PAY.equals(action)){
//            callbackContext.success();
//            return true;
            int type=args.getInt(0);
            String param=args.getString(1);
            switch (type){
                case TYPE_ALIPAY:{
                    pay=new Alipay();
                    break;
                }
                case TYPE_WXPAY:{
                    pay=new Wxpay();
                    break;
                }
            }
            pay.pay(cordova,param,callbackContext);
            return true;
        }

        return  false;
    }


}
