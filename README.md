# PythonBot_docker
Setting up containers to be able to test features faster

## Requirements
1. Having a PythonBot repo cloned (https://github.com/DeJonge00/PythonBot)
2. Clone this repo and move the files in the same directory you cloned PythonBot in.
Example: 
    - mkdir biri
    - git clone git@github.com:DeJonge00/PythonBot.git
    - git clone git@github.com:Arnoways/PythonBot_docker.git
    - mv PythonBot_docker/docker-compose.yml .
    - mv PythonBot_docker/Dockerfile .
3. Verify PythonBot/requirements.txt is present.
4. Having the font folder in the same directory you cloned this repo in.
5. Having docker and docker-compose installed.

## How-To:

####Start the containers
If you just cloned the PythonBot repo, you need to have a secret folder containing "secrets.py" (PythonBot/secret/secrets.py).
I'd recommend setting the environment variables in docker-compose.yml so you can acces them in secrets.py.
Example:
```python
import os

bot_token = os.environ['DISCORD_TOKEN']
DBAddress = os.environ['MONGO_DB']
DBPassword = os.environ['MONGO_PASSWORD']
DBPort = os.environ['MONGO_PORT']
DBName = os.environ['MONGO_USERNAME']
prefix = 'your_prefix'
root_path = './'
font_path = root_path + '../../ringbearer/RINGM___.TTF'
image_folders_path = root_path
osu_api_key = os.environ['OSU_KEY']
```
You can then start the whole thing by using 'docker-compose up'

###Access the application logs
```
docker-compose logs <service name>
```
(add the -f flag after 'logs' to follow the app's output)
e.g: docker-compose logs -f biribiri

###Restore production data into the mongodb container
  1. backup production data: mongodump --username xxx --password xxx --archive > mongo.dump
  2. copy mongo.dump locally
  3. restore backup in mongo container: docker exec -i <container> sh -c 'mongorestore --username xxx --password xxx --archive' < mongo.dump
  *find out container's id: docker-compose ps*

###Test the code you just modified
The PythonBot folder is mounted as a volume directly in the container, so the code is the same. Howerver you might have to restart the application in order to see your modification.