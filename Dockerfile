# 1. Use a hybrid image for Node and Python
FROM nikolaik/python-nodejs:python3.10-nodejs18

# 2. Switch to the existing non-root user (ID 1000 is 'pn' in this image)
USER 1000
ENV HOME=/home/pn \
    PATH=/home/pn/.local/bin:$PATH

# 3. Set the initial working directory
WORKDIR $HOME/app

# 4. Install Python dependencies
COPY --chown=1000 requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy your entire project into the container
COPY --chown=1000 . .

# 6. Change directory into your app folder to install Node dependencies
WORKDIR $HOME/app/satellite-app
RUN npm install

# 7. Expose the required port
EXPOSE 7860

# 8. Start the Node server
CMD ["node", "server.js"]