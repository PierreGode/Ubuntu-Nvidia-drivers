
# ~~~~~~~~~~  Environment Setup ~~~~~~~~~~ #
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    RED_TEXT=`echo "\033[31m"` #Red
    INTRO_TEXT=`echo "\033[32m"` #green and white text
    END=`echo "\033[0m"`
# ~~~~~~~~~~  Environment Setup ~~~~~~~~~~ #


clear
hardware=$(lspci | grep -i nvidia | cut -d '[' -f2 | cut -d ']' -f1)
checkforNvidia=$(lspci | grep -i -m 1 nvidia | cut -d ':' -f3 | cut -d 'C' -f1 | sed -e 's/^[[:space:]]*//')
if [ $checkforNvidia = NVIDIA ]
then
echo "Nvidia card detected"
else
echo "${RED_TEXT}NO NVIDIA card detected ${END}"
exit
fi
aptnvidia=$(sudo apt list --installed | grep -m 1-i nvidia | cut -d 'a' -f1 )
if [ $aptnvidia = nvidi ]
then
echo "${NUMBER}Found Nvidia pakages: $aptnvidia ${END}"
else
echo "${RED_TEXT}No Nvidia pakages seems to be installed ${END}"
fi
test=$(nvidia-smi)
if [ $? = 127 ]
then
echo "${RED_TEXT}No nvidia-smi seems to be installed ${END}"
latestdriver=$(curl http://www.nvidia.com/object/unix.html | grep -i "Latest short Lived Branch" | grep -i -m 1 version | cut -d '>' -f2 | cut -d '<' -f1)
echo "The suggested driver for $hardware is $latestdriver"
else
driver=$(nvidia-smi | grep -i driver | cut -d ':' -f2 | cut -d '|' -f1 | sed -e 's/^[[:space:]]*//')
latestdriver=$(curl http://www.nvidia.com/object/unix.html | grep -i "Latest short Lived Branch" | grep -i -m 1 version | cut -d '>' -f2 | cut -d '<' -f1)
clear
echo "${NUMBER}Hardware installed: $hardware ${END}"
echo "${NUMBER}Driver installed: $driver ${END}"
echo "${NUMBER}Latest driver available: $latestdriver ${END}"
if [ $driver = $latestdriver ]
then
echo "${NUMBER}Your driver is up to date${END}"
else
echo "${NUMBER}Your driver is not latest version ( $latestdriver )${END}"
fi
fi
