
var
    exec = require('cordova/exec')
;


var Pay = function() {
};

Pay.pay = function(pay_type,pay_param) {
    exec(function () {
        alert("success");
    }, function (error_essage) {
        alert(error_essage)
    }, "Lyxpay", "pay", [pay_type,pay_param]);
};

/*
 Keyboard.styleDark = function(dark) {
 exec(null, null, "Keyboard", "styleDark", [dark]);
 };
 */

module.exports = Pay;



