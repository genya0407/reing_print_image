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
    ).save("tmp/result_save.png")
  end

  it "generates binary" do
    data = ReingPrintImage.new(
      text: "これは回答です",
      brand: "Reing",
      rgb_color: [0, 0, 0]
    ).encode_as_png
    File.write("tmp/result_encode_as_png.png", data)
  end
end
