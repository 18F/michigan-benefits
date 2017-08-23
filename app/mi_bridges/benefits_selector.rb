# frozen_string_literal: true

class BenefitsSelector < Page
  def fill_in_required_fields
    click_id("#requestFoodShare")
    click_id("#isAuthorized_N")
  end
end
