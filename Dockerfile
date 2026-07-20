# Use a hybrid image with Python and Node.js
FROM nikolaik/python-nodejs:python3.10-nodejs18

# Environment
ENV HOME=/home/pn
ENV PATH=$HOME/.local/bin:$PATH

USER 1000

# Root project directory
WORKDIR $HOME/app

# Install Python dependencies
COPY --chown=1000 requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY --chown=1000 . .

# Move to Node application
WORKDIR $HOME/app/satellite-app

# Install Node dependencies
RUN npm install

# Render provides the PORT environment variable
ENV PORT=7860
EXPOSE 7860

# Start application
CMD ["node", "server.js"]