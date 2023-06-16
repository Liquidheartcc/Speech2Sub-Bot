FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install ffmpeg
RUN apt-get install -y ffmpeg

# Set the working directory
WORKDIR /app

# Copy the necessary files to the working directory
COPY requirements.txt .
COPY bot.py .

# Install Python dependencies
RUN apt-get install -y python3 python3-pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Set the entrypoint command
CMD ["python3", "bot.py"]
