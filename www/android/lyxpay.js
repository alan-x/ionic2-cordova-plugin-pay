
var
    exec = require('cordova/exec')
;


var Pay = function() {
};

Pay.pay = function(pay_type,pay_param,payCallback) {
    exec(function () {
        payCallback.success();
    }, function (error_essage) {
        payCallback.failure(error_essage);
    }, "Lyxpay", "pay", [pay_type,pay_param,payCallback]);
};


module.exports = Pay;



