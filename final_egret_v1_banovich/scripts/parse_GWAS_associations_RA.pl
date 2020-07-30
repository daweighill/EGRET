#!/usr/bin/perl
use warnings;
use strict;

my $file = "../gwas/RA_gwas.csv";
my $term = "Rheumatoid arthritis";
my $out = "../gwas/RA_gwas_parsed.txt";

open OUT, ">$out";
open FILE, $file;
while (<FILE>)
{
	chomp $_;
	my @line = split /\t/, $_;
	print "$line[7]\n";
	if ($line[7] eq "$term")
	{
		if ($line[14] =~ /\s+-\s+/)
		{
			my @list = split /\s+-\s+/, $line[14];
			for my $g (@list)
			{
				print OUT "$line[7]\t$g\n";
			}
		}

		elsif ($line[14] =~ /,\s+/)
		{
			my @list = split /,\s+/, $line[14];
                        for my $g (@list)
                        {
                                print OUT "$line[7]\t$g\n";
                        }

		}

		else
		{
			print OUT "$line[7]\t$line[14]\n";
		}
	}
}

