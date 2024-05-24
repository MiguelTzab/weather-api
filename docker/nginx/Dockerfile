FROM nginx:latest

COPY docker/nginx/conf.d/application.template /etc/nginx/conf.d/reverse-proxy.conf

EXPOSE 81

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]