# Use Nginx as the base image
FROM nginx:alpine

# Remove default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML files into container
COPY ./html/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx (already default in base image)
CMD ["nginx", "-g", "daemon off;"]
