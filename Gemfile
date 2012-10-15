if RUBY_VERSION.match(/^1.8/)
  raise Gem::VerificationError, "mysql-to-postgresql requires ruby flavor of version 1.9.x"
end

source :rubygems

gem 'mysql-pr'
gem 'postgres-pr'

platforms :jruby do
  gem 'activerecord'
  gem 'jdbc-postgres'
  gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
end

platforms :mri_19 do
  gem 'pg'
end

