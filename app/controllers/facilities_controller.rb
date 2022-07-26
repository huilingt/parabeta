class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
    # @category = Category.find(params[:category_id])
  end

  def create
    @facility = Facility.new(facility_params)
    @category = Category.find(params[:facility][:category].to_i)
    @facility.category = @category


    if @facility.save
      redirect_to root_path, notice:"Form Submitted, Thank You."
    else
      render :new
    end
  end

  def show
    @facility = Facility.find(params[:id])
    @reviews = Review.where(facility: @facility)
    @review = Review.find_by(facility: @facility)
    @openinghours = @facility.opening_hours
    @comment = Comment.new



    @markers = @facility.latitude.nil? ? [{ lat: 28.10803865, lng: -15.444108135254993 }] : [{ lat: @facility.geocode[0], lng:@facility.geocode[1] }]

    sum = 0
    count = 0

    @reviews.each do |review|
      review.review_ratings.each do |review_rating|
        sum += review_rating.rating
        count += 1
      end
    end

    @average_rating = count != 0 ? sum.fdiv(count).round : 0
  end

  def search
    # @facility = Facility.seach(params[:name])
    @facilities = Facility.search_by_name(params[:name])
    @query = params[:name]
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :address, :phone, :photo)
  end

end
