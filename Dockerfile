
FROM nginx:alpine

ARG SERVER_NAME_1=server_name_1
ARG DESTINATION_1=destination_1
ARG SERVER_NAME_2=server_name_2
ARG DESTINATION_2=destination_2

WORKDIR /ssl_certs

COPY localhost.conf ./

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config localhost.conf

RUN mv localhost.crt /etc/ssl/certs/localhost.crt; \
    mv localhost.key /etc/ssl/private/localhost.key;

COPY ./etc/nginx/conf.d/defatult.conf /etc/nginx/conf.d/defatult.conf

RUN sed -i "/#SERVER_NAME_1#/c\ \tserver_name ${SERVER_NAME_1} www.${SERVER_NAME_1};" /etc/nginx/conf.d/default.conf
RUN sed -i "/#DESTINATION_1#/c\ \tserver_name ${DESTINATION_1} www.${DESTINATION_1};" /etc/nginx/conf.d/default.conf

RUN sed -i "/#SERVER_NAME_2#/c\ \tserver_name ${SERVER_NAME_2} www.${SERVER_NAME_2};" /etc/nginx/conf.d/default.conf
RUN sed -i "/#DESTINATION_2#/c\ \tserver_name ${DESTINATION_2} www.${DESTINATION_2};" /etc/nginx/conf.d/default.conf

