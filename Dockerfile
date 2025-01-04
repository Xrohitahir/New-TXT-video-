FROM python:3.9.6-alpine3.14

WORKDIR /app

# Copy project files
COPY . .

# Install dependencies including yt-dlp
RUN apk add --no-cache gcc libffi-dev musl-dev ffmpeg aria2 && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir -U yt-dlp

# Start the application
CMD gunicorn app:app & python3 main.py
