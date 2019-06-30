FROM node:8.4.0

# Install `serve`.
RUN npm install -g serve

# Install all dependencies of the current project.
COPY package.json package.json
RUN npm install

# Copy all local files into the image.
COPY . .

# Build for production.
RUN npm run build

# serve static files in dist folder
CMD serve -p $PORT -s dist