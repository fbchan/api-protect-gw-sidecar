#!/usr/bin/perl
use warnings;
#use strict;

my $result_pods = "";

open(JWT,"<","jwt-list");
open(API,"<","api-url-list");

my @result_jwt = <JWT>;
my @result_api = <API>;

#open(PODS,"kubectl get pod | grep -E \'3/3\' | gawk \'{print \$1\'}|");
open(PODS,"kubectl get pod | grep -E \'nettools-0\' | gawk \'{print \$1\'}|");
my @result_pods=<PODS>;

#open(SRV, "kubectl get svc | grep -E \'microgw-a|microgw-c\' | gawk \'{print \$1\'}|");
open(SRV, "kubectl get svc | grep -E \'microgw-c\' | gawk \'{print \$1\'}|");
my @result_srv = <SRV>;


foreach $result_pods(@result_pods)
{
  chomp($result_pods);

   foreach $result_srv(@result_srv)
   {
       chomp($result_srv);
       print "$result_pods --> $result_srv \n";

       foreach $result_jwt(@result_jwt)
       {
       		chomp($result_jwt);

       		foreach $result_api(@result_api)
       		{
       			chomp($result_api);
       			system("kubectl exec -it $result_pods -- curl -m 5 -sk https://$result_srv$result_api -H \"Authorization: Bearer $result_jwt\"> /dev/null 2>&1");
       			print "$result_pods --> https://$result_srv$result_api\n";

       		}

       }

   }

#  print "$result_pods \n";

}

close(JWT);
close(API);
close(PODS);
close(SRV);
