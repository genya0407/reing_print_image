# frozen_string_literal: true

require_relative "reing_print_image/version"
require_relative "reing_print_image/reing_print_image"

class ReingPrintImage
  def self.new(text:, brand:, rgb_color:)
    internal_new(text, brand, rgb_color)
  end
end
