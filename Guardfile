guard "rspec", :version => 2, :cli => "--format Fuubar --color spec" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch("spec/spec_helper.rb") { "spec" }
  watch(%r{^spec/support/.+\.rb$}) { "spec" }
end
