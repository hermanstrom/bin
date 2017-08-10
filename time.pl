#!/usr/bin/perl -w
#
use strict;
use warnings;
use POSIX 'strftime'; sub timestamp { my ($format, $epoch) = @_; return strftime $format, localtime (defined $epoch ? $epoch : time); }

print timestamp ("%Y-%m-%d %H:%M:%S\n"), timestamp ("%Y-%m-%d %H:%M:%S\n", 1457810480);

exit 0;