module RequireParams
  extend ActiveSupport::Concern

  included do
    prepend_before_action :require_params_error_emitter
  end

  module ClassMethods
    def require_params(required_params, options = {})
      prepend_before_action options do
        required_params.each do |x|
          missing_params << x unless params.has_key?(x)
        end
      end
    end
  end

  private

  def missing_params
    @_missing_params ||= []
  end

  def require_params_error_emitter
    if missing_params.any?
      render json: { errors: Hash[@_missing_params.map { |x| [x, ["is missing"]] }] }, status: :bad_request
      false
    end
  end
end
