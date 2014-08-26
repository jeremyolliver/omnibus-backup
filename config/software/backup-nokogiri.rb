name "backup-nokogiri"
default_version "1.6.1" # This version needs to match the version in the backup gem version dependencies

if windows?
  dependency "ruby-windows"
  dependency "ruby-windows-devkit"
else
  dependency "ruby"
  dependency "rubygems"
  dependency "libxml2"
  dependency "libxslt"
  dependency "libiconv"
  dependency "liblzma"
  dependency "zlib"
end

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Tell nokogiri to use the system libraries instead of compiling its own
  env["NOKOGIRI_USE_SYSTEM_LIBRARIES"] = "true"

  gem "install nokogiri" \
       " --version '#{version}'" \
       " --" \
       " --use-system-libraries" \
       " --with-xml2-lib=#{install_dir}/embedded/lib" \
       " --with-xml2-include=#{install_dir}/embedded/include/libxml2" \
       " --with-xslt-lib=#{install_dir}/embedded/lib" \
       " --with-xslt-include=#{install_dir}/embedded/include/libxslt" \
       " --with-iconv-dir=#{install_dir}/embedded" \
       " --with-zlib-dir=#{install_dir}/embedded", env: env
end
