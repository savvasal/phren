Feature: Learn xor

  
  Background:
    Given a neural network with architecture
    | 2 | 1 | 1 |
    And the input layer is connected to the output layer
    And the training set of xor:
    | 0 | 0 | 0 |
    | 0 | 1 | 1 |
    | 1 | 0 | 1 |
    | 1 | 1 | 0 |
    And the phren pass a training of 14000 iterations and molding rate "0.1"


Scenario Outline: Test xor 
  When i give to phren <a> 
  And i give to phren <b> 
  When i ask the phren for the correct answer
  Then the phren should answer <c>
  
  Examples:
  | a | b | c |
  | 0 | 0 | 0 |
  | 0 | 1 | 1 |
  | 1 | 0 | 1 |
  | 1 | 1 | 0 |
