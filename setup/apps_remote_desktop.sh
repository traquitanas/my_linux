#!/bin/bash


echo "---------------------------------------------"
echo "# VIRTUAL MACHINE"
echo " "


# Virtual Box
while true; do
    read -p "Would like to install Virtual Box (y/n)? " PROMPT
    case $PROMPT in
        [Yy]* )
        if ! command -v virtualbox &> /dev/null
        then
            sudo apt install virtualbox -y;
            sudo apt install virtualbox-ext-pack -y;
            sudo adduser $USER vboxusers;
        else
            echo "VirtualBox already installed!";
        fi
            break;;
        
        [Nn]* )
        break;;
        
        * )
        echo "Please answer yes or no.";;
    esac
done


# XRDP
while true; do
    read -p "Would like to install XRDP (y/n)? " PROMPT
    case $PROMPT in
        [Yy]* )
        if ! command -v xrdp &> /dev/null
        then
            sudo apt-get install xrdp -y;
        else
            echo "xrdp already installed!";
        fi
            break;;
            
        [Nn]* )
        break;;
        
        * )
        echo "Please answer yes or no.";;
    esac
done



# TeamViewer
# https://www.linuxbabe.com/ubuntu/install-teamviewer-ubuntu-18-04-lts
while true; do
    read -p "Would like to install TeamViewer (y/n)? " PROMPT
    case $PROMPT in
        [Yy]* )
        if ! command -v teamviewer &> /dev/null
        then
            wget -O ~/Downloads/team-viewer.deb "https://download.teamviewer.com/download/linux/teamviewer_amd64.deb";
            sudo apt install ~/Downloads/team-viewer.deb -y;
            rm ~/Downloads/team-viewer.deb;
        else
            echo "Team Viewer already installed!";
        fi
            break;;

        [Nn]* )
        break;;

        * )
        echo "Please answer yes or no.";;
    esac
done

echo "---------------------------------------------"
echo "# FINALIZANDO"
echo " "

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
