#!/usr/bin/perl -Tw
#
use strict;
use warnings;
use POSIX::strptime qw( strptime );
#use Time::Piece ();

my $syr = '17';
my $smn = '08';
my $sdy = '07';
my $shr = '16';

my $arcd; my $yr1; my $mn1; my $dy1; my $hr1; my $yr2; my $mn2; my $dy2; my $hr2;

open(ARCFILE, "arcdates.txt")||die "Can't open: $!";
my $cnt=0;
while(<ARCFILE>){
   $arcd = $_;
   $cnt++;
   if($cnt==1){
     $yr1=substr($arcd,0,2)+2000;
     $mn1=substr($arcd,3,2);
     $dy1=substr($arcd,6,2);
     $hr1=substr($arcd,9,2);
   }
}
$yr2=substr($arcd,0,2)+2000;
$mn2=substr($arcd,3,2);
$dy2=substr($arcd,6,2);
$hr2=substr($arcd,9,2);
close(ARCFILE);

# find out if chosen date is between beginning and ending date of data
#my $date1   = Time::Piece->strptime("$yr1/$mn1/$dy1/$hr1", "%Y/%m/%d/%H");
#my $date2   = Time::Piece->strptime("$yr2/$mn2/$dy2/$hr2", "%Y/%m/%d/%H");
#my $dateusr = Time::Piece->strptime("$syr/$smn/$sdy/$shr", "%Y/%m/%d/%H");

my @date1   = POSIX::strptime("$yr1/$mn1/$dy1/$hr1", "%Y/%m/%d/%H");
my @date2   = POSIX::strptime("$yr2/$mn2/$dy2/$hr2", "%Y/%m/%d/%H");
my @dateusr = POSIX::strptime("$syr/$smn/$sdy/$shr", "%Y/%m/%d/%H");

print "\$date1 = ", @date1, ";\n\$date2 = ", @date2, ";\n\$dateusr = ", @dateusr, ";\n";

exit 0;
