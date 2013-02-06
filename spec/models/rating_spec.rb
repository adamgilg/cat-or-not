require 'spec_helper'

describe Rating do
  let(:cat) { double('Cat', :id => 1) }

  let!(:cat_rating) { Rating.create(cat_id: 1, rating: 5) }

  describe "#valid_rating" do
    it "does not allow ratings outside the valid range" do
      cat_rating.rating = 11
      cat_rating.should_not be_valid
    end

    it "returns true with a rating within the valid range" do
      cat_rating.should be_valid
    end
  end
end