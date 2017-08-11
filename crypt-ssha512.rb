#!/usr/bin/ruby
#
# $Id: crypt-ssha512.rb,v 0.2 2017-08-10 22:50:54 hermanstrom Exp $
#
require 'unix_crypt' # gem install unix-crypt

cf = {:secret => $stdin.gets.chomp, :counter => 0, :password => nil}

cf[:counter] += 1 until (cf[:password] = UnixCrypt::SHA512.build(cf[:secret])) !~ /[.\/]/
$stdout.puts "#{cf};\n"

exit 0
