# frozen_string_literal: true

module MiBridges
  class Driver
    class BenefitsSelector < BasePage
      def fill_in_required_fields
        click_id("#requestFoodShare")
        click_id("#isAuthorized_N")
      end
    end
  end
end
