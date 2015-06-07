require 'rails_helper'

RSpec.describe "vote_options/new", type: :view do
  before(:each) do
    assign(:vote_option, VoteOption.new(
      :title => "MyString",
      :poll => nil
    ))
  end

  it "renders new vote_option form" do
    render

    assert_select "form[action=?][method=?]", vote_options_path, "post" do

      assert_select "input#vote_option_title[name=?]", "vote_option[title]"

      assert_select "input#vote_option_poll_id[name=?]", "vote_option[poll_id]"
    end
  end
end
