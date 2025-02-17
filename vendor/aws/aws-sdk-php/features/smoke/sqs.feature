# language: en
@smoke @sqs
Feature: Amazon Simple Queue Service

  Scenario: Making a request
    When I call the "ListQueues" API
    Then the value at "QueueUrls" should be a list

  Scenario: Handling errors
    When I attempt to call the "GetQueueUrl" API with:
    | QueueName | fake_queue |
    Then I expect the response error code to be "AWS.SimpleQueueService.NonExistentQueue"
