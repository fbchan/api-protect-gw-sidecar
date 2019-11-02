#!/usr/bin/perl
use warnings;
#use strict;

my $result_pods = "";
my $counter1 = 1;
my $counter2 = 1;

open(PODS,"kubectl get pod | grep -E \'2/2|3/3\' | gawk \'{print \$1\'}|");
my @result_pods=<PODS>;

open(SRV, "kubectl get svc | grep -E \'\\-sc\\-|microgw\' | gawk \'{print \$1\'}|");
my @result_srv = <SRV>;

foreach $result_pods(@result_pods)
{
  chomp($result_pods);

   foreach $result_srv(@result_srv)
   {
       chomp($result_srv);
       print "$result_pods --> $result_srv \n";   
       system("kubectl exec -it $result_pods -- curl -m 5 -sk https://$result_srv/ > /dev/null 2>&1");
       last if ($counter2++ == 5);

   }
   last if ($counter1++ == 5);

#  print "$result_pods \n";

}


close(PODS);
close(SRV);
