read -r -p "Enter user name: " user
sudo mosquitto_passwd -c /etc/mosquitto/passwd $user

while : ; do
    read -r -p "Do you want to add another client user? [y/n] " response
    if [[ $response =~ ^[yY]$ ]]; then
        read -r -p "Enter user name: " user
        sudo mosquitto_passwd -c /etc/mosquitto/passwd $user
    else
        break
    fi
done

sudo systemctl restart mosquitto.service

