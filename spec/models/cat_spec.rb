require 'spec_helper'

describe Cat do
  subject (:invalid_cat) do
    Cat.new(
        :picture => nil
      )
  end

  it "is not valid without a picture" do
    invalid_cat.valid?.should be_false
  end

  context "with multiple ratings" do

    subject (:cat) do
      picture = fixture_file_upload('/lion.jpg', 'image/jpg').read
      Cat.create(name: "name", breed: "breed", age: 2, picture: picture)
    end

    before do
      (5..7).each do |num|
        FactoryGirl.create(:rating, {:cat_id => cat.id, :rating => num})
      end
    end

    describe "#ratings" do
      it "calculates a cat's average rating" do
        cat.average_rating.should == 6
      end

      it "counts the cat's ratings" do
        cat.total_ratings.should == 3
      end
    end

  end
end
