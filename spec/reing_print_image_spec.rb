# frozen_string_literal: true

RSpec.describe ReingPrintImage do
  it "has a version number" do
    expect(ReingPrintImage::VERSION).not_to be nil
  end

  it "reverses string" do
    expect(RustReverse.reverse("cba")).to eq("abc")
  end
end
