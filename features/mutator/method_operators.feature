@focus
Feature: Method-level mutation operators

  Scenario: Binary arithmetic operator replacement
    Given I have the following unit at "lib/add.rb":
      """
      class Add
        def run(left, right)
          left + right
        end
      end
      """
    When I configure the mutator with the option "operator" set to "BAOR"
    And I run the mutator on "lib/add.rb"
    Then I should receive the following mutants:
      | Path       | Line | Change |
      | lib/add.rb | 3    | -      |
      | lib/add.rb | 3    | *      |
      | lib/add.rb | 3    | /      |
      | lib/add.rb | 3    | %      |


  Scenario: Relational operator replacement
    Given I have the following unit at "lib/max.rb":
      """
      class Max
        def run(left, right)
          max = left
          max = right if right > left
          max
        end
      end
      """
    When I configure the mutator with the option "operator" set to "ROR"
    And I run the mutator on "lib/max.rb"
    Then I should receive the following mutants:
      | Path       | Line | Change |
      | lib/max.rb | 4    | <      |
      | lib/max.rb | 4    | <=     |
      | lib/max.rb | 4    | ==     |
      | lib/max.rb | 4    | !=     |
      | lib/max.rb | 4    | >=     |
  
  
 Scenario: Conditional operator replacement (&&, || , ^, and, or)
    Given I have the following unit at "lib/xor.rb":
      """
      class Xor
        def run(left, right)
          left ^ right
        end
      end
      """
    When I configure the mutator with the option "operator" set to "COR"
    And I run the mutator on "lib/xor.rb"
    Then I should receive the following mutants:
      | Path       | Line | Change |
      | lib/xor.rb | 3    | &&     |
      | lib/xor.rb | 3    | \|\|   |
      | lib/xor.rb | 3    | and    |
      | lib/xor.rb | 3    | or     |