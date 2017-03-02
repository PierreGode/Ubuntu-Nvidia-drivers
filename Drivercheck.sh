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
echo "${NUMBER}Hardware installed: $hardware ${END}"
test=$(nvidia-smi)
if [ $? = 127 ]
then
echo "${RED_TEXT}No driver seems to be installed ${END}"
else
driver=$(nvidia-smi | grep -i driver | cut -d ':' -f2 | cut -d '|' -f1 | sed -e 's/^[[:space:]]*//')
echo "${NUMBER}Driver installed: $driver ${END}"
fi

cat list.txt | while read output
do
if [ "$hardware" = "$output" ]
then
echo "The suggested driver for $hardware is $output"
apt=$(apt-cache search $newdriver)
echo "suggesting driver: $apt"
else
echo "Fail"
fi
