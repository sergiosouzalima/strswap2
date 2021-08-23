FUNCTION Main()
    test_when_no_params_given()

    test_when_one_empty_param_given( "" )

    test_when_two_empty_params_given( "", "" )

    test_when_one_param_given( ;
        "Hello, world!!!" )

    test_when_two_params_given_without_delimiters( ;
        "Hello, world!!!", ;
        {"first" => "pandemic"} )

    test_when_two_params_given_with_incompleted_delimiters( ;
        "{Hello}, #{world!!!", ;
        {"first" => "pandemic"} )

    test_when_first_param_is_ok_second_param_is_empty_hash( ;
        "#{Hello}, #{world}!!!", ;
        {} )
    
    test_when_params_ok_with_hash( ;
        "#{Hello}, #{world}!!!", ;
        {"world" => "pandemic world", "Hello" => "Hi"} )

    test_when_params_ok_with_space_in_param( ;
        "This function #{is super} #{cool}!!!", ;
        {"is super" => "is", "cool" => "awesome"} )            

    test_when_first_param_ok_with_string( ;
        "Hello, #{world}!!!", ;
        "wonderful world" )

    test_when_params_ok_and_extra_element_hash( ;
        "#{Hello}, #{world}!!!", ;
        {"world" => "pandemic world", "Hello" => "Hi", "Extra" => "Element"} )

    test_when_hash_element_refers_two_delimited_words( ;
        "#{Hello}, #{world}, #{Hello}!!!", ;
        {"world" => "pandemic world", "Hello" => "Hi"} )        

    test_when_params_ok_and_a_few_hash_elements( ;
        "#{Hello} #{everyone}, #{world}!!!", ;
        {"world" => "pandemic world"} )

    test_when_params_ok_and_no_matched_hash_elements( ;
        "#{Hello} #{everyone}, #{world}!!!", ;
        {"first" => "pandemic world"} )

    test_when_query_sql_is_passed ( ;
        "SELECT #{COL1}, #{COL0} FROM TCUSTOMER " + ;
        "WHERE ID = '#{ID}'", ;
        {"COL0" => "Surname", "COL1" => "Name", "ID" => "1234"} ;
    )

    test_when_two_items_in_update_sql_is_passed ( ;
        "UPDATE CLIENTE SET " +;
        "NOMECLI = '#{NOMECLI}', ENDERECO = '#{ENDERECO}', " +;
        "ESTADO = '#{ESTADO}', " +;
        "ULTICOMPRA = '#{ULTICOMPRA}', SITUACAO = '#{SITUACAO}' "+;
        "WHERE CODCLI = #{CODCLI};", ;
        { "CODCLI" => "10", "SITUACAO" => "OK"} ;
    )
RETURN .T.

STATIC FUNCTION test_when_no_params_given()
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := NIL
    
    xResult := StrSwap2()
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_one_empty_param_given( cString )
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := NIL
    
    xResult := StrSwap2( cString )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_two_empty_params_given( cString, hSwap )
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := NIL
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_one_param_given( cString )
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := NIL
    
    xResult := StrSwap2( cString )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.


STATIC FUNCTION test_when_two_params_given_without_delimiters(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := cString
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.


STATIC FUNCTION test_when_two_params_given_with_incompleted_delimiters(cString, hSwap)    
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := cString
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_first_param_is_ok_second_param_is_empty_hash(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := NIL
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_params_ok_with_hash(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := "Hi, pandemic world!!!"
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.      

STATIC FUNCTION test_when_params_ok_with_space_in_param(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := "This function is awesome!!!"
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_first_param_ok_with_string(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := NIL
    
    xResult := StrSwap2( cString )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_params_ok_and_extra_element_hash(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := "Hi, pandemic world!!!"
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_hash_element_refers_two_delimited_words(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := "Hi, pandemic world, Hi!!!"
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

    
STATIC FUNCTION test_when_params_ok_and_a_few_hash_elements(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := "#{Hello} #{everyone}, pandemic world!!!"
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_params_ok_and_no_matched_hash_elements(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := "#{Hello} #{everyone}, #{world}!!!"
    
    xResult := StrSwap2( cString, hSwap )
    ? ProcName()
    ? "Should result " 
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.
    
STATIC FUNCTION test_when_word_to_swap_repeats_and_is_array(cString, hSwap)    
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := ;
    "Hello!!! What a worderful world!!!"
    
    xResult := StrSwap2(cString, hSwap)
    ? ProcName()
    ? "Should result "
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_query_sql_is_passed(cString, hSwap)
LOCAL xResult, cPreviousColor := SetColor()
LOCAL xExpected := ;
    "SELECT Name, Surname FROM TCUSTOMER WHERE ID = '1234'"
   
    xResult := StrSwap2(cString, hSwap)
    ? ProcName()
    ? "Should result "
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.

STATIC FUNCTION test_when_two_items_in_update_sql_is_passed(cString, hSwap)
    LOCAL xResult, cPreviousColor := SetColor()
    LOCAL xExpected := ;
        "UPDATE CLIENTE SET " +;
        "NOMECLI = '#{NOMECLI}', ENDERECO = '#{ENDERECO}', " +;
        "ESTADO = '#{ESTADO}', " +;
        "ULTICOMPRA = '#{ULTICOMPRA}', SITUACAO = 'OK' "+;
        "WHERE CODCLI = 10;"
       
    xResult := StrSwap2(cString, hSwap)
    ? ProcName()
    ? "Should result "
    ?? xExpected
    IF (xResult == xExpected)
        SetColor( "G+/N" )
        ? "ok"
    ELSE
        SetColor( "R+/N" )
        ? "but results "
        ?? xResult
    ENDIF
    SetColor(cPreviousColor)
RETURN .T.
