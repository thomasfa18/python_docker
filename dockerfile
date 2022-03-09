# Use an current node alpine image
FROM python:3.8-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

#include the codebase in the pythonpath (you have to mount this from your host -v)
ENV PYTHONPATH "${PYTHONPATH}:/codebase"

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# entrypoint. mountpoint (-v) for codebase from host must be presented or run will fail
CMD ["python", "/codebase/parse_bot.py"]
