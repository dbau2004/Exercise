# Dockerfile (multi-stage not necessary for simple app)
FROM node:20-alpine

WORKDIR /app

# install deps
COPY package.json package-lock.json* ./
RUN npm ci --production

# copy source
COPY . .

ENV PORT=3000
EXPOSE 3000

HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
    CMD [ "node", "-e", "const http=require('http');http.get('http://127.0.0.1:3000/health',res=>{if(res.statusCode!==200) process.exit(1)}).on('error',()=>process.exit(1))" ]

CMD ["node", "index.js"]
