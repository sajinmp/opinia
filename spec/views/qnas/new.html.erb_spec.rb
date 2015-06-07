require 'rails_helper'

RSpec.describe "qnas/new", type: :view do
  before(:each) do
    assign(:qna, Qna.new(
      :ques => "MyString",
      :mail => "MyString"
    ))
  end

  it "renders new qna form" do
    render

    assert_select "form[action=?][method=?]", qnas_path, "post" do

      assert_select "input#qna_ques[name=?]", "qna[ques]"

      assert_select "input#qna_mail[name=?]", "qna[mail]"
    end
  end
end
