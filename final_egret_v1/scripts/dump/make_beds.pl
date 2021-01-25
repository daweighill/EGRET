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

system("grep ARID3A ../chipseq/GM12878_remap2018_all_macs2_hg19_v1_2.bed >../viz/ARID3A_gm12878.bed");
system("grep ARID3A ../chipseq/K562_remap2018_all_macs2_hg19_v1_2.bed >../viz/ARID3A_k562.bed");
system("grep RELA ../chipseq/K562_remap2018_all_macs2_hg19_v1_2.bed >../viz/RELA_k562.bed");
system("grep RELA ../chipseq/GM12878_remap2018_all_macs2_hg19_v1_2.bed >../viz/RELA_gm12878.bed");

open FILE, "../genotype_data/NA12878.vcf";
open OUT, ">../viz/NA12878_vcf.bed";
while (<FILE>)
{
	if ($_ !~ /#/)
	{
		chomp $_;
		my @line = split /\t/, $_;
		my $start = $line[1]-1;
		my $name = "$line[3]_$line[4]";
		print OUT "$line[0]\t$start\t$line[1]\t$name\n";
	}
}
close FILE;
close OUT;

open FILE, "../genotype_data/k562.vcf";
open OUT, ">../viz/K562_vcf.bed";
while (<FILE>)
{
	if ($_ !~ /#/)
	{
		chomp $_;
		my @line = split /\t/, $_;
		my $start = $line[1]-1;
		my $name = "$line[3]_$line[4]";
		print OUT "$line[0]\t$start\t$line[1]\t$name\n";
	}
}
close FILE;
close OUT;

