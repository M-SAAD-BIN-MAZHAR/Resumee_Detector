# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# If nltk.txt lists NLTK data (e.g., 'punkt'), download them
RUN if [ -f nltk.txt ]; then python -m nltk.downloader -d /usr/share/nltk_data $(cat nltk.txt); fi

# Expose the port your app runs on (change if your App.py uses a different port, e.g., 8000)
EXPOSE 5000

# Command to run your application
CMD ["python", "App.py"]
