require "mkmf"
require "rb_sys/mkmf"

create_rust_makefile("reing_print_image/reing_print_image") do |r|
  r.profile = ENV.fetch("PROFILE", :dev).to_sym
end
