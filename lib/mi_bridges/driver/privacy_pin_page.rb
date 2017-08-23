# frozen_string_literal: true

module MiBridges
  class Driver
    class PrivacyPinPage < BasePage
      def fill_in_required_fields
        click_id("#radioGroup_No")
      end
    end
  end
end
