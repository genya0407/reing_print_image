# frozen_string_literal: true

require_relative "lib/reing_print_image/version"

Gem::Specification.new do |spec|
  spec.name = "reing_print_image"
  spec.version = ReingPrintImage::VERSION
  spec.authors = ["Yusuke Sangenya"]
  spec.email = ["longinus.eva@gmail.com"]

  spec.summary = "Print image for Reing"
  spec.description = "Print image for Reing"
  spec.homepage = "https://github.com/genya0407/reing_print_image"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.1"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/genya0407/reing_print_image"
  spec.metadata["changelog_uri"] = "https://github.com/genya0407/reing_print_image"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/reing_print_image/extconf.rb"]

  spec.add_dependency "rb_sys", "~> 0.9.4"
  spec.add_dependency "rake-compiler", "~> 1.2.0"
end
