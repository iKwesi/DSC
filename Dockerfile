FROM continuumio/miniconda:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install nginx uwsgi -y
RUN rm /etc/nginx/conf.d/default.conf || true
RUN apt-get update && apt-get install -y supervisor \
&& rm -rf /var/lib/apt/lists/*

COPY environment.yml /environment.yml
RUN conda env update -f environment.yml -n base

COPY cfg/supervisord-debian.conf /etc/supervisor/conf.d/supervisord.conf
COPY scripts/* /

RUN chmod +x /*.sh

COPY ./src /src
COPY ./static /static
COPY ./templates /templates

COPY app.py /app.py
COPY uwsgi.ini /etc/uwsgi/

EXPOSE 80
EXPOSE 443

ENV FLASK_APP app.py
ENV UWSGI_INI /app/uwsgi.ini

ENV STATIC_URL /static
ENV STATIC_PATH /static
ENV LISTEN_PORT 80

#ENTRYPOINT ["/entrypoint.sh"]

#CMD [ "/start.sh" ]

CMD [ "python", "app.py" ]