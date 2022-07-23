_This needs splitting into some scripts that include a git clone  
we need to check for items required for installation and then install  
it.  
We need to create an alias to run the dockerd (if not already running)  
Then we need to create a selection of curated docker containers for use  
as part of a standardised environment.  Resources should include:  
  TOMCAT  
  NGINX  
  DATABASE/s  
  RABBITMQ  
With interconnects between them and a local drive shared across windows-wsl2 and the  
container.
We also need to have the GIT credentials available to wsl2 for cloning._  


## Activate wsl2  
_From command prompt_  
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart  
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart  
wsl --set-default-version 2
```

_now_  
  1.  install ubuntu from the store  
  2.  open the ubuntu app  
  3.  set username and password  (e.g. fistralpro fistralpro)  
  4.  close the ubuntu app  

_from command prompt_  
`wsl --set-version Ubuntu 2`  

## Install Docker & Docker-compose on Ubuntu  
**We won't use the convenience script from get.docker.com so we can understand what is going on.**  
_Refresh and install packages_  
```
sudo apt-get update  
sudo apt-get install -y ca-certificates curl gnupg lsb-release  
```
**What am I installing?**  
https://packages.debian.org/bullseye/ca-certificates: Contains the certificate authorities shipped with Mozilla's browser to allow SSL-based applications to check for the authenticity of SSL connections.  
https://packages.debian.org/bullseye/curl: A command line tool for transferring data with URL syntax, supporting DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET and TFTP.  
https://packages.debian.org/bullseye/GnuPG:  GNU's tool for secure communication and data storage. It can be used to encrypt data and to create digital signatures. It includes an advanced key management facility and is compliant with the proposed OpenPGP Internet standard as described in RFC4880.  
https://packages.debian.org/bullseye/lsb-release:  A simple tool to help identify the Linux distribution being used and its compliance with the Linux Standard Base. LSB conformance will not be reported unless the required metapackages are installed.  

_Add Docker official Key and setup repository_  
```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

_Install docker_  
`sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin`  


_Add user group_  
```
sudo groupadd docker  
sudo usermod -aG docker ${USER}  
```

_Install versioned docker-compose_  
`sudo curl -L "https://github.com/docker/compose/releases/download/v2.1.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`

_We need to run dockerd detached from the controlling terminal_  
`sudo dockerd </dev/null &>/dev/null &`  


## Run any docker container  
_Cliché example_  
`sudo docker run hello-world`


