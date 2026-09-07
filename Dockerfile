# 1. Sử dụng một image Python chính thức có sẵn làm nền tảng
FROM python:3.11-slim

# 2. Đặt thư mục làm việc bên trong container là /app
WORKDIR /app

# 3. Copy file danh sách thư viện vào container trước
COPY requirements.txt .

# 4. Chạy lệnh cài đặt các thư viện đó bên trong container
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy toàn bộ code từ máy bạn vào thư mục /app trong container
COPY . .

# 6. Lệnh mặc định sẽ chạy khi container khởi động (ở đây là chạy lint)
CMD ["flake8", "app.py"]
