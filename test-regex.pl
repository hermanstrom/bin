#!/usr/bin/perl -w
#
use warnings;
#use strict;

my $password = 'clR$!3';
my ($passbase, $variable) = ($password =~ /^(.*)([0-9])$/g);
print "$password: $passbase, $variable\n";
exit 0;
