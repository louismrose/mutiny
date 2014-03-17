require "mutiny/mutator/mutation_operators/binary_operator"

module Mutiny::Mutator::MutationOperators
  describe BinaryOperator, "mutate" do
    it "changes the operator to other operators" do
      mutants = mutate("a < b")
  
      expect(mutants.map(&:code)).to match_array([
        "a <= b",
        "a == b",
        "a != b",
        "a > b",
        "a >= b"
      ])
    end

    it "changes a nested operator" do
      unit = <<-eos
         class Simple
           def run
             a < b
           end
         end
      eos
  
      mutant =  <<-eos
class Simple
  def run
    a <= b
  end
end
eos
  
      first_mutant = mutate(unit).first
  
      expect(first_mutant.code).to eq(mutant.strip)
    end
  
    def mutate(unit)
      BinaryOperator.new.mutate(Parser::CurrentRuby.parse(unit), "foo.rb")
    end
  end
end