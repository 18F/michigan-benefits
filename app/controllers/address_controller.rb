# frozen_string_literal: true

class AddressController < StepsController
  def edit
    @step = step_class.new(
      current_snap_application.attributes.slice(*step_attrs),
    )
  end

  def update
    @step = step_class.new(step_params_with_zipcode)

    if @step.valid?
      current_snap_application.update!(step_params)
      redirect_to(next_path)
    else
      render :edit
    end
  end

  private

  def step_params_with_zipcode
    step_params.merge("county" => "Genesee")
  end
end
