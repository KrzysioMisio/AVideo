# language: en
@smoke @cognitoidentity @cognito-identity
Feature: Amazon Cognito Idenity

  Scenario: Making a request
    When I call the "ListIdentityPools" API with JSON:
    """
    {"MaxResults": 10}
    """
    Then the value at "IdentityPools" should be a list

  Scenario: Handling errors
    When I attempt to call the "DescribeIdentityPool" API with:
    | IdentityPoolId | us-east-1:aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee |
    Then I expect the response error code to be "ResourceNotFoundException"
