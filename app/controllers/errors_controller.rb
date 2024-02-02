class ErrorsController < ActionController::API
  def not_found
    render json: { error: 'Not Found' }, status: 404
  end

  def internal_server_error
    render json: { error: 'Internal Server Error' }, status: 500
  end
end
