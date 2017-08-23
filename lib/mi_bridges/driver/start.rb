# frozen_string_literal: true

module MiBridges
  class Driver
    class Start < BasePage
      def fill_in_required_fields
        click_id("#radioGroup_2")
      end
    end
  end
end
