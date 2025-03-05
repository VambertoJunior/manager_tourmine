class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Redireciona o usuário para a página de login após o logout
  private

  def after_sign_out_path_for(resource_or_scope)
    new_usuario_session_path
  end
end