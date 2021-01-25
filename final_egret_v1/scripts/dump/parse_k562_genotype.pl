#!/usr/bin/perl
use warnings;
use strict;

open FILE, "../genotype_data/K562.vcf";
open OUT, ">../genotype_data/bK562_formatted.vcf";

while (<FILE>)
{
	chomp $_;
	if ($_ !~ /#/)
	{
		my @line = split /\t/, $_;
		my @list = split /;/, $line[7];
		my @list2 = split /=/, $list[0];
		print OUT "$_\t$list2[1]\n";
		print "$line[7]\n";
	}
}
close OUT;
close FILE;

