# Use an official Selenium base image with Chrome
FROM selenium/standalone-chrome:latest

# Set the working directory to /app
WORKDIR /app

# Copy the entire local directory contents into the container at /app
COPY . /app

# Change the permissions of the /app directory to allow writing
USER root
RUN chmod -R a+w /app

# Install Python and pip
RUN sudo apt-get update && \
    sudo apt-get install -y python3 python3-pip

# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

# Switch back to the selenium user
USER seluser

# Run the tests
CMD ["pytest", "test_login.py"]
