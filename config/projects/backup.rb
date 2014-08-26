#
# Copyright 2014 YOUR NAME
#
# All Rights Reserved.
#

name "backup"
maintainer "Jeremy Olliver"
homepage "https://github.com/jeremyolliver/omnibus-backup"

# Defaults to C:/backup on Windows
# and /opt/backup on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# backup dependencies/components
dependency "backup"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
