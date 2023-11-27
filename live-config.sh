#!/bin/sh
useradd -m pingu
usermod -p 'U6aMy0wojraho' pingu
usermod -p 'U6aMy0wojraho' root
for grp in audio video input tty wheel users ; do
    usermod -a -G $grp pingu 2>/dev/null
done

# hostname settings
echo "turkish" > /etc/hostname

# autologin settings
sed -i "s/agetty_options=\"/& --autologin pingu /g" /etc/conf.d/agetty

# language settings
mkdir -p /lib64/locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "" >> /etc/locale.gen
locale-gen
sed -i "s/C/en_US/g" /etc/profile.d/locale.sh
# live hooks
for hook in $(ls /lib/live/ 2>/dev/null) ; do
    /bin/sh /lib/live/$hook
done

