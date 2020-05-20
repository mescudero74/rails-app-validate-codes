class CodesController < ApplicationController
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.all
  end

  # GET /codes/1
  # GET /codes/1.json
  def show
  end

  # GET /codes/new
  def new
    @code = Code.new
  end

  # GET /codes/1/edit
  def edit
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = Code.new(code_params)
    complete_code_attr(@code)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
      else
        format.html { render :new }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codes/1
  # PATCH/PUT /codes/1.json
  def update
    respond_to do |format|
      if @code.update({status: params[:status]})
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { render :show, status: :ok, location: @code }
      else
        format.html { render :edit }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.json
  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to codes_url, notice: 'Code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def validate; end

  def validate_code
    if Code.find_by(code: params[:code]) != nil
      if Code.find_by(code: params[:code]).status == "creado"
        respond_to do |format|
          format.html { redirect_to validate_url, notice: 'El codigo es valido.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to validate_url, alert: 'El codigo es invalido.' }
          format.json { head :no_content }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to validate_url, alert: 'El codigo no existe.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_code
    @code = Code.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def code_params
    params.require(:code).permit(:amount, :email)
  end

  def complete_code_attr(code)
    @code.status = 'creado'
    @code.code = SecureRandom.hex(7)
    @code.username = current_user.username
  end
end
