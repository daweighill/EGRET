#!/usr/bin/perl
use warnings;
use strict;

open OUT, ">/home/ubuntu/EGRET/final_egret_v1_banovich/scripts/egret_commands_LCL";
open OUT2, ">/home/ubuntu/EGRET/final_egret_v1_banovich/scripts/egret_commands_iPSC";
open OUT3, ">/home/ubuntu/EGRET/final_egret_v1_banovich/scripts/egret_commands_iPSC-CM";

for my $i (1..119)
{
	print OUT "Rscript run_finalEGRET_v1_banovich_single_genotype_LCL.Rscript $i\n";
	print OUT2 "Rscript run_finalEGRET_v1_banovich_single_genotype_iPSC.Rscript $i\n";
	print OUT3 "Rscript run_finalEGRET_v1_banovich_single_genotype_iPSC-CM.Rscript $i\n";
}
