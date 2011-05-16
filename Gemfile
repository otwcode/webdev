source 'http://rubygems.org'

# basic rails gems
gem 'bundler', '~>1.0.0'
gem 'rails', '3.0.1'
gem 'mysql2'
gem 'haml'


#  application specific gems

gem 'authlogic',
  :git     => 'git://github.com/odorcicd/authlogic.git',
  :branch  => 'rails3',
  :require => 'authlogic'

gem 'cancan'

# development specific
# development gems
group :development do
  # enable debugging with "rails server -u" or "rails server --debugger"
  gem 'ruby-debug19', :require => 'ruby-debug'
  # to switch generate to use haml
  gem 'haml-rails'
  # for html2haml
  gem 'hpricot'
  gem 'ruby_parser'
end

group :production do
  gem 'unicorn'
end
