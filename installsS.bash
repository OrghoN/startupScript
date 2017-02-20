#list of ppas
ppas=( ppa:webupd8team/atom)

echo "add PPA's:"
#adding PPA's
for i in "${ppas[@]}"; do
    add-apt-repository -y $i
    echo $i
done

apt update

#list of applications
packages=( atom chromium-browser emacs)

echo "add PPA's:"
#adding PPA's
for i in "${packages[@]}"; do
    apt install -y $i
    echo $i
done
