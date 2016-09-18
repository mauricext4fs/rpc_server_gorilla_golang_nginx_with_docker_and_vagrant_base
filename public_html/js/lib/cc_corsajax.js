/*jslint browser: true*/
/*global jQuery, moment */
'use strict';
/**
 * cc_crosajax is a Global methods use 
 * for injection into the pass object.
 */
function cc_corsajax(obj) {

    function init()
    {
        /*
         * This is nasty but necessary for cross domain CORS cookie,
         * this will change  all subsequent jQuery ajax default 
         * behavior
         */
        jQuery.ajaxSetup({
            type: "",
            data: {},
            dataType: '',
            xhrFields: {
               withCredentials: true
            },
            crossDomain: true
        });
    };

    obj.post = function(strServiceUrl, strPayload, callback, strType)
    {
        jQuery.ajax({
            url: strServiceUrl,
            type: "POST",
            data: strPayload,
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            success: function (response) {
                callback(response)
            },
            error: function (response) {
                callback(response)
            }
        });
    };

    init();

};
