class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all.order(created_at: :desc)
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    if @shop.user_id == current_user.id
      respond_to do |format|
        if @shop.update(shop_params)
          format.html { redirect_to shops_path, notice: 'Shop was successfully updated.' }
          format.json { render :show, status: :ok, location: @shop }
        else
          format.html { render :edit }
          format.json { render json: @shop.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @shop, notice: "権限がありません"
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    if @shop.user_id == current_user.name
        @shop.destroy
      msg = "削除しました"
    else
      msg = "権限がありません"
    end
    respond_to do |format|
      format.html { redirect_to shops_url, notice: msg }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:category_id, :name, :address, :user_id, :content, :image)
    end
end
