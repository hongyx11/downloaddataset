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
