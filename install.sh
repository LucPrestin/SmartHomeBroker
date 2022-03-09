sudo apt install -y mosquitto
sudo systemctl enable mosquitto.service

sudo echo "listener 1883" >> /etc/mosquitto/mosquitto.conf
sudo echo "allow_anonymous false" >> /etc/mosquitto/mosquitto.conf

sudo touch /etc/mosquitto/passwd
sudo echo "password_file /etc/mosquitto/passwd" >> /etc/mosquitto/mosquitto.conf

while : ; do
    read -r -p "Do you want to add a client user? [y/n] " response
    if [[ $response =~ ^[yY]$ ]]; then
        read -r -p "Enter user name: " user
        sudo mosquitto_passwd -c /etc/mosquitto/passwd $user
    else
        echo "You can always add new users by executing 'mosquitto_passwd -c /etc/mosquitto/passwd <user name>'."
        break
    fi
done

sudo systemctl restart mosquitto.service

echo "Installation complete"

