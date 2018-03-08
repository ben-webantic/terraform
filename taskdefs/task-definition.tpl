[
  {
    "name": "api",
    "image": "${amazon_account}.dkr.ecr.eu-west-1.amazonaws.com/${docker_name}:${docker_version}",
    "command": ["forever","--minUptime","5000","--spinSleepTime","500","main.js"],
    "environment": [
      { "name": "oauthKey", "value": "${oauthkey}"},
      { "name": "MONGO_URL", "value": "${mongo_url}"},
      { "name": "PORT", "value": "${port}"},
      { "name": "ROOT_URL", "value": "${root_url}"}
    ],
    "essential": true,
    "hostname": "api",
    "links": [
      "mongo"
    ],
    "memory": 256,
    "portMappings": [
      {
        "containerPort": ${port},
        "hostPort": 0
      }
    ],
    "workingDirectory": "/usr/src/app"
  },
  {
   "name": "mongo",
   "image": "mongo",
   "memory": 256,
   "mountPoints": [
     {
       "sourceVolume": "mongo-data",
       "containerPath": "/data/db"
     }
   ]
  }
]
