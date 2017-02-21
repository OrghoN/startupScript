#!/bin/bash

#list of ppas
readarray ppas < ppa.txt

echo "add PPA's:"
#adding PPA's
for i in "${ppas[@]}"; do
    add-apt-repository -y $i
    echo $i
done

apt update

#list of applications
readarray packages < softwarePackages.txt

echo "add PPA's:"
#adding PPA's
for i in "${packages[@]}"; do
    apt install -y $i
    echo $i
done
