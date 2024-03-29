*****************************************************************************
* StrSwap2
*   Replaces delimited substrings in cString with elements in hSwap hash.
*   Substrings are demited with #{}
* Author:
*   Sergio Lima
* Last update:
*   Aug, 2021
* Example:
*   hNewValues := {"is super" => "is", "cool" => "awesome"}
*   ? StrSwap2( "This function #{is super} #{cool}!!!", aNewValues )
*   // results
*   // This function is awesome!!!
* params:
*   cString     <expC> - String with data to be changed
*   hSwap       <expH> - Hash with data to change cString
* Return:
*   expC        cString changed
*****************************************************************************
FUNCTION StrSwap2( cString, hSwap )
LOCAL cRegExpFindDelimiter := HB_RegexComp( "\#\{(.*?)\}" )
LOCAL lInvalidParamNumber := (PCount() < 1 .OR. PCount() > 2)
LOCAL lFirstParamTypeOk := (ValType(hb_PValue(1)) == "C")
LOCAL lSecParamTypeOk := (ValType(hb_PValue(2)) == "H")
LOCAL cDemitedSubString := NIL, cFirstHashValue := NIL

    IF lInvalidParamNumber 
         RETURN NIL
    ENDIF

    IF lFirstParamTypeOk .AND. !lSecParamTypeOk
        RETURN cString
    ENDIF

    if Empty(hSwap) .OR. ;
       Empty( HB_Regex( cRegExpFindDelimiter, cString ) )
        RETURN cString
    ENDIF

    cDemitedSubString := "#{" + hb_HKeyAt( hSwap, 1) + "}"
    cFirstHashValue := hb_HValueAt( hSwap, 1)

    cString := StrTran(cString, cDemitedSubString, cFirstHashValue)
RETURN StrSwap2(cString, hb_HDelAt( hSwap, 1 ))