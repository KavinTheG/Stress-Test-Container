# Stress-Test-Container

The purpose of this repository is to allow users to run a stress-test script in an isolated docker container. This is an interactive script, meaning users will be prompted for the desired amount of cores, memory to be stressed. 

### Installation
```
git clone https://github.com/KavinTheG/Stress-Test-Container.git
cd Stress-Test-Container
docker build -t repo_name/stresstest .
```
## Usage

### Running the Container
The script is interactive, so the docker container must be executed with the -it addon.
```
docker run -it repo_name/stresstest
```

![image](https://user-images.githubusercontent.com/25258108/186496422-80758e2a-85d4-47a2-9b5d-8f2f0b29b7bb.png)

As shown above, the container will prompt user for the numbers of cores, and amount of memory to stress, as well how long to run the script. 

Note: the second line prompts for the number of processes. Each process will stress 256mb of ram. For example, in order stress near to 1gb of ram, users should enter 4 for the number of processes. 

### Reference

## Stress Repository
Utilized the repository from the link in the script to stress test the machine. This repository was because alpine (the base OS used for this container) does not seem to have a stress package.  
https://github.com/resurrecting-open-source-projects/stress
