# Build stage
FROM node:alpine as builder
WORKDIR 'usr/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Run stage
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
