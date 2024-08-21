FROM alpine:3.15

ENV TERM=xterm \
    USER_UID=1000 \
    USER_NAME=dfx \
    USER_HOME=/home/dfx

# Thêm kho lưu trữ community, cài đặt các phụ thuộc và dọn dẹp
RUN echo '@community http://nl.alpinelinux.org/alpine/v3.15/community' >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk add --no-cache \
        git \
        nodejs-current@community \
        npm@community && \
    adduser -D -u $USER_UID $USER_NAME && \
    npm install -g vercel && \
    # Dọn dẹp các tập tin không cần thiết
    rm -rf /var/cache/apk/* /root/.npm

# Thiết lập thư mục làm việc
WORKDIR /srv

# Lệnh mặc định
CMD ["nodejs"]