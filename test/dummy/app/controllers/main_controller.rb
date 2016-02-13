class MainController < ApplicationController
  require_params [:a, :b, :c]
  
  def action_a
  end

  def action_b
  end
end
