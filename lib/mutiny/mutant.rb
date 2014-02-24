require "key_struct"
require "parser/current"
require_relative "ast/match"

module Mutiny
  class Mutant < KeyStruct.reader(:code, :path, :line, :change, :operator, alive: true)
    attr_accessor :id
    attr_accessor :results

    alias_method :executable, :code
    alias_method :readable, :code
    
    alias_method :alive?, :alive
    
    def killed?
      !alive?
    end
    
    def kill
      @alive = false
    end
    
    def class_name
      Mutiny::Ast::Match.new(ast, [0, 1]).matched.to_s
    end
    
    def inspect
      "{Mutant id=#{id.inspect}, path=#{path.inspect}, line=#{line.inspect}, change=#{change.inspect}, operator=#{operator.inspect}}"
    end
  
  private
    def ast
      @ast ||= Parser::CurrentRuby.parse(code)
    end
  end
end