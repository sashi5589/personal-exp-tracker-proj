FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# RUN set -e; \
#         apk add --no-cache --virtual .build-deps \
#                 gcc \
#                 libc-dev \
#                 linux-headers \
#                 mariadb-dev \
#                 python3-dev \
#                 postgresql-dev \
#         ;

RUN apt update -y && \
    apt install -y python3-dev default-libmysqlclient-dev build-essential pkg-config

# Install dependencies
RUN pip install -r requirements.txt

# Expose port 5000 for the Flask app
EXPOSE 5000

# Run the Flask application
CMD ["python", "app.py"]
