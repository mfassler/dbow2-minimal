
### Building a DPKG for DBoW2

Clone and build it:
```bash

git clone https://github.com/mfassler/dbow2-minimal

make -j
```

Now, install it into a "buildroot":
```bash

make install DESTDIR=~/buildroot_dbow2 PREFIX=/usr

```


Copy the "DEBIAN" dir from this repo into your buildroot:

```
cp -a $THISREPO/DEBIAN ~/buildroot_dbow2/

# Set the architecture to what you just built:
vim ~/buildroot_dbow2/DEBIAN/control
# ... edit the "Architecture:" line...


# sometimes there's wrong umask (default chmod settings) for directories:
cd ~/buildroot_dbow2/usr
find . -type d | xargs chmod 755
```

(some notes on building .dpkg files:  http://tldp.org/HOWTO/html_single/Debian-Binary-Package-Building-HOWTO/ )

```
cd ~
fakeroot dpkg-deb --build buildroot_dbow2 dbow2-minimal-0.1-1_amd64.deb
```

