# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    wget

# Set the working directory
WORKDIR /app

# Install JupyterLab
RUN wget https://github.com/coder/code-server/releases/download/v4.90.2/code-server-4.90.2-linux-arm64.tar.gz

RUN tar -xvf code-server-4.90.2-linux-arm64.tar.gz

RUN ls

RUN cd code-server-4.90.2-linux-arm64

RUN ls

RUN cd bin

RUN export PASSWORD="waluka"

RUN ./code-server


# Expose port 8080
EXPOSE 8080

# Start JupyterLab on port 8080 without authentication
CMD ["./code-server", "--ip=0.0.0.0", "--port=8080", "--no-browser", "--allow-root"]
