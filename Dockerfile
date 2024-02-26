FROM python:3.8

# Create the directories for volumes
# USER root
# RUN mkdir -p /flask

# Define volume for data
VOLUME flask

#Set the working directory
WORKDIR /

#copy all the files
COPY . .

#Install the dependencies
# RUN apt-get update
# RUN apt-get update && apt-get install -y python3 python3-pip
RUN apt-get update -y && apt-get install build-essential cmake pkg-config -y && apt-get install ffmpeg libsm6 libxext6  -y
RUN pip install dlib==19.9.0 && pip install opencv-python
# RUN pip install dlib==19.8.2
# RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip3 install -r requirements.txt

#Expose the required port
EXPOSE 5000

#Run the command
CMD gunicorn main:app

# RUN apt-get update -y && \
#     apt-get install build-essential cmake pkg-config -y

# RUN pip install dlib==19.9.0