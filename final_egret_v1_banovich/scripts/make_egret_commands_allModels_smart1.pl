#!/usr/bin/perl
use warnings;
use strict;

open OUT, ">/home/ubuntu/EGRET/final_egret_v1_banovich/scripts/egret_commands_all_models_smart1";
for my $i (1..119)
{
	print OUT "Rscript run_finalEGRET_v1_banovich_single_genotype_LCL_allModels_smart1.Rscript $i\n";
	print OUT "Rscript run_finalEGRET_v1_banovich_single_genotype_iPSC_allModels_smart1.Rscript $i\n";
	print OUT "Rscript run_finalEGRET_v1_banovich_single_genotype_iPSC-CM_allModels_smart1.Rscript $i\n";
}
