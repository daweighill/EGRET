#!/usr/bin/perl
use warnings;
use strict;

open OUT, ">../viz/eqtl.bed";
open FILE, "../inputs/eQTL_in_motif_promotor_adjacent_egene_finalEGRET_v1_06172020.txt";
while (<FILE>)
{
	chomp $_;
	my @line = split /\t/, $_;
	my $start = $line[2] -1;
	my $name = "$line[0]_$line[1]";
	print OUT "$line[3]\t$start\t$line[2]\t$name\n";
}
close FILE;
close OUT;

open OUT, ">../viz/genes.bed";
open FILE, "../annotation/ensembl_genes_from_ucsc.txt";
my $counter = 1;
while (<FILE>)
{
	chomp $_;
	my @line = split /\t/, $_;
	if ($counter != 1)
	{
		print OUT "$line[2]\t$line[4]\t$line[5]\t$line[12]\n";
	}
	$counter++;
}
close FILE;
close OUT;
