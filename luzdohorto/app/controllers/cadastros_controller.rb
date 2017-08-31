class CadastrosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cadastro, only: [:show, :edit, :update, :destroy]
   
  # GET /cadastros
  # GET /cadastros.json
  def index

    @search_query = params[:q]
    
    @cadastros = Cadastro.order('created_at DESC').search(@search_query, current_user).page params[:page]
    # if params[:search]
    #   @cadastros = Cadastro.where("id_cliente_coelce like ?", "%#{params[:search]}")
    #   elsif :user_role == "admin"      
    #    @cadastros = Cadastro.joins(:user).order("created_at DESC").page params['page']
    #   else   
    #    @cadastros = Cadastro.where(:user_id => current_user.id).order("created_at DESC").page params['page']        
    # end
  end

  # GET /cadastros/1
  # GET /cadastros/1.json
  def show
  end

  # GET /cadastros/new
  def new
    @cadastro = current_user.cadastros.build
  end
  

  # GET /cadastros/1/edit
  def edit
  end

  # POST /cadastros
  # POST /cadastros.json
  def create
    @cadastro = current_user.cadastros.build(cadastro_params)
    
    respond_to do |format|
      if @cadastro.save
        Cadastro.assocCadColab(@cadastro.id, params[:colaborador][:colaborador_id])
        format.html { redirect_to @cadastro, notice: 'Cadastro criado com sucesso.' }
        format.json { render :show, status: :created, location: @cadastro }
           
      else
        format.html { render :new }
        format.json { render json: @cadastro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cadastros/1
  # PATCH/PUT /cadastros/1.json
  def update
    respond_to do |format|
      if @cadastro.update(cadastro_params)
        format.html { redirect_to @cadastro, notice: 'Cadastro atualizado com sucesso..' }
        format.json { render :show, status: :ok, location: @cadastro }
      else
        format.html { render :edit }
        format.json { render json: @cadastro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadastros/1
  # DELETE /cadastros/1.json
  def destroy
    @cadastro.destroy
    respond_to do |format|
      format.html { redirect_to cadastros_url, notice: 'Cadastro excluído com sucesso..' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cadastro
      @cadastro = Cadastro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cadastro_params
      params.require(:cadastro).permit(:id_cliente_coelce, :digito_verificador_cliente_coelce, :codigo_ocorrencia, :data_ocorrencia, :valor, :parcelas, :id_cliente_parceira, :codigo_produto, :codigo_empresa_parceira, :livre)
    end
end
