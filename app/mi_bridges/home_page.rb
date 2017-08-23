class HomePage < Page
  def initialize
    Capybara.default_driver = :chrome
  end

  def visit_page
    visit "https://www.mibridges.michigan.gov/access/"
  end

  def submit
    click_on "Create An Account"
  end
end
