#!/usr/bin/env perl

use utf8;
use strict;
use List::MoreUtils qw(uniq);
use Net::CIDR;
use Net::CIDR ':all';

my @tmp = qw();

foreach my $line (<STDIN>) {
        chomp($line);
        if (length($line) && $line !~ /^\s*#/ && $line =~ /(.*:)?((\d{1,3}[-\.]*){8})/) {
                push(@tmp, $2);
        }
}

my @result = sort(uniq(Net::CIDR::range2cidr(@tmp)));

print join("\n", @result);
print "\n";

