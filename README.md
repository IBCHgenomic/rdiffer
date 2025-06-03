# rdiffer

- analyzing the differential expression counts from isoform view.
- tagging gene names to the differential expression results from isoform also.

![](https://github.com/IBCHgenomic/eVaiutilities/blob/main/logo.png)

```
rdiffer (main) ✗ Rscript --vanilla rdiffer.R
Usage: usage:
    rdiffer: Converting differntial matrix to geneames for extensive plotting of differential expression results.
    Project PI and Informal queries: Prof. Luiza Handschuh: luizahan@ibch.poznan.pl.
    Code related queries: Dr. Gaurav Sablok: gsablok@ibch.poznan.pl. [options]


Options:
	-f CHARACTER, --file=CHARACTER
		dataset file name

	-o CHARACTER, --out=CHARACTER
		output file name [default= out.txt]

	-h, --help
		Show this help message and exit
```

```
Rscript --vanilla rdiffer.R -f ./sample-files/samplefile.matrix -o annotatedgenes.txt
Rscript --vanilla rdiffer.R -f ./sample-files/DEmatrix.DE_results -o annotatedgenes.txt
```

- it will generate two files one with the output name which the user has specified and that will have both the ENSEMBL and the genename and the other without names with only the annotated genenames.
- Acknowledgements: MOSAIC platform, developed as part of the ECBiG-MOSAIC project (POIR.04.02.00-00-D017/20), co-financed by the European Regional Development Fund (ERDF) under the Smart Growth Operational Programme 2014-2020, Measure 4.2 for the development of modern research infrastructure in the science sector.
- Project PI and Informal queries: Prof. Luiza Handschuh: luizahan@ibch.poznan.pl.
- Code related queries: Dr. Gaurav Sablok: gsablok@ibch.poznan.pl.

Gaurav Sablok Instytut Chemii Bioorganicznej Polskiej Akademii Nauk ul. Noskowskiego 12/14 | 61-704, Poznań Poland
