# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Install PortAudio and any other required packages
RUN sudo apt-get update && \
    sudo apt-get install -y portaudio19-dev && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file and install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py"]
