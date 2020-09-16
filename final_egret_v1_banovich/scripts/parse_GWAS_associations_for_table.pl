#!/usr/bin/perl
use warnings;
use strict;

my $file = $ARGV[0];
my $term = $ARGV[1];
my $out = $ARGV[2];
open OUT, ">$out";
open FILE, $file;
while (<FILE>)
{
	chomp $_;
	my @line = split /\t/, $_;
	if ($line[7] eq "$term")
	{
		print "$_\n";
		print OUT "$line[1]&$line[2]&$line[3]&$line[4]&$line[6]\\\\\n";
	}

}

