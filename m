Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5784081njd;
        Sun, 27 Apr 2025 23:42:10 -0700 (PDT)
X-Received: by 2002:a17:903:2b10:b0:22d:b240:34fe with SMTP id d9443c01a7336-22dbf5f6c2amr160377145ad.25.1745822530745;
        Sun, 27 Apr 2025 23:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822530; cv=none;
        d=google.com; s=arc-20240605;
        b=jBDD4ZpHrGsDGuPVizAbAmBqjiLcM8DYJuDiUyki8pPN3DRWbcjh1WfHB6XJNapDRS
         142pK05qWqfPjIQRQjf6kChFANGoSD5ATMLjUQD7s70Kp9iu/v+g9ACPN3SicE1EMmh7
         xWoJTkxzT4INsgPCnwo7H9NRWGRyi8jy+rqI28jAJSHIn9uy5OH+Zg7ueiYwuL47agbg
         5ksMeTCbKu5H5XNsnEzXef41UJ5t7so3xVkij1fsm51VJs9pwpkQdx5Aell5MHLfYsrd
         WqA8MxiP6RKnKQx6jeYTVevbWKkRcxogAvB9K143iiYy3Ca00unCY8bH2Xv2GnauQQ9b
         2kMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HPP2G+ypt7YrX8hzAUA27wm3oJ/maSzQ00zwDCJ8YQQ=;
        fh=CIHDnq7on9oBzyefHWpQz8IRbkavAcCv8Kq98TBInBQ=;
        b=YZJ+DAiugQPHzgM5VfQmzeIU5IdJCAkE0c7AHcoX2G8yUbDcwPYOQ+7CzrRHm8/nLH
         zBTyuitRPXNOESFyriQ3iHdGK2E6/NXu4SWVH4ToXQRmSJCY4TngEVDyQl8ZduCVB+SK
         wyJhvfcUY0Vd63UAZhO63Qd55aMdmrLcTXDoC96A8qj5m9caeSlsBx/+lQ/mnDbpWN6U
         bHqV2Q/JkvpE3RTZNryfLUb/TDC73lheMEIy5jU3IKuc/a+jXlQYkDHfE24ArH1QDXvB
         TiIR+3peTXGmuuw6S/daUsl4P5ZpWG26UPJhtj0SyxLXfVL8FRKV1kA7Dl1ba8Pu4nYz
         khiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QJAQhUyo;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4d6e05dsor56963235ad.4.2025.04.27.23.42.10
        (Google Transport Security);
        Sun, 27 Apr 2025 23:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QJAQhUyo;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822530; x=1746427330; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPP2G+ypt7YrX8hzAUA27wm3oJ/maSzQ00zwDCJ8YQQ=;
        b=QJAQhUyo6ybEYM3zaUf0GBjt4PstE5lzts7rA5SqsxCsx+bmktSjyeRuT1TCKTQcS7
         MM5QFpP2A+8aIBSX5CALGCsQa2SrNpDSWprMLOLOwxlIkv2LAT5gAJAjlqr3GsZVO6Mq
         +TfTFjfmq4/8Wq/PJ1sLzbiicy5iWXJApPqAWWfx7TA7Ico91G+7mf7pViuz2oXXMJu0
         gHMAJSiAJrYtkS4UnGr49f2gPFcklc8JJxn6fbFECAcwEQjwTdmYcyWEubmwvEy5vZoL
         nsTGQVfnvPcNqmP7D2x8SRh50s/RPj6Lujwv/nhMZY53qX4Gb5wH4H6nItXbNd6eQfYB
         b0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822530; x=1746427330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPP2G+ypt7YrX8hzAUA27wm3oJ/maSzQ00zwDCJ8YQQ=;
        b=ncoQvXMA4U/CQsOdYTSAnggYN1BAWEt7lti9jUOdsA0u8gJX84Ul4TVKgH/sJxu8Vr
         1e4EDqPn6/9m364YZR8gB6lPoqDaAttKkyaWmdtle1vjHKNwR08nH+X0xDGmh0MnavlU
         Dp6tGYZimgJjckY22ThMajcHgdvj9opryDYJrnB5k5gUmVUqVr+xguJOt2Ynw38PltaZ
         d6I6gTrNmp+QbvX6UV2E+PCAE8XWshmi6zx0O0WBTauwaQ9cqPu+C28bD4dZNPfeYpRx
         bRDvPdpiD+A7A+ac6zrGpsFT8335UsXdlFZo3deu9gzf87xJmny0wb/juid4TAfwORia
         rOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC9RvpkSFnLCUZsZ4OOWK6EVVuUuFRrpSP+PybQWiDuCwmEp630j7nfQh9hahgbCmfrvriyHGVeJakg5Q2@linaro.org, AJvYcCWSY/DNzI2LVOBinSZF2378O7DodKKiXUdvJSZA6kC6pVb5iJyyKm5XdOC0oR/T48ftP5R1P2sz@linaro.org, AJvYcCXp1cR6KVrmJu/ISkUAcBcF04SvZ9hMyQbh6iXXdne4OnSWe1bkMTiSpinE+qOazPOmukutbSfKt6qPEnaQ7ZOmFA==@linaro.org, AJvYcCXsoPV1NWGacAnY77R8eOf+dzxwEMq2NXcE7OZtznQfZFvf8E9bhr8flQO3CpWJpwtjafl/axj1R+xObZlxvvfELcA=@linaro.org
X-Gm-Message-State: AOJu0YwWxIwSKpy9LQ6SDrEcMsRb+uOkluKNB3nz3/LbS+vYMTmD8Zbq
	1TUOSIOhhaUWKFspqLlVrqRB4p/2yQXvVOMWKoomdwhf/fYgHA3d
X-Gm-Gg: ASbGncsBsZdd39NzW1fMmSv++WAPN+yBYH1fX9KdFtua8LZ9A+Wcd+REgnkMRlCzoeq
	9aufgu6Lw7yyMzIgbcy5WAZljrCZ7KTTHe7nNoESXqp0w716d0GIogm+3aqz5/aHzjEiBfDz0xY
	YU0x5IDVZ/m0hXcpnpbkQcy6FxhBT74ocnYN1Zh9hA+fKy9pPLdMr34b45XMTvhauuJJrG6o9Fa
	2uuC/S8PeHjbryODgsV2QD+v+u7QqMKgpleMoPcclkXm3S/QUo8D/VRc+ynNxI3AO4OjzJs56fN
	qDomD2O0N+fR+oD4qzXbT5Jr/eWdpiVVI8HAqA==
X-Google-Smtp-Source: AGHT+IHRWN3JsCNfDZHbW955JRTfqsVw/h+K8xx0iThNgk+AM0ZZghQ0w1nuOaVl0h4f5oB7XeLWzw==
X-Received: by 2002:a17:903:320b:b0:225:abd2:5e39 with SMTP id d9443c01a7336-22dbf5f8179mr156498775ad.30.1745822530085;
        Sun, 27 Apr 2025 23:42:10 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:42:09 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 19/20] tests: Add Dockerfile containing dependencies for Emscripten build
Date: Mon, 28 Apr 2025 15:39:08 +0900
Message-ID: <8bed6e9d46ef09328a87320928b5dec575d1e435.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /JypI/OmcIEb

The added Dockerfile is based on the emsdk image, which includes the
Emscripten toolchain. It also cross-compiles the necessary dependencies
(glib, libffi, pixman, and zlib) for the Emscripten target environment.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS                                   |   1 +
 .../dockerfiles/emsdk-wasm32-cross.docker     | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 tests/docker/dockerfiles/emsdk-wasm32-cross.docker

diff --git a/MAINTAINERS b/MAINTAINERS
index dd5a97ac36..2c5417b7e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -635,6 +635,7 @@ F: include/system/os-wasm.h
 F: os-wasm.c
 F: util/coroutine-wasm.c
 F: configs/meson/emscripten.txt
+F: tests/docker/dockerfiles/emsdk-wasm32-cross.docker
 
 Alpha Machines
 --------------
diff --git a/tests/docker/dockerfiles/emsdk-wasm32-cross.docker b/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
new file mode 100644
index 0000000000..60a7d02f56
--- /dev/null
+++ b/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
@@ -0,0 +1,145 @@
+# syntax = docker/dockerfile:1.5
+
+ARG EMSDK_VERSION_QEMU=3.1.50
+ARG ZLIB_VERSION=1.3.1
+ARG GLIB_MINOR_VERSION=2.84
+ARG GLIB_VERSION=${GLIB_MINOR_VERSION}.0
+ARG PIXMAN_VERSION=0.44.2
+ARG FFI_VERSION=v3.4.7
+ARG MESON_VERSION=1.5.0
+
+FROM emscripten/emsdk:$EMSDK_VERSION_QEMU AS build-base
+ARG MESON_VERSION
+ENV TARGET=/builddeps/target
+ENV CPATH="$TARGET/include"
+ENV PKG_CONFIG_PATH="$TARGET/lib/pkgconfig"
+ENV EM_PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
+ENV CFLAGS="-O3 -pthread -DWASM_BIGINT"
+ENV CXXFLAGS="$CFLAGS"
+ENV LDFLAGS="-sWASM_BIGINT -sASYNCIFY=1 -L$TARGET/lib"
+RUN apt-get update && apt-get install -y \
+    autoconf \
+    build-essential \
+    libglib2.0-dev \
+    libtool \
+    pkgconf \
+    ninja-build \
+    python3-pip
+RUN pip3 install meson==${MESON_VERSION} tomli
+RUN mkdir /build
+WORKDIR /build
+RUN mkdir -p $TARGET
+RUN <<EOF
+cat <<EOT > /cross.meson
+[host_machine]
+system = 'emscripten'
+cpu_family = 'wasm32'
+cpu = 'wasm32'
+endian = 'little'
+
+[binaries]
+c = 'emcc'
+cpp = 'em++'
+ar = 'emar'
+ranlib = 'emranlib'
+pkgconfig = ['pkg-config', '--static']
+EOT
+EOF
+
+FROM build-base AS zlib-dev
+ARG ZLIB_VERSION
+RUN mkdir -p /zlib
+RUN curl -Ls https://zlib.net/zlib-$ZLIB_VERSION.tar.xz | \
+    tar xJC /zlib --strip-components=1
+WORKDIR /zlib
+RUN emconfigure ./configure --prefix=$TARGET --static
+RUN emmake make install -j$(nproc)
+
+FROM build-base AS libffi-dev
+ARG FFI_VERSION
+RUN mkdir -p /libffi
+RUN git clone https://github.com/libffi/libffi /libffi
+WORKDIR /libffi
+RUN git checkout $FFI_VERSION
+RUN autoreconf -fiv
+RUN emconfigure ./configure --host=wasm32-unknown-linux \
+    --prefix=$TARGET --enable-static \
+    --disable-shared --disable-dependency-tracking \
+    --disable-builddir --disable-multi-os-directory \
+    --disable-raw-api --disable-docs
+RUN emmake make install SUBDIRS='include' -j$(nproc)
+
+FROM build-base AS pixman-dev
+ARG PIXMAN_VERSION
+RUN mkdir /pixman/
+RUN git clone  https://gitlab.freedesktop.org/pixman/pixman /pixman/
+WORKDIR /pixman
+RUN git checkout pixman-$PIXMAN_VERSION
+RUN <<EOF
+cat <<EOT >> /cross.meson
+[built-in options]
+c_args = [$(printf "'%s', " $CFLAGS | sed 's/, $//')]
+cpp_args = [$(printf "'%s', " $CFLAGS | sed 's/, $//')]
+objc_args = [$(printf "'%s', " $CFLAGS | sed 's/, $//')]
+c_link_args = [$(printf "'%s', " $LDFLAGS | sed 's/, $//')]
+cpp_link_args = [$(printf "'%s', " $LDFLAGS | sed 's/, $//')]
+EOT
+EOF
+RUN meson setup _build --prefix=$TARGET --cross-file=/cross.meson \
+    --default-library=static \
+    --buildtype=release -Dtests=disabled -Ddemos=disabled
+RUN meson install -C _build
+
+FROM build-base AS glib-dev
+ARG GLIB_VERSION
+ARG GLIB_MINOR_VERSION
+RUN mkdir -p /stub
+WORKDIR /stub
+RUN <<EOF
+cat <<'EOT' > res_query.c
+#include <netdb.h>
+int res_query(const char *name, int class,
+              int type, unsigned char *dest, int len)
+{
+    h_errno = HOST_NOT_FOUND;
+    return -1;
+}
+EOT
+EOF
+RUN emcc ${CFLAGS} -c res_query.c -fPIC -o libresolv.o
+RUN ar rcs libresolv.a libresolv.o
+RUN mkdir -p $TARGET/lib/
+RUN cp libresolv.a $TARGET/lib/
+
+RUN mkdir -p /glib
+RUN curl -Lks https://download.gnome.org/sources/glib/${GLIB_MINOR_VERSION}/glib-$GLIB_VERSION.tar.xz | \
+    tar xJC /glib --strip-components=1
+
+COPY --link --from=zlib-dev /builddeps/ /builddeps/
+COPY --link --from=libffi-dev /builddeps/ /builddeps/
+
+WORKDIR /glib
+RUN <<EOF
+CFLAGS="$CFLAGS -Wno-incompatible-function-pointer-types" ;
+cat <<EOT >> /cross.meson
+[built-in options]
+c_args = [$(printf "'%s', " $CFLAGS | sed 's/, $//')]
+cpp_args = [$(printf "'%s', " $CFLAGS | sed 's/, $//')]
+objc_args = [$(printf "'%s', " $CFLAGS | sed 's/, $//')]
+c_link_args = [$(printf "'%s', " $LDFLAGS | sed 's/, $//')]
+cpp_link_args = [$(printf "'%s', " $LDFLAGS | sed 's/, $//')]
+EOT
+EOF
+RUN meson setup _build --prefix=$TARGET --cross-file=/cross.meson \
+    --default-library=static --buildtype=release --force-fallback-for=pcre2 \
+    -Dselinux=disabled -Dxattr=false -Dlibmount=disabled -Dnls=disabled \
+    -Dtests=false -Dglib_debug=disabled -Dglib_assert=false -Dglib_checks=false
+# FIXME: emscripten doesn't provide some pthread functions in the final link,
+#        which isn't detected during meson setup.
+RUN sed -i -E "/#define HAVE_POSIX_SPAWN 1/d" ./_build/config.h
+RUN sed -i -E "/#define HAVE_PTHREAD_GETNAME_NP 1/d" ./_build/config.h
+RUN meson install -C _build
+
+FROM build-base
+COPY --link --from=glib-dev /builddeps/ /builddeps/
+COPY --link --from=pixman-dev /builddeps/ /builddeps/
-- 
2.43.0
