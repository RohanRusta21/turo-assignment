FROM nginx

COPY index.html /usr/share/nginx/html/
COPY page1.html /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
