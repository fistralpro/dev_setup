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
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart  
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart  
wsl --set-default-version 2


_now_  
  1.  install ubuntu from the store  
  2.  open the ubuntu app  
  3.  set username and password  (password=password)  
  4.  close the ubuntu app  

_from command prompt_  
wsl --set-version Ubuntu 2  

## Install Docker & Docker-compose on Ubuntu  
_Refresh and install packages_  
sudo apt-get update  
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common libssl-dev libffi-dev git wget nano  

_Add user group_  
sudo groupadd docker  
sudo usermod -aG docker ${USER}  

_Add docker key and repo_  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -  
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  
sudo apt-get update  

_Install docker and docker-compose_  
sudo apt-get install -y docker-ce containerd.io docker-compose  

_We need to run dockerd detached from the controlling terminal_  
sudo dockerd </dev/null &>/dev/null &  

## Run any docker container  
_Cliché example_  
sudo docker run hello-world  
