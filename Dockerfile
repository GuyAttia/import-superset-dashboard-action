# Container image that runs your code
FROM python:3.9.13

COPY requirements.txt /
RUN /usr/local/bin/python -m pip install --upgrade pip && \
  pip install --no-cache-dir -r /requirements.txt

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY import_dashboard.py /import_dashboard.py

# Code file to execute when the docker container starts up
ENTRYPOINT ["python", "/import_dashboard.py"]