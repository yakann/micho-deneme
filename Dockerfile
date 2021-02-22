# pull official base image
FROM python:3.8

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip setuptools

# create user for the Django project
RUN useradd -ms /bin/bash michopython

# set current user
USER michopython

# set work directory
WORKDIR /home/michopython

# create and activate virtual environment
#RUN python3 -m venv env 
# RUN source ./env/bin/activate
# copy and install pip requirements(Buraya uzantıyı gir)
COPY --chown=michopython ./requirements/requ/ /home/michopython/
RUN pip3 install -r /home/michopython/production.txt

# copy Django project files
COPY --chown=michopython ./src/eserp/django /home/michopython/
WORKDIR /home/michopython/erp
#CMD ["/home/michopython/env/bin/gunicorn" "--bind" "0.0.0.0:8000" "ERP.wsgi:application"]