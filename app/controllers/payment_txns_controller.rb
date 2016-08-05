class PaymentTxnsController < ApplicationController
  before_action :set_payment_txn, only: [:show, :edit, :update, :destroy]

  # GET /payment_txns
  # GET /payment_txns.json
  def index
    @user = User.find_by_id(params[:user_id])
    unless @user.present?
      flash[:danger] = "No User Found."
      redirect_to root_path
    else
      @payment_txns = @user.payment_txns.where('status in (?)', params[:status]).paginate(:page => params[:page], :per_page => 10)
      @status = params[:status]
    end
  end

  # GET /payment_txns/1
  # GET /payment_txns/1.json
  def show
  end

  # GET /payment_txns/new
  def new
    @user = User.find_by_id(params[:user_id])
    @payment_txn = PaymentTxn.new
    unless @user.present?
      flash[:danger] = "No User Found."
      redirect_to root_path
    end
  end

  # GET /payment_txns/1/edit
  def edit
  end

  # POST /payment_txns
  # POST /payment_txns.json
  def create
    @payment_txn = PaymentTxn.new(payment_txn_params)

    respond_to do |format|
      if @payment_txn.save
        format.html { redirect_to edit_payment_txn_path(@payment_txn), notice: 'Payment txn was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment_txn }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment_txn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_txns/1
  # PATCH/PUT /payment_txns/1.json
  def update
    respond_to do |format|
      if @payment_txn.update(payment_txn_params)
        format.html { redirect_to @payment_txn, notice: 'Payment txn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_txn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_txns/1
  # DELETE /payment_txns/1.json
  def destroy
    @payment_txn.destroy
    respond_to do |format|
      format.html { redirect_to payment_txns_url }
      format.json { head :no_content }
    end
  end

  def update_installment_record
    @save_flag = false
    installment = Installment.find_by_id(params[:id])
    if installment.present? and params[:status].present?
      @payment_txn = installment.payment_txn
      installment.status = params[:status]
      installment.save
      @save_flag = true
    end
    respond_to do |format|
      format.js 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_txn
      @payment_txn = PaymentTxn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_txn_params
      params.require(:payment_txn).permit(:total_amount, :discount, :user_id, installments_attributes: [:scheduled_date,:status, :content, :installment_amount, :_destroy])
    end
end
