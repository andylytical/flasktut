FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV APPDIR=/app

COPY requirements.txt ${APPDIR}/
RUN pip install --no-cache-dir -r ${APPDIR}/requirements.txt

#COPY ./*.py ./*.txt ./*.sh .
COPY . ${APPDIR}/

#CMD [ "python", "./your-daemon-or-script.py" ]

#CMD ["bash"]

WORKDIR ${APPDIR}
CMD [ "gunicorn", "app:app" ]
