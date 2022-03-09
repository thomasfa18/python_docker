# Use an current node alpine image
FROM python:3.8-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

#updatepythonpath
ENV PYTHONPATH="/codebase"

# entrypoint. mountpoint (-v) for codebase from host must be presented or run will fail
CMD ["python", "/codebase/parse_bot.py"]
