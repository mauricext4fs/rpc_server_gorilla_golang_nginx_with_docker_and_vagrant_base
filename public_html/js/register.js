/*jslint browser: true*/
/*global jQuery, moment */
'use strict';
jQuery(function () {

    // Inject all methods from cc_global
    cc_global_lib(this); 

    var $this = this;

    this.jsonrpc = new cc_jsonrpc("http://golang_sample_backend.local:9444/rpc");

    this.init = function()
    {
        $this.registerEvent();
    };


    this.registerEvent = function()
    {
        var elRegisterBtn = jQuery.find("form button.register");
        jQuery(elRegisterBtn).on("click", function(event) {
            event.preventDefault();
            var elForm = jQuery(this).closest("form");
            var objForm = $this.getFormValue(elForm);
            $this.sendDataToRegister(objForm);
        });
    };

    this.getFormValue = function(elForm)
    {
        var objFormValue = {};
        var objjQueryValue = elForm.serializeArray();
        for (var numKey in objjQueryValue) {
            console.log(objjQueryValue[numKey]);
            objFormValue[objjQueryValue[numKey].name] = objjQueryValue[numKey].value;
        }

        return objFormValue;
    };

    this.sendDataToRegister = function(objForm)
    {
        $this.jsonrpc.call('Registration.Add', 
            [
                objForm
            ],
            $this,
            "sendDataToRegisterCallback"
        );
    };

    this.sendDataToRegisterCallback = function(response)
    {
        console.log(response);
    };

    $this.init();
});
