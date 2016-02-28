class ComplexController < ApplicationController
  require_params [:a]
  require_params [:b], except: :action
  require_params [:c], only: :action
  require_params [:d], only: [:action]
  require_params [:e], except: [:action]
  require_params [:f]

  # FYI we should need a, c, d, and f
  def action
  end
end
