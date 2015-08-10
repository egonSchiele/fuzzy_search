require File.expand_path(File.join(__FILE__, "../lib/fuzzy_search/version"))

Gem::Specification.new do |s|
  s.name        = "fuzzy_search"
  s.version     = FuzzySearch::VERSION
  s.summary     = "Local fuzzy search."
  s.description = "It's like elasticsearch for your local files."
  s.author      = "Aditya Bhargava"
  s.email       = "bluemangroupie@gmail.com"
  s.files       = `git ls-files`.split("\n")
  s.homepage    = "http://github.com/egonSchiele/fuzzy_search"
end
