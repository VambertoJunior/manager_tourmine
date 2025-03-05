class TorneiosController < ApplicationController
    before_action :authenticate_usuario!
    before_action :set_torneio, only: [:show, :edit, :update, :destroy, :inscrever, :inscricoes]
    before_action :autorizar_organizador, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @torneios = Torneio.all
    end
  
    def show
    end
  
    def new
      @torneio = Torneio.new
    end
  
    def create
      @torneio = Torneio.new(torneio_params)
      if @torneio.save
        redirect_to @torneio, notice: 'Torneio criado com sucesso!'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @torneio.update(torneio_params)
        redirect_to @torneio, notice: 'Torneio atualizado com sucesso!'
      else
        render :edit
      end
    end
  
    def destroy
        @torneio.destroy
        redirect_to torneios_path, notice: 'Torneio excluído com sucesso!'
      end
  
    def inscrever
      if current_usuario.perfil == 'Participante' && @torneio.pode_inscrever?
        @inscricao = Inscricao.new(torneio: @torneio, usuario: current_usuario, data_hora: Time.current)
        if @inscricao.save
          redirect_to @torneio, notice: 'Inscrição realizada com sucesso!'
        else
          redirect_to @torneio, alert: "Erro ao realizar inscrição: #{@inscricao.errors.full_messages.join(', ')}"
        end
      else
        redirect_to @torneio, alert: 'Não foi possível realizar a inscrição.'
      end
    end
  
    def inscricoes
      @torneio = Torneio.find(params[:id])
      @inscricoes = @torneio.inscricoes.includes(:usuario)
    end
  
    private
  
    def set_torneio
      @torneio = Torneio.find(params[:id])
    end
  
    def torneio_params
      params.require(:torneio).permit(:nome, :descricao, :data_inicio, :data_fim, :status)
    end
  
    def autorizar_organizador
        unless current_usuario.perfil == 'Organizador'
          redirect_to torneios_path, alert: 'Acesso negado. Somente organizadores podem realizar esta ação.'
        end
      end
  end