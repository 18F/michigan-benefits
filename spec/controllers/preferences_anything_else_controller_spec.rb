# frozen_string_literal: true

require "rails_helper"

RSpec.describe PreferencesAnythingElseController do
  let(:step) { assigns(:step) }
  let(:invalid_params) { { step: { anything_else: nil } } }
  let(:step_class) { PreferencesAnythingElse }

  before { session[:snap_application_id] = current_app.id }

  include_examples "step controller"

  describe "#edit" do
    it "assigns the attributes to the step" do
      get :edit

      expect(attributes.keys.map { |attr| [attr, step.send(attr)] }.to_h).to eq(
        attributes,
      )
    end
  end

  describe "#update" do
    context "When additional information is provided" do
      it "is valid" do
        put :update, params: { step: attributes }

        expect(response).to redirect_to("/steps/legal-agreement")
        expect(current_app.anything_else).to eq(
          attributes.fetch(:anything_else),
        )
      end
    end
  end

  def current_app
    @_current_app ||= create(:snap_application, attributes)
  end

  def attributes
    { anything_else: "Thank you!" }
  end
end
