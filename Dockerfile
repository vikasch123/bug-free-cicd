# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy all necessary files
COPY requirements.txt requirements.txt
COPY app.py app.py
COPY templates/ templates/   
# COPY static/ static/  # If you have static files like CSS/JS

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Flask runs on
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]
