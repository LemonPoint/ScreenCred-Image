FROM node:24-alpine
WORKDIR /app
RUN corepack enable && corepack prepare pnpm@latest --activate
COPY package*.json pnpm-*.yaml ./
RUN pnpm install --frozen-lockfile
COPY . ./
RUN npm run build
ENTRYPOINT ["node", "dist/index.js"]
