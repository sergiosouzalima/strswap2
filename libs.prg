*****************************************************************************
* StrSwap2
*   Replaces delimited substrings in cString with elements in hSwap hash.
*   Substrings are demited with #{}
* Example:
*   hNewValues := {"first" => "is", "second" => "wonderful"}
*   ? StrSwap2( "This function #{is super} #{cool}!!!", aNewValues )
*   // results
*   // This function is wonderful!!!
* params:
*   cString     <expC> - String with data to be changed
*   hSwap       <expH> - Hash with data to change cString
* Return:
*   expC        cString changed
*****************************************************************************
FUNCTION StrSwap2( cString, hSwap )
//LOCAL aFound := {}
LOCAL cDemitedSubString := NIL, cFirstHashValue := NIL
LOCAL cRegExpFindDelimiter := HB_RegexComp( "\#\{(.*?)\}" )

    IF PCount() < 2
        RETURN NIL
    ENDIF

    IF !(ValType(cString) == "C" .AND. ValType(hSwap) == "H")
        RETURN NIL
    ENDIF

    if Empty(hSwap) .OR. ;
       Empty( HB_Regex( cRegExpFindDelimiter, cString ) )
        RETURN cString
    ENDIF

    /*cHashKey := aFound[2]
    IF !hb_HHasKey( hSwap, cHashKey )
        RETURN cString
    ENDIF*/

    /*? "==="
    //? hb_HValueAt( hSwap, 1)
    //? hb_HKeyAt( hSwap, 1)
    aFound := HB_Regex( cRegExpFindDelimiter, cString )
    ? aFound[1]
    ? aFound[2]
    ? hSwap[ aFound[2] ]
    cString := StrTran(cString, aFound[1], hSwap[aFound[2]])
    ? cString
    ? "---"
    aFound := HB_Regex( cRegExpFindDelimiter, cString )
    cString := StrTran(cString, aFound[1], hSwap[aFound[2]])
    ? cString
    ? "===="*/

    /*cDemitedSubString := aFound[1]
    cHashKey := aFound[2]
    cNewValue := hSwap[cHashKey]*/

    /*? "-----"
    ? cDemitedSubString
    ? cHashKey
    ? cNewValue*/

    //hb_HDelAt( <hTable>, <nPosition> ) -> <hTable>

    //? "======="
    //? "#{" + hb_HKeyAt( hSwap, 1) + "}"
    //? hb_HValueAt( hSwap, 1)

    cDemitedSubString := "#{" + hb_HKeyAt( hSwap, 1) + "}"
    cFirstHashValue := hb_HValueAt( hSwap, 1)

    cString := StrTran(cString, cDemitedSubString, cFirstHashValue)

    //? cString

    //hSwap := hb_HDelAt( hSwap, 1 )

    /*
    cHashKey := aFound[2]
    IF hb_HHasKey( hSwap, cHashKey )
        cDemitedSubString := aFound[1]
        cNewValue := hSwap[cHashKey]
        cString := StrTran(cString, cDemitedSubString, cNewValue)  
    ENDIF 
    hb_HDel( hSwap, cHashKey )
  */

RETURN StrSwap2(cString, hb_HDelAt( hSwap, 1 ))
//RETURN NIL

