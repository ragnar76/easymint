# Readme for the source release of EasyMiNT

	Maanke released the source of it on 19/07/18 and i made a public repo of it. just to archive things.

## What is EasyMiNT?
EasyMiNT is a GEM based installer for MiNT/Sparemint. With EasyMiNT you're only
a few mouseclicks away from a real MiNT system. EasyMiNT is for the beginner,
who don't want to edit scripts or use cryptic commandline tools. The motto of
EasyMiNT is "first install and then learn". The only suppositions for using
EasyMiNT is that you know how to unpack a ZIP archive, to know how to copy
files and to create a LNX or RAW partition with your harddisk tool. EasyMiNT
is based on the Sparemint packages, these packages will be installed by
EasyMiNT, but you have not to care about which packages are necessary and
which are not. 

## Features
- Mouse controlled installation
- automatic installation of kernel, serial drivers and creation of MINT.CNF
- automatic creation of the ext2 filesystem
- automatic creation of the root filesystem
- automatic installation of the rpm packages
- Various installations
- Possibility of post installing packages
- Different startup modes possible (Login, N.AES, XaAES, TOS)
- Automatic installation of XaAES possible
- Different language versions possible

## Conditions
- much memory, min. 8MB
- CPU: 68030 or better
- A partition with at least 15MB (Basic install) up to 300MB (Full install)

## Changes to the sources i've made
- chmod 0755 to folders
- chmod 0644 to files
- removed so packages to reduce repo size
 * EASYMINT.ZIP
 * XAAES.ZIP
 * ROOTFS.TGZ
 * BASIC.TAR
 * NET.TAR
 * LIBS.TAR
 * DEVEL.TAR
 * X11.TAR

# Copyright
Maanke didn't say anything about copyright or license, he just released the
source to the public.

# Contact
If you have any issues with this repo, pls use the issue tab above