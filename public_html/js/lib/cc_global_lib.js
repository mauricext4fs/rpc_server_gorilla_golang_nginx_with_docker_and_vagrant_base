/*jslint browser: true*/
/*global jQuery, moment */
'use strict';
/**
 * Global methods use for injection into 
 * the pass object.
 */
function cc_global_lib(obj) {
    /**
     * Consider empty:
     * - Undefined varaible (or nothing pass in arg)
     * - Integer = 0
     * - Empty string
     * - Empty array
     * - Empty jQuery Object
     * - Empty Object
     */
    obj.empty = function(mul) {
        var boolReturn = false, numKey = 0, strKey = "";

        if (mul === undefined) {
            boolReturn = true;
        } else if (mul === 0) {
            boolReturn = true;
        } else if (mul === "") {
            boolReturn = true;
        } else if (mul === null) {
            boolReturn = true;
        } else if (Object.prototype.toString.call(mul) === '[object Array]') {
            if (mul.length === 0) {
                boolReturn = true;
            }
        } else if (Object.prototype.toString.call(mul) === '[object Object]') {

            if (mul instanceof jQuery) {
                boolReturn = jQuery.isEmptyObject(mul[0]);
            } else {

                for (strKey in mul) {
                    if (mul.hasOwnProperty(strKey)) {
                        numKey += 1;
                    }
                }
                if (numKey === 0) {
                    boolReturn = true;
                }
            }
        }

        return boolReturn;
    };


    /**
     * Get value from object or array (without
     * having to check that the element exist 
     * first
     */
    obj.gv = function(mul, strKey, mulDefault) {
        var mulValue = mulDefault;

        if (mul === undefined || !(typeof mul === "object" || typeof mul === "Array"))
        {
            throw "first argument of gv() must be an array or object";
        }

        if (mul[strKey] !== undefined) {
            mulValue = mul[strKey];
        }

        return mulValue;
    }
};
