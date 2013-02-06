require 'spec_helper'

describe Rating do
  let(:cat) { double('Cat', :id => 1) }

  let!(:cat_rating) { Rating.create(cat_id: 1, rating: 5) }

  describe "#valid_rating" do
    it "does not allow ratings outside the valid range" do
      cat_rating.rating = 11
      cat_rating.valid?.should be_false
    end

    it "returns true with a rating between 1 and 10" do
      cat_rating.valid?.should be_true
    end
  end

  context "with multiple ratings" do
    before(:each) do
      Rating.create(cat_id: 1, rating: 3)
      Rating.create(cat_id: 1, rating: 4)
    end

    describe "#average_rating" do

      it "should return the average rating for a cat" do
        Rating.average_rating(cat).should == 4
      end

      it "should return the total number of ratings for a cat" do
        Rating.total_ratings(cat).should == 3
      end

    end
  end
end