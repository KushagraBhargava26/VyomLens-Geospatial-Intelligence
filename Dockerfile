# 1. Use a hybrid image for Node and Python
FROM nikolaik/python-nodejs:python3.10-nodejs18

# 2. Set up a non-root user (Hugging Face security requirement)
RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# 3. Set the initial working directory to the root
WORKDIR $HOME/app

# 4. Install Python dependencies (since requirements.txt is in the root)
COPY --chown=user requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy your entire project into the container
COPY --chown=user . .

# 6. Change directory into your app folder to install Node dependencies
WORKDIR $HOME/app/satellite-app
RUN npm install

# 7. Expose the required port
EXPOSE 7860

# 8. Start the Node server (we are already inside satellite-app now)
CMD ["node", "server.js"]