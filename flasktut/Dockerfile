FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#COPY ./*.py ./*.txt ./*.sh .
COPY . .

#CMD [ "python", "./your-daemon-or-script.py" ]

#CMD ["bash"]

CMD [ "gunicorn", "app:app" ]
