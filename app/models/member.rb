class Member < ApplicationRecord
  AVERAGE_WEEKS_PER_MONTH = 4.33
  MONTHS_PER_YEAR = 12
  belongs_to :snap_application

  attribute :ssn
  attr_encrypted(
    :ssn,
    key: Rails.application.secrets.secret_key_for_ssn_encryption,
  )

  def full_name
    "#{first_name} #{last_name}"
  end

  def primary_member?
    snap_application.primary_member.id == id
  end

  def monthly_income
    if self_employed?
      self_employed_monthly_income
    elsif employed?
      employed_monthly_income
    else
      0
    end
  end

  def employed?
    employment_status == "employed"
  end

  def self_employed?
    employment_status == "self_employed"
  end

  def not_employed?
    employment_status == "not_employed"
  end

  private

  def employed_monthly_income
    return if employed_pay_quantity.nil?
    if employed_pay_interval == "Hour"
      employed_hours_per_week * employed_pay_quantity * AVERAGE_WEEKS_PER_MONTH
    elsif employed_pay_interval == "Day"
      employed_pay_quantity * (WEEKS_PER_MONTH * 5)
    elsif employed_pay_interval == "Week"
      employed_pay_quantity * AVERAGE_WEEKS_PER_MONTH
    elsif employed_pay_interval == "Month"
      employed_pay_quantity
    else # "Year"
      employed_pay_quantity / MONTHS_PER_YEAR
    end
  end
end
