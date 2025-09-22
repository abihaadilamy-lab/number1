FROM ubuntu:20.04

# تثبيت الأدوات اللازمة لبناء C++
RUN apt-get update && apt-get install -y \
    g++ \
    make \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# تحديد مجلد العمل داخل الحاوية
WORKDIR /usr/src/app

# نسخ جميع الملفات من جهازك إلى الحاوية
COPY . .

# بناء البرنامج باستخدام g++ مع الاسم الصحيح للملف
RUN g++ -o my_program number.cpp

# تشغيل البرنامج عند بدء الحاوية
CMD ["./my_program"]

