*** Settings ***
Library           SeleniumLibrary

*** variables ***
${BROWSER}     chrome

${EMAIL}    yugo501pamungkas@gmail.com
${PASS-1}    admin1234    # correct password
${PASS-2}    yugo1234    # wrong password


*** Test Cases ***

# login
# positive test
testcase-1
    Open Browser    http://localhost/ens/     chrome
    Click Element     xpath://button[@id='open__nav-btn']
    Click Element     xpath://a[contains(text(),'SIGN IN')]
    Page Should Contain Element   xpath://input[@name='username_email']
    input text        name:username_email       ${EMAIL}
    input text        name:password    ${PASS-1}
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element   xpath://a[contains(text(),'DASHBOARD')]
    Close Browser    

# negative test
testcase-2
    Open Browser    http://localhost/ens/   chrome
    Click Element     xpath://button[@id='open__nav-btn']
    Click Element     xpath://a[contains(text(),'SIGN IN')]
    Page Should Contain Element   xpath://input[@name='username_email']
    input text        name:username_email       ${EMAIL}
    input text        name:password    ${PASS-2}
    Click Element     xpath://button[@type='submit']
    Close Browser 

# logout
testcase-3
    Open Browser    http://localhost/ens/    chrome
    Click Element     xpath://button[@id='open__nav-btn']
    Click Element     xpath://a[contains(text(),'SIGN IN')]
    Page Should Contain Element   xpath://input[@name='username_email']
    input text        name:username_email       ${EMAIL}
    input text        name:password    ${PASS-1}
    Click Element     xpath://button[@type='submit']
    Click Element     xpath://button[@id='open__nav-btn']
    Click Element     xpath://body/nav[1]/div[1]/ul[1]/li[7]
    Click Element     xpath://a[contains(text(),'LOG OUT')]
    Close Browser 
