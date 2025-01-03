gcloud compute instances create vm3 \
  --zone=northamerica-south1-a \
  --machine-type=n4-standard-2 \
  --image-family=ubuntu-2204-lts \
  --image-project=ubuntu-os-cloud \
  --preemptible \
  --boot-disk-size=20GB \
  --can-ip-forward \
  --enable-nested-virtualization \
  --network-interface=subnet=host-network-subnet,private-network-ip=192.168.1.13 \
  --metadata-from-file startup-script=./startup-script.sh \
  --metadata serial-port-enable=true,enable-nested-virtualization=true,ssh-keys="naftaly:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDiKQIYx32atzp82NvngBrTlHDlogKkWLYcq3UFfZmApY+FKZzuC2te3uWqMOU75hafIoKxTZpaKrz4AYoVPA9C/WxbmY5Nv4Aj0y+V/BW5EYTkMdGrdop1Mub/0T/rDDuu65dCIybeF5a6iwE5t+lQaOLyaSOO1F4Aw34bGJzYKd2P+HwTdQUjbJfBOcesJ/w4tXyVxucKhilwLZaEiE3/9lHf8U7DwcVd1pfDV+P9qNNjj2J3CN6ujmso6xNAY0fyZC39joqccpHiUqIij7DOgKLuzmy5vS0ui687hM5hEG7I2MBuLCJ2vZez54xF9+KRnBKstna6ufjoUkMX664Qo7SyOqcEyQ0DpEIGWLrpwsF+vQw1BSuEVHIKBQUs1GghYsHpBYeJFYYoCS3D4CzSG2LvYi6kwcyVyBda/xHEFqNF66y7z6MzVbfLD5XokavCpaIGEAqtrGSH9NFNnEB7hsc4YvypAta/Bm8vPiYerClXlOYl8BsGqYPV2ZuhWFk= naftaly@7950x-vm"
