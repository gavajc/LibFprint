# AUTHOR

**Juan Carlos García Vázquez**

+   Date: Jan 15, 2021.
+ E-Mail: gavajc@live.com

# GENERAL INFO

This is a cross compile libfprint project for version v1.90.6. The folder 
libfprint-v1.90.6 contains the original sources from freedesktop gitlab repositories.

The libfprint project was born as university project later the project continue as an
open source. Is currently maintained by freedesktop.org.

I just created a few patches to compile and run on Windows systems. It's important to 
say that not all the library functionality is present in Windows. This is because the 
architecture of the Linux systems is different to the Windows.

For example: 


        1.- udev rules do not exist in Windows, the library can use the udev rules only
            for Linux systems.
        2.- The virtual device available to use only can be used in Linux because internally
            use Unix signals.


In general you can use the library for enroll, capture, verify, identify, fingerprints ...
The library was tested with Digital Persona U are U 400/4500 devices. in both O.S. (Windows/Linux).

In Windows you have to install the MSYS2 environment with MinGW64 tools and the tool Zadig for install
de WINUSB driver or libUSBK driver.

The complete list of dependencies are:


        	CMake
        	Ninja
        	Glib
        	GObject
        	GObject-Introspection
        	GTKdoc-scan
        	Libusb
        	Libgusb
        	LibUdev
        	LibPixman
        	LibNSS3
        	Python
        	Meson
        	Cairo (opcional)


Linux install dependencies commands (Based on Ubuntu systems):


        	CMake
        sudo apt install cmake
        	Ninja
        sudo apt install ninja-build
        	GLib
        sudo apt install libglib2.0-dev
        	GOBJECT
        sudo apt install gir1.2-gobject-2.0
        	GOBJECT-Introspection
        sudo apt install libgirepository1.0-dev
        	GTKdoc-scan
        sudo apt install gtk-doc-tools
        	LibUsb
        sudo apt install libusb-1.0-0-dev
        	LibGusb
        sudo apt install libgusb-dev
        	LibUdev
        sudo apt install libudev-dev
        	LibNSS3
        sudo apt install libnss3-dev
        	LibPixman
        sudo apt install libpixman-1-dev
        	Python
        sudo apt-get install python3 python3-pip python3-setuptools python3-wheel
        	Meson
        pip3 install meson
        	Cairo
        sudo apt install libcairo2-dev


Windows install dependencies commands (Using MSYS2 Environment):


        	pacman -S mingw-w64-x86_64-toolchain
        	pacman -S mingw-w64-x86_64-meson
        	pacman -S mingw-w64-x86_64-cmake
        	pacman -S mingw-w64-x86_64-pixman
        	pacman -S mingw-w64-x86_64-nss
        	pacman -S mingw-w64-x86_64-glib2
        	pacman -S mingw-w64-x86_64-gdk-pixbuf2
        	pacman -S mingw-w64-x86_64-libusb
        	pacman -S mingw-w64-x86_64-libgusb
        	pacman -S mingw-w64-x86_64-gobject-introspection
        	pacman -S mingw-w64-x86_64-gtk-doc
        	pacman -S mingw-w64-x86_64-cairo


Remember before install dependencies you must install the MSYS2 package. 
You can download it from his webpage or you can found a versión inside
the tools folder.
    
# Compilation

Once the dependencies are installed then you can proceed with patch and 
compiling the libfprint library.

    1.- First patch the library:
    
        In Windows open a PowerShell console, In Linux a console and execute 
        the prepare.sh script and as parameter the libfprint source folder.
        
        ./prepare.sh libfprint-v1.90.6
        
        If the sources were patched the script indicates it. If not then then
        sources will be patched. If all ok the script indicates it.
        
    2.- After patch the sources you can compile the libfprint library:
    
        cd libfprint-v1.90.6
        meson buildir && cd builddir
        
        If all dependencies were installed the result of the meson buildir will be ok.
        If not then indicates error about missing dependencies.
        
        meson compile
        
    3.- For Install:
        
        meson install
        
        The default directory for sources and library is: /usr/local/include /usr/local/lib/

    4.- Execute the default libfprint library examples
    
        Enroll --> Add new user an store the fingerprint local in disk or in device if support storage.
        Verify --> Compare a previous enrolled fingerprint. If match or not match.
        
# Usage


Before use the library in Windows Systems, you must install de WINUSB or LibUSBK driver.
You can use the Zadig tool for do that. You can found it in tools folder or you can 
download from his webpage.

Simple select your scanner device and select what driver do you want to install (WinUSB or LibUSBK).
LibUSBK has some advantages over WINUSB.

When you want to share your app in Windows systems, you have to share too, all DLL dependencies.
You can use the script depends.bat in tools folder for do that. Only set the correctly paths
according to MSYS2-MinGW64 installation. Or extract the list of manually.

For more information how to use libfprint library visit his webpage at:

https://fprint.freedesktop.org/

This version of the library use the API 2.0 documentation.

If you have any question, please send me an email. 
