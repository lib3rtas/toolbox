#!/bin/bash
RED='\033[0;31m'
GRE='\033[0;32m'
BLU='\033[0;34m'
NOC='\033[0m'
printf "${BLU}ENTER VALID CREDENTIAL INFORMATION \n ${NOC}"
ping 1.1.1.1 -c 1 > /dev/null && printf "${GRE}INTERNET CONNECTION IS OK${NOC}\n" || printf "${RED}INTERNET CONNECTION IS BROKEN, CONNECT AT LEAST TO THE INTERNET BITCH ${NOC}\n"
bash ~/Scripts/connect_fhnw_data.sh && printf "\n${GRE}SUCCESSFULLY FHNW DRIVE \n ${NOC}" || printf "${RED}MOUNT OF FHNW DRIVE FAILED ${NOC}\n" &&

source_dir=/home/fhammer/FHNW/E1811_Unterrichte_Bachelor/E1811_Unterrichte_I/
destination_dir=/home/fhammer/Desktop/

printf "${BLU}STARTING SYNCHRONIZATION OF CONFIGURED FOLDERS \n ${NOC}"

#netsi
rsync -rlvtPh --progress "$source_dir/5Is/netsi/" "$destination_dir/netsi_local" && printf "${GRE}SYNCED NETSI\n${NOC}" || printf "${RED}SYNC NETSI FAILED${NOC}\n"

#edbs
rsync -rlvtPh --progress "$source_dir/1Ib/edbs/" "$destination_dir/edbs_local" && printf "${GRE}SYNCED EDBS\n${NOC}" || printf "${RED}SYNC EDBS FAILED${NOC}\n"

#eti
rsync -rlvtPh --progress "$source_dir/3Ieng/eti/" "$destination_dir/eti_local" && printf "${GRE}SYNCED ETI\n${NOC}" || printf "${RED}SYNC ETI FAILED${NOC} \n"

#dtpC
rsync -rlvtPh --progress "$source_dir/1iCa/dtpC/" "$destination_dir/dtpC_local" && printf "${GRE}SYNCED DTPC\n${NOC}" || printf "${RED}SYNC DTPC FAILED${NOC} \n"

#syspr
rsync -rlvtPh --progress "$source_dir/3Ia/syspr/" "$destination_dir/syspr_local" && printf "${GRE}SYNCED SYSPR\n${NOC}" || printf "${RED}SYNC SYSPR FAILED${NOC} \n"

#cpib
rsync -rlvtPh --progress "$source_dir/7Ibb/cpib/" "$destination_dir/cpib_local" && printf "${GRE}SYNCED CPIB\n${NOC}" || printf "${RED}SYNC CPIB FAILED${NOC} \n"

#cysL /home/fhammer/FHNW/E1811_Unterrichte_Bachelor/E1811_Unterrichte_I/5Is/cysL/*
rsync -rlvtPh --progress "$source_dir/5Is/cysL/" "$destination_dir/cysl_local" && printf "${GRE}SYNCED CYSL\n${NOC}" || printf "${RED}SYNC CYSL FAILED${NOC} \n"

#itsar
rsync -rlvtPh --progress "$source_dir/5Is/itsar/" "$destination_dir/itsar_local" && printf "${GRE}SYNCED ITSAR\n${NOC}" || printf "${RED}SYNC ITSAR FAILED${NOC} \n"

#eana
rsync -rlvtPh --progress "$source_dir/3iCb/eana/" "$destination_dir/eana_local" && printf "${GRE}SYNCED EANA\n${NOC}" || printf "${RED}SYNC EANA FAILED${NOC} \n"

#prcpp
rsync -rlvtPh --progress "$source_dir/3Ib/prcpp/" "$destination_dir/prcpp_local" && printf "${GRE}SYNCED PRCPP\n${NOC}" || printf "${RED}SYNC PRCPP FAILED${NOC} \n"

printf "${BLU}END OF SYNCHRONIZATION \n${NOC}"

sudo umount /home/fhammer/FHNW  && printf "${GRE}SUCCESSFULLY UNMOUNTED FHNW DRIVE \n${NOC}" || printf "${RED}UNMOUNT OF FHNW DRIVE FAILED${NOC}\n"
