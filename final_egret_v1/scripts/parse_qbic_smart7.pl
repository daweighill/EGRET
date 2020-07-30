#!/usr/bin/perl
use warnings;
use strict;

# output file
my $level2Neg = $ARGV[2];
open LEVEL2NEG, ">$level2Neg";

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
			if (($refstatus ne $altstatus) and ($refstatus ne "unbound") and ($altstatus ne "bound") and (($line[8] =~ /Homo_sapiens/) or ($line[5] < 1e-20)))
			{
				print LEVEL2NEG "$snpid\t$t\t$gene\t$line[3]\t1\n";
			}
		}
	}
}

close FILE;
close LEVEL2NEG;
