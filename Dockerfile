FROM ubuntu:22.04
RUN apt update && apt install python3 -y
COPY app.py /tmp
EXPOSE 8080
CMD [ "python3" , "/tmp/app.py" ]
