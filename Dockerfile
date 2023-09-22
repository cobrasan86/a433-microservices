#Menggunakan image node:14 atau dengan node tag 14
FROM node:14

#Menetapkan Working Directory ke folder /app
WORKDIR /app

#Melakukan Copy working directory lokal ke working directory container
COPY . .

#Menerapakan aplikasi kedalam mode production dan menggunakan container yang bernama item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

#Menginstall dependencies yang dibutuhkan production kemudian aplikasi tersebut di build
RUN npm install --production --unsafe-perm && npm run build

#Menetapkan port ekspos ke port 8080
EXPOSE 8080

#Menjalankan perintah npm start
CMD ["npm", "start"]