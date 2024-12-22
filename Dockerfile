# Use a base image that supports systemd, for example, Ubuntu
FROM kalilinux/kali-rolling

#Perbarui sistem
RUN apt update && apt upgrade -y

#Instalasi Shellinabox
RUN apt install -y shellinabox

#Tambahkan pengguna
RUN useradd -m -s /bin/bash kali

#Atur kata sandi pengguna
RUN echo "kali:kalidan" | chpasswd

#Konfigurasi Shellinabox
RUN shellinaboxd -port 4200 -s /:LOGIN

#Expose port 4200
EXPOSE 4200

#Menjalankan perintah saat container dijalankan
CMD ["shellinaboxd", "-port", "4200", "-s", "/:LOGIN"]
