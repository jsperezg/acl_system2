# frozen_string_literal: true

class User
  attr_writer :name

  def name
    @name ||= 'anon'
  end

  def roles
    [OpenStruct.new(title: 'admin'), OpenStruct.new(title: 'user')]
  end
end
