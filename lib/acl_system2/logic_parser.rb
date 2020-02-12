# frozen_string_literal: true

module ACLSystem2
  module LogicParser
    # This module holds our recursive descent parser that take a logic string
    # the logic string is tested by the enclosing Handler class' #check method
    # Include this module in your Handler class.

    # recursively processes an permission string and returns true or false
    def process(logicstring, context)
      logicstring.scan(/\(([^\)]+)\)/).each do |group|
        group.each do |match|
          return false unless process(match, context)
        end
      end

      # process each operator in order of precedence
      # !
      logicstring.scan(/!([^ &|]+)/).each do |group|
        group.each do |match|
          return true unless process(match, context)
        end
      end

      # &
      if logicstring =~ /&/
        return (process(logicstring[/^[^&]+/], context) && process(logicstring[/^[^&]+&(.*)$/, 1], context))
      end

      # |
      if logicstring =~ /\|/
        return (process(logicstring[/^[^\|]+/], context) || process(logicstring[/^[^\|]+\|(.*)$/, 1], context))
      end

      # constants
      return true if logicstring =~ /^\s*true\s*$/i
      return false if logicstring =~ /^\s*false\s*$/i

      # single list items
      check(logicstring.strip, context)
    end
  end
end
