Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_google_base'
  s.version     = '2.0.5'
  s.summary     = 'Google Base for Spree'
  s.description = 'Provide rake task to generate XML for Google Base and so on.'
  s.required_ruby_version = '>= 1.9.3'

  s.authors     = ['Steph Skardal', 'Ryan Siddle', 'Roman Smirnov', 'Denis Ivanov','Cy Tidd']
  s.homepage          = 'http://github.com/myVBO/spree-google-merchant'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

end
