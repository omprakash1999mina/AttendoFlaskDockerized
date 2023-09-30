FROM python:3.8

#Set the working directory
WORKDIR /

#copy all the files
COPY . .

#Install the dependencies
# RUN apt-get update
RUN apt-get update && apt-get install -y python3 python3-pip
# RUN pip3 install cmake
RUN apt-get install build-essential cmake pkg-config -y
RUN pip install dlib==19.9.0
# RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip3 install -r requirements.txt

#Expose the required port
EXPOSE 5000

#Run the command
CMD gunicorn main:app




# RUN apt-get update -y && \
#     apt-get install build-essential cmake pkg-config -y

# RUN pip install dlib==19.9.0