# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name                   = "TicTacToe"
  spec.version                = '1.0'
  spec.required_ruby_version  = '>= 2.4'
  spec.authors                = ["Michael Hall"]
  spec.email                  = ["deweybanks@gmail.com"]
  spec.summary                = %q{A fun command line game of tic tac toe!}
  spec.description            = %q{A simple game of tic tac toe to be played by 1 or two players with a varying grid size.}
  spec.homepage               = "http://domainforproject.com/"
  spec.license                = "MIT"

  spec.files         = ['lib/*.rb']
  spec.executables   = ['bin/tictactoe']
  spec.test_files    = ['spec/*_spec.rb']
  spec.require_paths = ["lib"]
end
