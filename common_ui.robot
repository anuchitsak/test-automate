***Keywords***
New Browser for Test
    # New Browser            timeout=30s
    New Browser            
    New Page               ${Test_URL}
    Set Browser Timeout    ${Timeout}
    Log to Console         >> Test on ${Test_URL} <<

Get Column
    [Arguments]           ${Col}               ${table name}
    ${row}=               Get Element Count    //*[@id="${table name}"]/tbody/tr
    ${data list}=         Create List
    # FOR ${index} IN ${row}
    FOR                   ${index}             IN RANGE                                              ${row}
    ${text}=              Get text             //*[@id="table1"]/tbody/tr[${index}+1]/td[${Col} ]
    ${new data}=          Set Variable         ${text}
    Append To List        ${data list}         ${new data}
    END
    Set Suite Variable    ${row}
    [Return]              ${data list}

Sort Data
    [Arguments]       ${col}                                               ${table name}
    ${begin}=         Get Column                                           ${col}           ${table name}
    log               ${begin}
    ${begin}          Set Suite Variable                                   ${begin}
    Click             //*[@id="${table name}"]/thead/tr/th[${col}]/span
    ${table asc}=     Get Column                                           ${col}           ${table name}
    ${table asc}      Set Suite Variable                                   ${table asc}
    Click             //*[@id="${table name}"]/thead/tr/th[${col}]/span
    ${table desc}=    Get Column                                           ${col}           ${table name}
    ${table desc}     Set Suite Variable                                   ${table desc}    

Validate Data
    Sort List                ${begin}
    ${list asc}              Copy list       ${begin}
    Reverse List             ${begin}
    ${list desc}             Copy list       ${begin}
    Lists Should Be Equal    ${list asc}     ${table asc}
    Lists Should Be Equal    ${list desc}    ${table desc}

Validate Due
    ${begin}=       List Remove $
    Sort List       ${begin}
    ${list desc}    Copy list        ${begin}
    log             ${list desc}
    Reverse List    ${begin}
    ${list asc}     Copy list        ${begin}
    log             ${list asc}

    ${table asc}=            List Remove $
    ${table desc}=           List Remove $
    Lists Should Be Equal    ${list asc}      ${table asc}
    Lists Should Be Equal    ${list desc}     ${table desc}

List Remove $
    ${list begin}=    Create List
    FOR               ${index}                          IN RANGE              ${row}
    ${data}           Convert To String And Remove $    ${begin[${index}]}
    Append To List    ${list begin}                     ${data}
    END
    [Return]          ${list begin}

Convert To String And Remove $
    [Arguments]    ${value}             
    ${data}=       Convert To String    ${value}
    ${data}=       Remove String        ${data}     $    '    "    ,    [    ]    .00
    [Return]       ${data}

Go To Sort Data Table
    Click                      //a[text()="Sortable Data Tables"]
    Wait For Elements State    //h3[text()="Data Tables"]            visible

Go To Multiple Window
    Click                      //a[text()="Multiple Windows"]
    Wait For Elements State    //div[@id="content"]              visible

New Window
    Click          //a[@href="/windows/new"]
    Switch Page    NEW

Validate New Window
    Wait For Elements State    //h3[text()="New Window"]    visible

Go To File Upload
    Click                      //a[text()="File Upload"]
    Wait For Elements State    //form[@enctype="multipart/form-data"]    visible

Click Button Upload
    Click    //input[@id="file-submit"]

Validate Upload Error
    Wait For Elements State    //h1[text()="Internal Server Error"]    visible

Upload File
    [Arguments]                ${file}
    Upload File By Selector    //input[@id="file-upload"]    ${file}

Validate Upload
    Wait For Elements State    //*[@id="uploaded-files"]    visible