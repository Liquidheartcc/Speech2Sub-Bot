FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install ffmpeg
RUN apt-get install -y ffmpeg


# Copy the necessary files to the working directory
COPY requirements.txt /requirements.txt
COPY bot.py /bot.py
COPY display_progress.py /display_progress.py
COPY featureExtraction.py /featureExtraction.py
COPY writeToFile.py /writeToFile.py
COPY trainAudio.py /trainAudio.py
COPY segmentAudio.py /segmentAudio.py

# Install Python dependencies
RUN apt-get install -y python3 python3-pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Set the entrypoint command
CMD ["python3", "bot.py"]
