#!/usr/bin/perl
use warnings;
use strict;

open FILE, "../data/iPSC/iPSC-eQTL-summary.txt";
open OUT, ">../data/iPSC/iPSC-eQTL-summary_formatted.txt";

while (<FILE>)
{
	chomp $_;
	if ($_ =~ /\.\./)
	{
		my @line = split /\s+/, $_;
		#print "$line[1]\n";
		my @list = split /\./, $line[1];
		print OUT "$line[0] rsNA.$list[2].$list[3] $line[2] $line[3] $line[4]\n";
	}
	else
	{
		print OUT "$_\n";
	}
	
}


