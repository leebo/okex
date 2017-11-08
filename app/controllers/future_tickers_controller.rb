class FutureTickersController < ApplicationController
  before_action :set_future_ticker, only: [:show, :edit, :update, :destroy]

  # GET /future_tickers
  # GET /future_tickers.json
  def index
    @future_tickers = FutureTicker.all
  end

  # GET /future_tickers/1
  # GET /future_tickers/1.json
  def show
  end

  # GET /future_tickers/new
  def new
    @future_ticker = FutureTicker.new
  end

  # GET /future_tickers/1/edit
  def edit
  end

  # POST /future_tickers
  # POST /future_tickers.json
  def create
    @future_ticker = FutureTicker.new(future_ticker_params)

    respond_to do |format|
      if @future_ticker.save
        format.html { redirect_to @future_ticker, notice: 'Future ticker was successfully created.' }
        format.json { render :show, status: :created, location: @future_ticker }
      else
        format.html { render :new }
        format.json { render json: @future_ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /future_tickers/1
  # PATCH/PUT /future_tickers/1.json
  def update
    respond_to do |format|
      if @future_ticker.update(future_ticker_params)
        format.html { redirect_to @future_ticker, notice: 'Future ticker was successfully updated.' }
        format.json { render :show, status: :ok, location: @future_ticker }
      else
        format.html { render :edit }
        format.json { render json: @future_ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /future_tickers/1
  # DELETE /future_tickers/1.json
  def destroy
    @future_ticker.destroy
    respond_to do |format|
      format.html { redirect_to future_tickers_url, notice: 'Future ticker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_future_ticker
      @future_ticker = FutureTicker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def future_ticker_params
      params.require(:future_ticker).permit(:date, :ticker, :symbol, :contract_type)
    end
end
