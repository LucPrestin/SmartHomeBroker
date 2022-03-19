while : ; do
    read -r -p "Do you want to add a client user? [y/n] " response
    if [[ $response =~ ^[yY]$ ]]; then
        read -r -p "Enter user name: " user
        sudo mosquitto_passwd -c /etc/mosquitto/passwd $user
    fi
done
