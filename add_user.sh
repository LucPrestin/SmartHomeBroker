read -r -p "Enter user name: " user
read -r -p "Enter password: " password
sudo mosquitto_passwd -b /etc/mosquitto/passwd $user $password

while : ; do
    read -r -p "Do you want to add another client user? [y/n] " response
    if [[ $response =~ ^[yY]$ ]]; then
        read -r -p "Enter user name: " user
        read -r -p "Enter password: " password
        sudo mosquitto_passwd -b /etc/mosquitto/passwd $user $password
    else
        break
    fi
done

sudo systemctl restart mosquitto.service

