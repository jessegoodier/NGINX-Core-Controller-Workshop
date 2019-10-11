# Ergast nodeJS API
In this period we are working to improve the server, specifically we want to make it faster in response times. 
After analyzing our current architecture we realized that using PHP is not the best and therefore we are moving to nodeJS. 
If you have any advice on how to improve the javascript code we are happy to hear your proposal.
The current repository to find these files and how to install the server is located [`in this repository`](https://github.com/Edivad99/NJS-ErgastF1API)

# ergast Local API Server

Based on the [`ergast-f1-api`](https://github.com/jcnewell/ergast-f1-api), a PHP-based API using the [Ergast Formula One MySQL database](http://ergast.com/mrd/) developed by Chris Newell.

## Instructions for Use Using Docker Compose

- install docker
- download and unzip the contents repository 
- cd into the root folder and run: `docker-compose up --build -d --remove-orphans`
- give everything a minute or to to come up and then test the API at: `http://localhost:8001/api/f1/2017.json`


