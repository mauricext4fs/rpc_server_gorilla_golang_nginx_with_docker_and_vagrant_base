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

    this.call = function(strRpcMethod, objParams, objContext, strFncSuccessCallback, strFncErrorCallback)
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

            if (!$this.empty(objContext)) {
                var objResult = $this.gv(response, "result");
                var objError = $this.gv(response, "error");
                
                /*
                 * As JSON-RPC Standard... if error is present, 
                 * result should be null, so only one type of 
                 * response can come back
                 */
                if (!$this.empty(objError) && !$this.empty($this.gv(objContext, strFncErrorCallback))) {
                    objContext[strFncErrorCallback](response.error);
                } else if (!$this.empty($this.gv(objContext, strFncSuccessCallback))) {
                    objContext[strFncSuccessCallback](response.result);
                }
            };

        }, "json");

    };
};
