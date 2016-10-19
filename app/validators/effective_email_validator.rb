# An ActiveRecord validator for any email field that you would use with effective_email or otherwise
#
# validates :phone, effective_email: true

class EffectiveEmailValidator < ActiveModel::EachValidator
  PATTERN = /\A.+@.+\..+\Z/

  def validate_each(record, attribute, value)
    if value.present?
      record.errors.add(attribute, 'is invalid') unless PATTERN =~ value
    end
  end
end
