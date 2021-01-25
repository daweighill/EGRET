#!/usr/bin/perl
use warnings;
use strict;

# this script will parse the qbic results at a level 2 stringency, only negatives: 
# level 2: all that are not ambiguous->ambiguous and show a change, amd we only include negative qbic effects (i.e. those that disrupt binding). Also note, only input entries from human TFs.
#
# output file
my $level2Neg = "/home/ubuntu/EGRET/final_egret_v1/inputs/qbic_allSNPS_GM12878_K562.txt";
open LEVEL2NEG, ">$level2Neg";

my @chroms = qw(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X);
#my @chroms = qw(1);
for my $c (@chroms)
{

# vcf file
my $geno = "/home/ubuntu/EGRET/final_egret_v1/genotype_data/qbic_folder/chr".$c."_NA12878_K562.vcf";
# qbic results of vcf file
my $qbic = "/home/ubuntu/EGRET/final_egret_v1/genotype_data/qbic_folder/chr".$c."_QbicPred_finalEGRET_v1_06172020.txt";

my $counter = 0;
my $ref;
my $genesRef;
open FILE, $geno;
while (<FILE>)
{	
	chomp $_;
	my @line = split /\t/, $_;
	my $snpid = $line[0]."_".$line[1];
	#print "$snpid\n";
	$ref->{$counter} = $snpid;
	$genesRef->{$counter} = $line[2];
	$counter++;
}
close FILE;

#now loop through qbic output and write out prior file for that chromosome
open FILE, $qbic;
while (<FILE>)
{
	if ($_ !~ /wild/)
	{
		chomp $_;
		my @line = split /\t/, $_;
		my $snpid = $ref->{$line[0]};
		my $gene =  $genesRef->{$line[0]};
		my $diff = $line[3];	
		my @list = split /\>/, $line[7];
		my $refstatus = $list[0];
		my $altstatus = $list[1];
		my @tfs = split /,/, $line[6];

		for my $t (@tfs)
                {
			if (($refstatus ne $altstatus) and ($diff < 0) and (($line[8] =~ /Homo_sapiens/) or ($line[5] < 1e-20)))
			{
				print LEVEL2NEG "$snpid\t$t\t$gene\t$line[3]\t1\n";
			}
		}
	}
}

}
close FILE;
close LEVEL2NEG;
