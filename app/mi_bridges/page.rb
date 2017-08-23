require "capybara/rails"
require "web_driver/chrome_browser"
require "web_driver/chrome_headless"
require "selenium/web_driver/remote"

class Page
  include Capybara::DSL

  def initialize(snap_application = nil)
    @snap_application = snap_application
    Capybara.default_driver = ENV.fetch("WEB_DRIVER", "chrome").to_sym
  end

  def close
    page.driver.browser.close
  end

  def click_id(id)
    id = "##{id}" unless id.include?("#")
    page.execute_script("$('#{id}').click()")
  end

  def next
    click_on "Next"
  end

  private

  attr_reader :snap_application
end
