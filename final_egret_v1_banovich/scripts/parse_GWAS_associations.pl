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

