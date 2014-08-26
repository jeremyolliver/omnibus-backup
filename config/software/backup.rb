name "backup"
default_version "4.0.3"

dependency 'ruby'
dependency 'rubygems'

build do
  gem "install backup -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
end
