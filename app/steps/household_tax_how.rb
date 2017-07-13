# frozen_string_literal: true

class HouseholdTaxHow < ManyMemberSimpleStep
  step_attributes :household_members, :filing_status
=begin
  self.title = 'Your Household'
  self.subhead = 'Describe how your household files taxes.'
  self.subhead_help = "If you aren't sure how your household files taxes right now, it is okay to skip these questions. We'll help you answer later."

  self.member_questions = {
    filing_status: ['filing status', :hidden]
  }

  self.types = {
    filing_status: :radios
  }

  self.field_options = {
    filing_status: HouseholdMember::FILING_STATUSES.map(&:to_s)
  }

  def skip?
    !@app.household_tax
  end
=end
end
