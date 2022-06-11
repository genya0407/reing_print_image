# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rake/extensiontask"
require "standard/rake"

RSpec::Core::RakeTask.new(:spec)

Rake::ExtensionTask.new("reing_print_image") do |ext|
  ext.lib_dir = "lib/reing_print_image"
  ext.source_pattern = "*.{rs,toml}"
  ext.cross_compile = true
  ext.cross_platform = %w[x86-mingw32 x64-mingw-ucrt x64-mingw32 x86-linux x86_64-linux x86_64-darwin arm64-darwin aarch64-linux]
end

task default: %i[standard compile spec]
