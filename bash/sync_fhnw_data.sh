#!/bin/bash
RED='\033[0;31m'
GRE='\033[0;32m'
BLU='\033[0;34m'
NOC='\033[0m'
printf "${BLU}ENTER VALID CREDENTIAL INFORMATION \n ${NOC}"
ping 1.1.1.1 -c 1 > /dev/null && printf "${GRE}INTERNET CONNECTION IS OK${NOC}\n" || printf "${RED}INTERNET CONNECTION IS BROKEN${NOC}\n"
bash ~/Scripts/connect_fhnw_data.sh && printf "\n${GRE}SUCCESSFULLY FHNW DRIVE \n ${NOC}" || printf "${RED}MOUNT OF FHNW DRIVE FAILED${NOC}\n" &&

source_dir='/mnt/FHNW/E1811_Unterrichte_Bachelor/E1811_Unterrichte_I/'
destination_dir='/home/fhammer/Desktop/'

printf "${BLU}STARTING SYNCHRONIZATION OF CONFIGURED FOLDERS \n ${NOC}"

# module
class="1Ia"
module="example"

rsync -rlvtPh --progress "$source_dir/$class/$module/" "$destination_dir/$module.local" && printf "${GRE}SUCCESS $module sync\n${NOC}" || printf "${RED}FAIL $module sync${NOC} \n"

printf "${BLU}END OF SYNCHRONIZATION \n${NOC}"

sudo umount /mnt/FHNW  && printf "${GRE}SUCCESSFULLY UNMOUNTED FHNW DRIVE \n${NOC}" || printf "${RED}UNMOUNT OF FHNW DRIVE FAILED${NOC}\n"
