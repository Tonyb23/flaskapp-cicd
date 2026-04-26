# Start from the official Python 3.10 base image
FROM python:3.10-slim
# Set the working directory inside the container
WORKDIR /app
# Copy the requirements file first
# (This is done before copying the rest of the code
# so Docker can cache this layer efficiently)
COPY requirements.txt .
# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
# Copy the rest of the application code
COPY . .
# Tell Docker this container listens on port 5000
EXPOSE 5000
# The command to run when the container starts
CMD ["python", "app.py"]