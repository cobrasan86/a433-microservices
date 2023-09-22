# !/bin/bash
# Author : Cobrasan86

#tambahan string
garis="=================================="

#Melakukan build docker image dari Dockerfile
docker build -t item-app:v1 .

#melakukan pause 2 detik dan clear layar
echo "Loading list docker images..."
sleep 2 && clear

#Melakukan list image baru yang dibuat khusus item-app
echo $garis
docker images | grep "item-app" | perl -ne 'print "Image baru dibuat ==> $_"'
echo $garis
sleep 3 && clear


#Melakukan full list docker image
echo "Loading list full docker images..."
sleep 3 && clear
echo $garis
docker images
sleep 3

#Mengubah nama image agar sesuai dengan Github Packages
docker image tag item-app:v1 ghcr.io/cobrasan86/item-app:v1

#Login ke Github Container Registry (Github Packages)
clear
echo "Login ke Github Packages"
echo $garis
echo $CR_PAT | docker login ghcr.io -u cobrasan86 --password-stdin

#Push image yang dibuat ke Github Pakcages
clear
echo "Menunggah docker images ke Github Packages..."
echo $garis
docker image push ghcr.io/cobrasan86/item-app:v1