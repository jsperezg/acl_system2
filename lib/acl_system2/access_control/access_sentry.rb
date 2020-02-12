# frozen_string_literal: true

module ACLSystem2
  module AccessControl
    class AccessSentry
      def initialize(subject, actions = {})
        @actions = actions.inject({}) do |auth, current|
          [current.first].flatten.each { |action| auth[action] = current.last }
          auth
        end
        @subject = subject
      end

      def allowed?(action)
        if @actions.key? action.to_sym
          @subject.access_handler.process(@actions[action.to_sym].dup, @subject.access_context)
        elsif @actions.key? :DEFAULT
          @subject.access_handler.process(@actions[:DEFAULT].dup, @subject.access_context)
        else
          true
        end
      end
    end
  end
end
