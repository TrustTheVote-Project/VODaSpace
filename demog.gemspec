Gem::Specification.new do |s|
  s.name        = 'demog'
  s.version     = '1.0.0'
  s.date        = '2015-07-15'
  s.summary     = "Demographics parser"
  s.description = "Demographics parser library"
  s.authors     = [ "Aleksey Gureiev" ]
  s.email       = 'spyromus@noizeramp.com'
  s.homepage    = 'http://rubygems.org/gems/gemog'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "nokogiri"
  s.add_dependency "timeliness"
  s.add_dependency "hashie"

  s.add_development_dependency "guard"
  s.add_development_dependency "guard-minitest"
end
