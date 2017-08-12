#!/usr/bin/ruby
#
# $Id: crypt-ssha512.rb,v 0.2 2017-08-10 22:50:54 hermanstrom Exp $
#
require 'unix_crypt' # gem install unix-crypt

cf = {:enc => $stdin.gets.chomp, :i => 0, :ssha => nil}

cf[:i] += 1 until (cf[:ssha] = UnixCrypt::SHA512.build(cf[:enc])) !~ /[.\/]/
$stdout.puts ":cf = #{cf};\n"

exit 0
