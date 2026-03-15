# استخدام النسخة التي حددتها
FROM saleor/saleor:3.22

# إعداد متغيرات البيئة لضمان عدم توقف بايثون عند الطباعة
ENV PYTHONUNBUFFERED=1

# (اختياري) إذا كنت تريد تشغيل المهام تلقائياً عند بدء التشغيل
# سنستخدم صيغة تشغيل تنفذ الهجرة ثم تبدأ السيرفر
CMD python manage.py migrate --noinput && \
    gunicorn saleor.wsgi:application --bind 0.0.0.0:$PORT --workers 1 --threads 2 --timeout 120
