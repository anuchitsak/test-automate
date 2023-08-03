***Settings***
Resource          all_resource_ui.robot
Test Setup        New Browser for Test
Suite Teardown    Close Browser

***Test Cases***
test_automate_001 :: File Upload Success
    Go To File Upload
    Upload File            test.txt
    Click Button Upload
    Validate Upload

test_automate_002 :: File Upload Not Select File
    Go To File Upload
    Click Button Upload
    Validate Upload Error

test_automate_003 :: Multiple Windows Open New Window
    Go To Multiple Window
    New Window
    Validate New Window

test_automate_004 :: Sort Data Tables Sort Table1 Column Last Name
    Go To Sort Data Table
    Sort Data                1    table1
    Validate Data

test_automate_005 :: Sort Data Tables Sort Table1 Column First Name
    Go To Sort Data Table
    Sort Data                2    table1
    Validate Data

test_automate_006 :: Sort Data Tables Sort Table1 Column Email
    Go To Sort Data Table
    Sort Data                3    table1
    Validate Data

test_automate_007 :: Sort Data Tables Sort Table1 Column Web Site
    Go To Sort Data Table
    Sort Data                5    table1
    Validate Data

# test_automate_008 :: Sort Data Tables Sort Table1 Column Due
#    Go To Sort Data Table
#    Sort Data                4    table1
#    Validate Due

# test_automate_009 :: Sort Data Tables Sort Table2 Column Last Name
#    Go To Sort Data Table
#    Sort Data                1    table2
#    Validate Data

# test_automate_010 :: Sort Data Tables Sort Table2 Column First Name
#    Go To Sort Data Table
#    Sort Data                2    table2
#    Validate Data

# test_automate_011 :: Sort Data Tables Sort Table2 Column Email
#    Go To Sort Data Table
#    Sort Data                3    table2
#    Validate Data

# test_automate_012 :: Sort Data Tables Sort Table2 Column Due
#    Go To Sort Data Table
#    Sort Data                4    table2
#    Validate Data

# test_automate_013 :: Sort Data Tables Sort Table2 Column Web Site
#    Go To Sort Data Table
#    Sort Data                5    table2
#    Validate Data