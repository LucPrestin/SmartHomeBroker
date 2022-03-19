sudo apt install -y mosquitto
sudo systemctl enable mosquitto.service

sudo echo "listener 1883" >> /etc/mosquitto/mosquitto.conf
sudo echo "allow_anonymous false" >> /etc/mosquitto/mosquitto.conf

sudo touch /etc/mosquitto/passwd
sudo echo "password_file /etc/mosquitto/passwd" >> /etc/mosquitto/mosquitto.conf

./add_user.sh

sudo systemctl restart mosquitto.service

echo "Installation complete"

