class UsuariosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :autorizar_organizador, only: [:new, :create, :edit, :update, :destroy]

  def index
    @usuarios = Usuario.all
    puts "Usuários carregados no controlador: #{@usuarios.inspect}" # Log para depuração
  end

  def show
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      puts "Usuário criado com sucesso: #{@usuario.inspect}" 
      redirect_to usuarios_path, notice: 'Usuário criado com sucesso!'
    else
      puts "Erro ao criar usuário: #{@usuario.errors.full_messages}" 
      render :new
    end
  end

  def edit
  end

  def update
    if @usuario.update(usuario_params)
      redirect_to @usuario, notice: 'Usuário atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @usuario.destroy
    redirect_to usuarios_path, notice: 'Usuário excluído com sucesso!'
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :perfil, :password, :password_confirmation)
  end

  def autorizar_organizador
    unless current_usuario.perfil == 'Organizador'
      redirect_to torneios_path, alert: 'Acesso negado. Somente organizadores podem realizar esta ação.'
    end
  end
end