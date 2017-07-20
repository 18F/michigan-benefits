# frozen_string_literal: true

class Step
  include ActiveModel::Model
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations::Callbacks

  class_attribute :attribute_names

  def self.step_attributes(*attribute_names)
    self.attribute_names = attribute_names.map(&:to_s)
    attr_accessor(*attribute_names)
  end
end
