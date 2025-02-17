# language: en
@smoke @directconnect
Feature: AWS Direct Connect

  Scenario: Making a request
    When I call the "DescribeConnections" API
    Then the value at "connections" should be a list

  Scenario: Handling errors
    When I attempt to call the "DescribeConnections" API with:
    | connectionId | fake-connection |
    Then I expect the response error code to be "DirectConnectClientException"
