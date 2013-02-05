require 'spec_helper'

describe "cat creation" do
  def new_cat
    file_path = Rails.root + "spec/fixtures/lion.jpg"
    visit new_cat_path

    fill_in 'name:', with: "Whimsy"
    fill_in 'breed:', with: "Calico"
    fill_in 'age:', with: "18"
    attach_file 'CAT PHOTO:', file_path
    click_button 'meow'
  end

  it "creates a new cat" do
    expect { new_cat }.to change(Cat, :count).by(1)
  end

  it "redirects to index" do
    new_cat
    current_path.should == cats_path
  end

end