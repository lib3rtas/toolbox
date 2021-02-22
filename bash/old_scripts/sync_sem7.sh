#!/bin/bash
RED='\033[0;31m'
GRE='\033[0;32m'
BLU='\033[0;34m'
NOC='\033[0m'
printf "${BLU}ENTER VALID CREDENTIAL INFORMATION \n ${NOC}"
ping 1.1.1.1 -c 1 > /dev/null && printf "${GRE}INTERNET CONNECTION IS OK${NOC}\n" || printf "${RED}INTERNET CONNECTION IS BROKEN, CONNECT AT LEAST TO THE INTERNET BITCH ${NOC}\n"
bash ~/Scripts/connect_fhnw_data.sh && printf "\n${GRE}SUCCESSFULLY FHNW DRIVE \n ${NOC}" || printf "${RED}MOUNT OF FHNW DRIVE FAILED ${NOC}\n" &&

source_dir='/mnt/FHNW/E1811_Unterrichte_Bachelor/E1811_Unterrichte_I/'
destination_dir='/home/fhammer/Desktop/'

printf "${BLU}STARTING SYNCHRONIZATION OF CONFIGURED FOLDERS \n ${NOC}"

#webfr
rsync -rlvtPh --progress "$source_dir/7iCbb/webfr/" "$destination_dir/webfr_local" && printf "${GRE}SYNCED WEBFR\n${NOC}" || printf "${RED}SYNC WEBFR FAILED${NOC} \n"

#fprog
rsync -rlvtPh --progress "$source_dir/3Ib/fprog/" "$destination_dir/fprog_local" && printf "${GRE}SYNCED FPROG\n${NOC}" || printf "${RED}SYNC FPROG FAILED${NOC} \n"

#swa
rsync -rlvtPh --progress "$source_dir/5Ibb1/swa/" "$destination_dir/swa_local" && printf "${GRE}SYNCED SWA\n${NOC}" || printf "${RED}SYNC SWA FAILED${NOC} \n"

#eti
rsync -rlvtPh --progress "$source_dir/5iCa/eti/" "$destination_dir/eti_local" && printf "${GRE}SYNCED ETI\n${NOC}" || printf "${RED}SYNC ETI FAILED${NOC} \n"

#cysl
rsync -rlvtPh --progress "$source_dir/5Is/cysl/" "$destination_dir/cysl_local" && printf "${GRE}SYNCED CYSL\n${NOC}" || printf "${RED}SYNC CYSL FAILED${NOC} \n"

#pcls
rsync -rlvtPh --progress "$source_dir/5Is/pcls/" "$destination_dir/pcls_local" && printf "${GRE}SYNCED PCLS\n${NOC}" || printf "${RED}SYNC PCLS FAILED${NOC} \n"

#cloud
rsync -rlvtPh --progress "$source_dir/3Ia/cloud/" "$destination_dir/cloud_local" && printf "${GRE}SYNCED CLOUD\n${NOC}" || printf "${RED}SYNC CLOUD FAILED${NOC} \n"

#prcpp
rsync -rlvtPh --progress "$source_dir/3Ib/prcpp/" "$destination_dir/prcpp_local" && printf "${GRE}SYNCED PRCPP\n${NOC}" || printf "${RED}SYNC PRCPP FAILED${NOC} \n"

printf "${BLU}END OF SYNCHRONIZATION \n${NOC}"

sudo umount /mnt/FHNW  && printf "${GRE}SUCCESSFULLY UNMOUNTED FHNW DRIVE \n${NOC}" || printf "${RED}UNMOUNT OF FHNW DRIVE FAILED${NOC}\n"
