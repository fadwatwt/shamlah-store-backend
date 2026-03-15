FROM ghcr.io/saleor/saleor:3.19.0

# لضمان ظهور السجلات (Logs) فوراً
ENV PYTHONUNBUFFERED=1

# البورت الافتراضي (اختياري لأن Render يستخدم $PORT)
EXPOSE 8000

# أمر واحد فقط يجمع بين الـ Migrate والتشغيل
# استخدمنا python -m gunicorn لضمان العثور على المكتبة
CMD sh -c "python manage.py migrate --noinput && python -m gunicorn saleor.wsgi:application --bind 0.0.0.0:$PORT --workers 1 --threads 2 --timeout 120"
