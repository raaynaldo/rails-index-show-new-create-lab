class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
    render "index"
  end

  def show
    @coupon = Coupon.find(params[:id])
    render "show"
  end

  def new
    render "new"
  end

  def create
    coupon = params["coupon"]
    @coupon = Coupon.find_or_create_by(coupon_code: coupon[:coupon_code], store: coupon[:store])
    redirect_to coupon_path(@coupon.id)
  end
end
