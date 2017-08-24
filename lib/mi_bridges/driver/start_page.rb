# frozen_string_literal: true

module MiBridges
  class Driver
    class StartPage < BasePage
      def fill_in_required_fields
        click_id("#radioGroup_2")
      end
    end
  end
end
