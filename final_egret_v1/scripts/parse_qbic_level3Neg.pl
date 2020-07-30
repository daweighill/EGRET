#!/usr/bin/perl
use warnings;
use strict;

# this script will parse the qbic results at a level 3 stringency, only negatives: 
# level 2: all that are not ambiguous->ambiguous and show a change, amd we only include negative qbic effects (i.e. those that disrupt binding). Also note, only input entries from human TFs.
#
# output file
my $level3Neg = $ARGV[2];
open LEVEL3NEG, ">$level3Neg";

# vcf file
my $geno = $ARGV[0];
# qbic results of vcf file
my $qbic = $ARGV[1];

my $counter = 0;
my $ref;
my $genesRef;
open FILE, $geno;
while (<FILE>)
{	
	chomp $_;
	my @line = split /\t/, $_;
	my $snpid = $line[0]."_".$line[1];
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
			# level 2 neg: negative results which show a change in the prediction
			if (($refstatus eq "bound") and ($altstatus eq "unbound"))
			{
				print LEVEL3NEG "$snpid\t$t\t$gene\t$line[3]\t1\n";
			}
		}
	}
}

close FILE;
close LEVEL3NEG;
