#!/usr/bin/ruby
#
# $Id: crypt-ssha512.rb,v 0.1 2017-08-08 21:20:35 hermanstrom Exp $
#
require 'unix_crypt' # gem install unix-crypt

$stdout.puts UnixCrypt::SHA512.build($stdin.gets.chomp)

exit 0