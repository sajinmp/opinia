require 'rails_helper'

RSpec.describe "qnas/edit", type: :view do
  before(:each) do
    @qna = assign(:qna, Qna.create!(
      :ques => "MyString",
      :mail => "MyString"
    ))
  end

  it "renders the edit qna form" do
    render

    assert_select "form[action=?][method=?]", qna_path(@qna), "post" do

      assert_select "input#qna_ques[name=?]", "qna[ques]"

      assert_select "input#qna_mail[name=?]", "qna[mail]"
    end
  end
end
