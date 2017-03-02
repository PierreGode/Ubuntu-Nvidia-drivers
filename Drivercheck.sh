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


#if [ "$hardware" = "GeForce GTX 960M" ]
#then
#echo "OK"
#else
#echo "FAIL"
#fi
driver=$(nvidia-smi | grep -i driver | cut -d ':' -f2 | cut -d '|' -f1 | sed -e 's/^[[:space:]]*//')
echo "${NUMBER}Driver installed: $driver ${END}"
apt=$(apt-cache search $driver)
echo "suggesting driver: $apt"
list(){
378.13=Quadro P3000
378.13=Quadro GP100
378.13=Quadro P4000
378.13=Quadro P2000
378.13=Quadro P1000
378.13=Quadro P600
378.13=Quadro P400
378.13=Quadro M1200
378.13=Quadro M2200
340.102=xorg-server 1.19
375.26=Quadro M3000 SE
375.20=GeForce GTX 1050
375.20=GeForce GTX 1050 Ti
375.20=Quadro M620
375.20=Quadro M5000 SE
375.10=Quadro P6000
375.10=Quadro P5000
367.44=TITAN X
367.44=TITAN X Pascal
367.44=GeForce GTX 1060
367.27=GeForce GTX 1080
367.27=GeForce GTX 1070
361.45.11=Quadro M5500
}
