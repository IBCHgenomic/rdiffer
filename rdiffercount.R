#! /usr/bin/env Rscript

# Author Gaurav Sablok
# Instytut Chemii Bioorganicznej
# Polskiej Akademii Nauk
# ul. Noskowskiego 12/14 | 61-704, Poznań
# Date: 2025-6-3
# make sure you have readr, optparse, stringr and human bioannotation installed

suppressWarnings(suppressPackageStartupMessages(library(optparse)))
suppressWarnings(suppressPackageStartupMessages(library(org.Hs.eg.db)))
suppressWarnings(suppressPackageStartupMessages(library(stringr)))
suppressWarnings(suppressPackageStartupMessages(library(readr)))

option_list <- list(
    make_option(c("-f", "--file"),
        type = "character", default = NULL,
        help = "dataset file name", metavar = "character"
    ),
    make_option(c("-o", "--out"),
        type = "character", default = "out.txt",
        help = "output file name [default= %default]", metavar = "character"
    )
)
opt_parser <- OptionParser(usage = "usage:
    rdiffer: Converting differntial matrix to geneames for extensive plotting of differential expression results.
    Project PI and Informal queries: Prof. Luiza Handschuh: luizahan@ibch.poznan.pl.
    Code related queries: Dr. Gaurav Sablok: gsablok@ibch.poznan.pl. [options]", option_list = option_list)
opt <- parse_args(opt_parser)

if (is.null(opt$file)) {
    print_help(opt_parser)
    stop("At least one argument must be supplied (input file).n", call. = FALSE)
}

if (!is.null(opt$file)) {
    readfile <- read.delim(opt$file)
    ensembldataframe <- as.data.frame(readfile)
    oldrownames <- ensembldataframe[, 1]
    newrownames <- vector(length = length(oldrownames))
    for (i in seq_along(oldrownames)) {
        newrownames[i] <- str_split(oldrownames[i], "\\.")[[1]][1]
    }
    symbols <- mapIds(org.Hs.eg.db,
        keys = newrownames,
        column = c("SYMBOL"), keytype = "ENSEMBL"
    )
    symbolsdataframe <- as.data.frame(symbols)
    symbolsdataframe_rownames <- rownames(symbolsdataframe)
    namesgenesdataframe <- symbolsdataframe[, 1]
    genenames <- vector(length = length(symbolsdataframe_rownames))
    for (i in seq_along(symbolsdataframe_rownames)) {
        if (symbolsdataframe_rownames[i] == newrownames[i]) {
            genenames[i] <- namesgenesdataframe[i]
        }
    }
    output <- cbind(genenames, ensembldataframe)
    ensemblid <- rownames(output)
    finaloutput_with_genes <- as.data.frame(cbind(ensemblid, output))
    finaloutput_without_names <- as.data.frame(output)
    write_delim(finaloutput_with_genes[, -1], file = opt$out, delim = "\t")
    write_delim(finaloutput_without_names[, -2],
        file = "outputmatrix_without_names.txt", delim = " "
    )
}
