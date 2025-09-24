# Dockerfile
FROM python:3.12-slim

# Không tạo .pyc, xuất log không buffer
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Cài deps Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source
COPY . .

# Mặc định dùng 8000 với Gunicorn
EXPOSE 8000

# Healthcheck KHÔNG cần curl/wget (dùng Python stdlib)
# Nhớ đảm bảo app có endpoint /health trả về 200
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD python -c "import sys,urllib.request; \
    sys.exit(0) if urllib.request.urlopen('http://127.0.0.1:8000/health', timeout=3).getcode()==200 else sys.exit(1)"

# Chạy Flask app qua Gunicorn (file app.py, biến app)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
