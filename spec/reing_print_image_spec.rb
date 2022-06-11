# frozen_string_literal: true

RSpec.describe ReingPrintImage do
  it "has a version number" do
    expect(ReingPrintImage::VERSION).not_to be nil
  end

  it "saves image" do
    ReingPrintImage.new(
      text: "これは回答です",
      brand: "Reing",
      rgb_color: [0, 0, 0]
    ).save("tmp/result.png")
  end
end
