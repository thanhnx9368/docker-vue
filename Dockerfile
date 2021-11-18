#STEP 1: Build Vue Project

FROM node:12.18.1-alpine AS build-stage
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

#STEP 2: Create NGINX Server
FROM nginx:1.19.0-alpine AS build-prod
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]