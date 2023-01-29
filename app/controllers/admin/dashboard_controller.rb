class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count
    @cat_count = Category.count
  end
end
