class MainController < ApplicationController
  require_params [:a, :b, :c], only: [:action_a, :action_b]

  def action_a
  end

  def action_b
  end

  before_action :i_will_return_404_if_called, only: :action_c
  require_params [:d], only: :action_c
  def action_c
  end

  private
  def i_will_return_404_if_called
    render :empty, status: :not_found
  end
end
