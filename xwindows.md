*Optional xwindows instructions*
## Install xwindow client (vcxsrv)
Download vcxsrv from sourceforge https://sourceforge.net/projects/vcxsrv/  
Setup instructions here https://sourceforge.net/p/vcxsrv/wiki/Using%20VcXsrv%20Windows%20X%20Server/
Ensure you
In wsl2 (ubuntu)
```
sudo apt install -y xfce4 xfce4-goodies
#pick lightdm

vi ~/.bashrc
# write these lines at bottom 
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0 >> ~/.bashrc
export LIBGL_ALWAYS_INDIRECT=1
sudo /etc/init.d/dbus start &> /dev/null
# endfile

echo ${USER}' All = (root) NOPASSWD: /etc/init.d/dbus' > /etc/sudoers.d/dbus
source ~/.bashrc
```
If you have any problems with this, ensure "disable access control" is checked in vcxsrv, and check your firewall rules (you may need to google  
  
Save the following config in the installation directory:  
```
<?xml version="1.0" encoding="UTF-8"?>
<XLaunch WindowMode="MultiWindow" ClientMode="NoClient" LocalClient="False" Display="-1" LocalProgram="xcalc" RemoteProgram="xterm" RemotePassword="" PrivateKey="" RemoteHost="" RemoteUser="" XDMCPHost="" XDMCPBroadcast="False" XDMCPIndirect="False" Clipboard="True" ClipboardPrimary="True" ExtraParams="" Wgl="True" DisableAC="True" XDMCPTerminate="False"/>
```
Create a shortcut with the following target (you will need to run this on startup
```"C:\Program Files\VcXsrv\xlaunch.exe" -run config.xlaunch```
