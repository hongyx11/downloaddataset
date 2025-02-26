#!/bin/bash

# Function to download a dataset
download_dataset() {
    local dataset_name="$1"
    local url="$2"

    if [ -d "$DLOC/${dataset_name}" ]; then
        echo "$DLOC/${dataset_name} dataset exists."
    else
        rm -f $DLOC/${dataset_name}.tar.gz
        wget -P $DLOC ${url}
        tar -xzf $DLOC/${dataset_name}.tar.gz -C $DLOC 
        rm -f $DLOC/${dataset_name}.tar.gz
    fi
}

download_tiny() {
    echo "downloading small dataset"
    if [ -z "${DLOC}" ]; then
        echo "DLOC is empty, please set it"
    else
        echo "DLOC is set: $DLOC"
        # tilespgemm 
        download_dataset pdb1HYS https://suitesparse-collection-website.herokuapp.com/MM/Williams/pdb1HYS.tar.gz
        download_dataset consph https://suitesparse-collection-website.herokuapp.com/MM/Williams/consph.tar.gz
        download_dataset webbase-1M https://suitesparse-collection-website.herokuapp.com/MM/Williams/webbase-1M.tar.gz
        download_dataset bcspwr06 https://suitesparse-collection-website.herokuapp.com/MM/HB/bcspwr06.tar.gz
    fi
}


download_small() {
    echo "downloading small dataset"
    if [ -z "${DLOC}" ]; then
        echo "DLOC is empty, please set it"
    else
        echo "DLOC is set: $DLOC"
        # tilespgemm 
        download_dataset pdb1HYS https://suitesparse-collection-website.herokuapp.com/MM/Williams/pdb1HYS.tar.gz
        download_dataset consph https://suitesparse-collection-website.herokuapp.com/MM/Williams/consph.tar.gz
        download_dataset webbase-1M https://suitesparse-collection-website.herokuapp.com/MM/Williams/webbase-1M.tar.gz
        download_dataset af_shell10 https://suitesparse-collection-website.herokuapp.com/MM/Schenk_AFE/af_shell10.tar.gz
        download_dataset SiO2 https://suitesparse-collection-website.herokuapp.com/MM/PARSEC/SiO2.tar.gz
        download_dataset gupta3 https://suitesparse-collection-website.herokuapp.com/MM/Gupta/gupta3.tar.gz
        download_dataset rma10 https://suitesparse-collection-website.herokuapp.com/MM/Bova/rma10.tar.gz
        download_dataset TSOPF_FS_b300_c2 https://suitesparse-collection-website.herokuapp.com/MM/TSOPF/TSOPF_FS_b300_c2.tar.gz
    fi
}




download_hipmcl() {
    echo "downloading hipmcl dataset"
    if [ -z "${DLOC}" ]; then
        echo "DLOC is empty, please set it"
    else
        echo "DLOC is set: $DLOC"
        if [ -d "$DLOC/virus" ]; then
            echo "$DLOC/virus dataset exists."
        else
            mkdir -p $DLOC/virus
            wget -P $DLOC/virus https://portal.nersc.gov/project/m1982/HipMCL/viruses/vir_vs_vir_30_50length_propermm.mtx
        fi
        if [ -d "$DLOC/eukarya" ]; then
            echo "$DLOC/eukarya dataset exists."
        else
            mkdir -p $DLOC/eukarya
            wget -P $DLOC/eukarya https://portal.nersc.gov/project/m1982/HipMCL/eukarya/euk_vs_euk_30_50length_propermm.mtx
        fi
        if [ -d "$DLOC/archaea" ]; then
            echo "$DLOC/archaea dataset exists."
        else
            mkdir -p $DLOC/archaea
            wget -P $DLOC/archaea https://portal.nersc.gov/project/m1982/HipMCL/archaea/arch_vs_arch_30_50length_propermm.mtx
        fi
    fi
}


download_tfCombBLAS(){
    echo "download dataset used for benchmarking CombBLAS GPU"
    download_dataset atmosmodd https://suitesparse-collection-website.herokuapp.com/MM/Bourchtein/atmosmodd.tar.gz
    download_dataset delaunay_n22 https://suitesparse-collection-website.herokuapp.com/MM/DIMACS10/delaunay_n22.tar.gz 
}

download_ACSpGEMM(){
    echo "download dataset used for benchmarking AC-SpGEMM Paper https://dl.acm.org/doi/10.1145/3293883.3295701 "
    download_dataset language https://suitesparse-collection-website.herokuapp.com/MM/Tromble/language.tar.gz
    download_dataset scircuit https://suitesparse-collection-website.herokuapp.com/MM/Hamm/scircuit.tar.gz
    download_dataset stat96v2 https://suitesparse-collection-website.herokuapp.com/MM/Meszaros/stat96v2.tar.gz
    download_dataset asia_osm https://suitesparse-collection-website.herokuapp.com/MM/DIMACS10/asia_osm.tar.gz
    download_dataset atmosmodl https://suitesparse-collection-website.herokuapp.com/MM/Bourchtein/atmosmodl.tar.gz
    download_dataset filter3D https://suitesparse-collection-website.herokuapp.com/MM/Oberwolfach/filter3D.tar.gz
    download_dataset bibd_19_9 https://suitesparse-collection-website.herokuapp.com/MM/JGD_BIBD/bibd_19_9.tar.gz
    download_dataset cant https://suitesparse-collection-website.herokuapp.com/MM/Williams/cant.tar.gz
    download_dataset landmark https://suitesparse-collection-website.herokuapp.com/MM/Pereyra/landmark.tar.gz
    download_dataset hood https://suitesparse-collection-website.herokuapp.com/MM/GHS_psdef/hood.tar.gz
    download_dataset TSOPF_RS_b2383 https://suitesparse-collection-website.herokuapp.com/MM/TSOPF/TSOPF_RS_b2383.tar.gz
    download_dataset hugebubbles-00020 https://suitesparse-collection-website.herokuapp.com/MM/DIMACS10/hugebubbles-00020.tar.gz
    download_dataset poisson3Da https://suitesparse-collection-website.herokuapp.com/MM/FEMLAB/poisson3Da.tar.gz
    download_dataset TSC_OPF_1047 https://suitesparse-collection-website.herokuapp.com/MM/IPSO/TSC_OPF_1047.tar.gz
}

download_suitsparse_small(){
    download_dataset 1138_bus https://suitesparse-collection-website.herokuapp.com/MM/HB/1138_bus.tar.gz
    download_dataset 494_bus https://suitesparse-collection-website.herokuapp.com/MM/HB/494_bus.tar.gz
    download_dataset 662_bus https://suitesparse-collection-website.herokuapp.com/MM/HB/662_bus.tar.gz
    download_dataset 685_bus https://suitesparse-collection-website.herokuapp.com/MM/HB/685_bus.tar.gz
}

datasetname="$1"

if [[ "$datasetname" == "tiny" ]]; then
    download_tiny
fi

if [[ "$datasetname" == "small" ]]; then
    download_small
fi


if [[ "$datasetname" == "mcl" ]]; then
    download_hipmcl
fi

if [[ "$datasetname" == "tfcombblas" ]]; then
    download_tfCombBLAS
fi

if [[ "$datasetname" == "acspgemm" ]]; then
    download_ACSpGEMM
fi
if [[ "$datasetname" == "suitsparsesmall" ]]; then
    download_suitsparse_small
fi
