FROM node:18-alpine
#RUN corepack enable && corepack prepare pnpm@latest --activate
WORKDIR /app

COPY . /app

ENV HOST 0.0.0.0

EXPOSE 5001
RUN npm install
CMD [ "npm", "run", "dev" ]