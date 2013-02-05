require 'spec_helper'

describe Cat do
  subject (:cat) do
    Cat.new(
        :picture => nil
      )
  end

  it "is not valid without a picture" do
    cat.valid?.should be_false
  end
end
