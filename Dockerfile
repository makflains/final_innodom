FROM python:3.8

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt
RUN python manage.py collectstatic --noinput
RUN python manage.py migrate

EXPOSE 8000

RUN pip install gunicorn

CMD ["gunicorn", "todoapp.wsgi:application", "--bind", "0.0.0.0:8000"]
