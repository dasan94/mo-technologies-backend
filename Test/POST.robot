*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Resource    ../PageObject/KeywordDefinitionFiles/PostPage.robot


*** Variables ***
${BaseURL}      https://reqres.in/api


*** Test Cases ***
Create a new user
    Given a base URL of "https://reqres.in/api"
    When a POST request is made to "/users"
    Then the response status code should be 201
    And the response should contain "name":"${expectedname}"
    And the response should contain "job":"${expectedjob}"
    And the response should contain "id"
