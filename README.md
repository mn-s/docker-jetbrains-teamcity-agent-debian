# Docker JetBrains TeamCity Agent
## Description
<a href="https://www.jetbrains.com/teamcity/">TeamCity Agent</a> > Docker

## Build manual

    docker build -t jetbrains-teamcity-agent-debian https://github.com/schnack/docker-jetbrains-teamcity-agent-debian.git
    docker create --restart=always --name jb-tc-agent  -p 9090:9090 jetbrains-teamcity-agent
    docker start jb-tc-agent
    
## Pull out Docker Hub
    
    docker pull schnack/jetbrains-teamcity-agent-debian
    docker create --restart=always --name jb-tc-agent -p 9090:9090 schnack/jetbrains-teamcity-agent-debian
    docker start jb-tc-agent
or
    
    docker run -d --restart=always --name jb-tc-agent -p 9090:9090 schnack/jetbrains-teamcity-agent-debian
