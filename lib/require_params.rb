module RequireParams
  extend ActiveSupport::Concern

  module ClassMethods
    def require_params(required_params, options = {})
      prepend_before_action options do
        missing_params = required_params.reject { |x| params.has_key?(x) }
        if missing_params.any?
          render json: { errors: missing_params.map { |x| {x => ["is missing"]}} }, status: :bad_request
          false
        end
      end
    end
  end
end
