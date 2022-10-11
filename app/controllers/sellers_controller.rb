class SellersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index
        sellers = Seller.all
        render json: sellers
    end

    def show
        seller = find_seller
        render json: seller
    end

    def update
        seller = find_seller
        seller.update(seller_params)
        render json: seller
    end

    def destroy
        seller = find_seller
        seller.destroy
        render json: seller
    end

    private
    def find_seller
        Seller.find(params[:id])
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def record_not_found
        render json: { error: "Seller not found" }, status: :not_found
    end
end
