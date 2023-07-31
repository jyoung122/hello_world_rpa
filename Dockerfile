# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir robotframework rpaframework

# Download rcc
RUN apt-get update && apt-get install -y curl
RUN curl -o rcc https://downloads.robocorp.com/rcc/releases/latest/linux64/rcc

# Make the downloaded file executable
RUN chmod a+x rcc

# Add rcc to path
RUN mv rcc /usr/local/bin/

# Set the PATH explicitly to include /usr/local/bin/
ENV PATH="/usr/local/bin/:${PATH}"

# Run helloworld.robot when the container launches
CMD ["rcc", "run"]
