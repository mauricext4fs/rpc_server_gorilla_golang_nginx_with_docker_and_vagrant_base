var cc_jsonrpc = function(strServiceUrl) {

    "use strict";

    // Inject all methods from cc_coreajax
    cc_corsajax(this);
    cc_global_lib(this); 

    var $this = this;
    
    this.strServiceUrl = strServiceUrl;
    
    this.init = function()
    {
    };

    this.call = function(strRpcMethod, objParams, objContext, strFncCallback)
    {
        var objRequest = {
            jsonrpc: "2.0",
            id: 222,
            method: strRpcMethod,
            params: objParams
        }
        var strPayload = JSON.stringify(objRequest);
        $this.post($this.strServiceUrl, strPayload, function(response) {

            if (response.id != objRequest.id) {
                throw "Security Error";
            };

            if (!$this.empty(objContext) && !$this.empty($this.gv(objContext, strFncCallback))) {
                objContext[strFncCallback](response.result);
            };

        }, "json");

    };
};
