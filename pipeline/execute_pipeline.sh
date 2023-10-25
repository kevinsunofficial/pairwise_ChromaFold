#!/bin/bash -l

for ((i=1; i<=19; i++))
do
    time python pipeline.py --input_dir /data/leslie/suny4/processed_input/ \
                    --pred_dir /data/leslie/suny4/predictions/chromafold/ \
                    --paired --ct mycGCB_am_gfp_myc_gcb_thelp_sample mycGCB_am_gfp_myc_gcb_nothelp_sample \
                    --chrom $i --avg_stripe --min_dim 25 --max_dim 75 --num_dim 10 --close 10 \
                    --kernel tad_diff --pattern smooth --thresh_cutoff 1 \
                    --db_file /data/leslie/suny4/data/chrom_size/gencode.vM10.basic.annotation.db \
                    --filters gene_type=protein_coding \
                    --num_plot 10 --out_dir /data/leslie/suny4/figures/pipeline_result/mycGCB_am_gfp_myc_sample
    # time python pipeline.py --input_dir /data/leslie/suny4/processed_input/ \
    #                 --pred_dir /data/leslie/suny4/predictions/chromafold/ \
    #                 --paired --ct darko_wt_cb darko_ctcfhet_cb \
    #                 --chrom $i --avg_stripe --topdom_window 50 \
    #                 --kernel diff --pattern smooth --thresh_cutoff 0.1 \
    #                 --db_file /data/leslie/suny4/data/chrom_size/gencode.vM10.basic.annotation.db \
    #                 --filters gene_type=protein_coding \
    #                 --num_plot 10 --out_dir /data/leslie/suny4/figures/darko_wt_ctcfhet/query/ \
    #                 --fig_dir /data/leslie/suny4/figures/darko_wt_ctcfhet/
done