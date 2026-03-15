FROM ghcr.io/saleor/saleor:3.19.0

ENV PYTHONUNBUFFERED=1

EXPOSE 8000

CMD python -m gunicorn saleor.wsgi:application --bind 0.0.0.0:$PORT --workers 1 --threads 2 --timeout 120
