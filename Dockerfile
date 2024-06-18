# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install required packages
RUN apt update -y && pkg install curl proot tar -y && curl https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu20/ubuntu20.sh | bash && touch vscode.sh && echo "#! /usr/bin/bash" > vscode.sh && echo "./start-ubuntu20.sh<<echo./code-server-3.8.1-linux-arm64/bin/code-server">> vscode.sh && echo "./code-server-3.8.1-linux-arm64/bin/code-server">> vscode.sh && chmod ugo+x vscode.sh && touch vscode-install.sh && echo "apt update -y && apt upgrade -y && apt install wget -y && wget https://github.com/cdr/code-server/releases/download/v3.8.1/code-server-3.8.1-linux-arm64.tar.gz && tar -xvf code-server-3.8.1-linux-arm64.tar.gz && rm code-server-3.8.1-linux-arm64.tar.gz && mkdir ~/.config && cd .config && mkdir code-server && cd && touch ~/.config/code-server/config.yaml && echo "bind-addr: 127.0.0.1:8080" > ~/.config/code-server/config.yaml && echo "auth: password" >> ~/.config/code-server/config.yaml && echo "password: 1" >> ~/.config/code-server/config.yaml && echo "cert: false" >> ~/.config/code-server/config.yaml">vscode-install.sh && chmod ugo+x vscode-install.sh && ./start-ubuntu20.sh<vscode-install.sh && rm ./vscode-install.sh && echo "Vscode mounted and loaded. You can start it using ./vscode.sh command (or you can type ./v and press tab)"

# Set the working directory
WORKDIR /app

# Install JupyterLab
RUN pip3 install jupyterlab

# Expose port 8080
EXPOSE 8080

# Start JupyterLab on port 8080 without authentication
CMD ["code-server", "--ip=0.0.0.0", "--port=8080", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
