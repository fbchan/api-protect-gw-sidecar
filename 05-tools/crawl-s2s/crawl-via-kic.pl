#!/usr/bin/perl
use warnings;
#use strict;

my $result_pods = "";
my $counter = 5;

open(KICURL,"<","kic-url");

my @result_kicurl = <KICURL>;
for (my $i=0; $i <= 5; $i++) {

foreach $result_kicurl(@result_kicurl)
{
  chomp($result_kicurl);
  system("curl -k https://203.134.121.95 -HHost:$result_kicurl > /dev/null 2>&1");
  system("sleep $counter");
  print "Connected to.. $result_kicurl via F5 VS.\n"

}
}
close(KICURL);
