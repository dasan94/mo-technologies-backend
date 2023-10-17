*** Settings ***
Library     RequestsLibrary
Library     Collections
Variables       ../TestData/Testdata.py

*** Variables ***
${BaseURL}    https://reqres.in/api

*** Keywords ***
Given a base URL of "${url}"
    Set Global Variable    ${BaseURL}    ${url}

When a POST request is made to "${endpoint}"
    Create Session   ExampleSession   ${BaseURL}
    ${data}=    Create Dictionary    name=${expectedname}    job=${expectedjob}
    ${response}      POST On Session      ExampleSession      ${BaseURL}${endpoint}      data=${data}
    Set Global Variable    ${response}    ${response}
    Log    ${response} 

Then the response status code should be ${status}
    Should Be Equal As Strings   ${response.status_code}   ${status}

And the response should contain "${expected}"
    Log    ${response.text}
    Should Contain   ${response.text}   ${expected}