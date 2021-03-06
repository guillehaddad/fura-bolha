class BolhasController < ApplicationController
  before_action :set_bolha, only: [:show, :edit, :update, :destroy]
  before_action :user_login, only: [:new, :create, :edit, :destroy]


  # GET /bolhas
  # GET /bolhas.json
  def index
    @bolhas = Bolha.all
  end

  # GET /bolhas/1
  # GET /bolhas/1.json
  def show
    @comments = @bolha.comments
  end

  # GET /bolhas/new
  def new
    @bolha = Bolha.new
  end

  # GET /bolhas/1/edit
  def edit
  end

  # POST /bolhas
  # POST /bolhas.json
  def create
    @bolha = Bolha.new(bolha_params)
    @bolha.user_id = current_user.id

    respond_to do |format|
      if @bolha.save
        format.html { redirect_to @bolha, notice: 'Bolha was successfully created.' }
        format.json { render :show, status: :created, location: @bolha }
      else
        format.html { render :new }
        format.json { render json: @bolha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bolhas/1
  # PATCH/PUT /bolhas/1.json
  def update
    respond_to do |format|
      if @bolha.update(bolha_params)
        format.html { redirect_to @bolha, notice: 'Bolha was successfully updated.' }
        format.json { render :show, status: :ok, location: @bolha }
      else
        format.html { render :edit }
        format.json { render json: @bolha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bolhas/1
  # DELETE /bolhas/1.json
  def destroy
    @bolha.destroy
    respond_to do |format|
      format.html { redirect_to bolhas_url, notice: 'Bolha was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def user_login
      unless current_user.present?
        flash[:notice] = 'Você precisa efetuar o login para poder de publicar.'
        redirect_to root_path
      end
      puts action_name
      if action_name == 'edit' or action_name == 'destroy'
        flash[:notice] = 'Você não é o responsável por esta publicação.'
        redirect_to root_path if @bolha.user_id != current_user.id
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bolha
      @bolha = Bolha.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bolha_params
      params.require(:bolha).permit(:title, :l_name, :r_name, :content, :l_image, :r_image)
    end

    private


end
