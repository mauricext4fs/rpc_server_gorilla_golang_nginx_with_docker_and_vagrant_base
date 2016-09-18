/*jslint browser: true*/
/*global jQuery, moment */
'use strict';
jQuery(function () {

    // Inject all methods from cc_global
    cc_global_lib(this); 

    var $this = this;

    this.elResponseErrorMsg = jQuery("p.save_msg_error");
    this.elResponseSuccessMsg = jQuery("p.save_msg_success");

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
            objFormValue[objjQueryValue[numKey].name] = objjQueryValue[numKey].value;
        }

        return objFormValue;
    };

    this.sendDataToRegister = function(objForm)
    {
        // Reset all Callback Msg Area
        $this.elResponseErrorMsg.hide();
        $this.elResponseSuccessMsg.hide();
        

        $this.jsonrpc.call('Registration.Add', 
            [
                objForm
            ],
            $this,
            "sendDataToRegisterSuccessCallback",
            "sendDataToRegisterErrorCallback"
        );
    };

    this.sendDataToRegisterErrorCallback = function(response)
    {
        if (!$this.empty(response)) {
            $this.elResponseErrorMsg.text(response);
            $this.elResponseErrorMsg.show('slow');
        }
    };

    this.sendDataToRegisterSuccessCallback = function(response)
    {
        if (!$this.empty(response)) {
            $this.elResponseSuccessMsg.text(response.Msg);
            $this.elResponseSuccessMsg.show('slow');
        }
    };

    $this.init();
});
