FROM debian:stretch-slim


RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip opus-tools libav-tools && \
    pip3 install requests && \
    apt-get autoremove -y && apt-get clean && apt-get autoclean && \
    mkdir /biri/


COPY ringbearer /biri/ringbearer
COPY PythonBot /biri/PythonBot

RUN pip3 install -r /biri/PythonBot/requirements.txt

WORKDIR /biri/PythonBot/PythonBot

# -u is for logging purpose
ENTRYPOINT ["python3", "-u", "PythonBot.py"]    