require 'rails_helper'

RSpec.describe "vote_options/edit", type: :view do
  before(:each) do
    @vote_option = assign(:vote_option, VoteOption.create!(
      :title => "MyString",
      :poll => nil
    ))
  end

  it "renders the edit vote_option form" do
    render

    assert_select "form[action=?][method=?]", vote_option_path(@vote_option), "post" do

      assert_select "input#vote_option_title[name=?]", "vote_option[title]"

      assert_select "input#vote_option_poll_id[name=?]", "vote_option[poll_id]"
    end
  end
end
