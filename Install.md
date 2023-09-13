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
We also need to have the GIT credentials available to wsl2 for cloning  
Dev setup between Mac, Windows and Linux will differ -> but the docker-compose  
environments should just work._  


## Activate wsl2  
_From command prompt_  
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart  
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart  
wsl --set-default-version 2
```

_now_  
  1.  install ubuntu from the store (pick a versioned one e.g.20.04.5 LTS)
  2.  open the ubuntu app  
  3.  set username and password  (e.g. fistralpro fistralpro)  
  4.  close the ubuntu app  

_from command prompt_  
`wsl --set-version Ubuntu 2`  


## share windows SSL config  
You can setup ssl in linux, or just copy your existing windows setup over.   Ubuntu comes with ssh pre-installed  
```
cp -r /mnt/c/Users/fistr/.ssh ~/.ssh
chmod 600 ~/.ssh/id_rsa
```

## share git config  
You can setup git in linux, or just copy your existing windows setup over.  Ubuntu comes with git pre-installed     
```
cp -r /mnt/c/Users/fistr/.gitconfig ~/.gitconfig 
chmod 600 ~/.gitconfig
```

## unblock firewall for intellij
I was unable to get online examples to work, so instead I manually added idea64.ex the rules via windows defender firewall with active security  
!Warning! Every intellij update changes the path so until you add the new update through the rules... it breaks.  
![intellij firewall rules](https://github.com/fistralpro/dev_setup/blob/ed1df6645c137c914b96306e837b3cc0446532ba/firewall%20rules%20for%20intellij.png?raw=true)

## remove folders from windows defender scan 
Performance is terrible while defender scans so I added the following folders to the exclusion list    
!Warning! Every intellij update changes the path so until you add the new update through the rules... it breaks.  
![intellij windows defender rules](https://github.com/fistralpro/dev_setup/blob/main/folder_exclusions.png?raw=true)

## Optional
In the scripts folder there are setup scripts for things like docker and java  

## optional install java 8 on ubuntu
java 8  
```
sudo apt install openjdk-8-jre-headless -y
sudo apt-get install openjdk-8-jdk -y
java -version
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
```
Note there is a script for sdkman for more convenient Java installation ./scripts/sdkman.sh  