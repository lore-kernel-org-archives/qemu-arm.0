Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2137218njd;
        Mon, 21 Apr 2025 22:30:30 -0700 (PDT)
X-Received: by 2002:a17:902:e54a:b0:223:5ace:eccf with SMTP id d9443c01a7336-22c535acd67mr222348695ad.25.1745299829859;
        Mon, 21 Apr 2025 22:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299829; cv=none;
        d=google.com; s=arc-20240605;
        b=dNNpU/dcz+0q7ZgPm5bzRDrfgn/mVUDrrrx8p8pRqYNpmQ5xjVdYPoGOFk+I2cZCfM
         54tFyTdR5QkotAnqTLdQmcqmGJbICVi+fPVZ4zu7ZjJUFhoYOwRb8sYLPbTDkD0YyV1W
         uttNdiRmFTYHNezqs8RGVl9u7R+NTePCf4PjZ0/s4aIk2tAFxEQACcTAXa4BgGj/TDkQ
         3Y+QmMsfVV7/lBEspYQrtpGpkjGAxN1g0YHcOoU4jlagYc15gCB3rVA9VIsnji7jZ/zy
         ++PMemB+T9Qcm3DoWcZvRX5s33/xewPKksuYYLVDus7s+ojjQFFQ3I1Fy0qlfIAMhgRa
         zM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EyswPERNVPUmMfuIfE21udR+zks7HJrFsl2VmGBeB2w=;
        fh=jVoep+f4X0ue6kEQQniK/tJZkBTLLraM/AZg/yLfYxo=;
        b=jrvX/AHLlVzI6UvSlM4B4HBrLaxTgHmWJQY1+AUtpif+jAt5bAcszNYmZ9vETWM796
         APw+1cdCGtNCtvOK2sf3pRRdQwMI1NzzOywC260Km+WfAXgezkqn9vQde7jQDX6OqQaa
         fXvNXX7Cbb45v76ojIwBobCDr7NOYbU22/RQ86zogyU9TVH8eTGj3vpumAGCeRkiRW4V
         cFjhP/lHyLmEoX0S/LBiZJz5O/I++M1R6LrjjmYq6oGvF5Yka+8G3nPiaqIBy7Qlyxos
         auFhTGTkVHEFXhY5MSGoTaTr7z3zU5Xw6/rhdXISK15n6E/l7lmFqYVhYsqPr/nrhiqn
         R6OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WbJ5XmCQ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50bf5554sor68926665ad.10.2025.04.21.22.30.29
        (Google Transport Security);
        Mon, 21 Apr 2025 22:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WbJ5XmCQ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299829; x=1745904629; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyswPERNVPUmMfuIfE21udR+zks7HJrFsl2VmGBeB2w=;
        b=WbJ5XmCQT6aNkc/fPlYG/STyu8TbNQ9P6gFNtd96H2QSwWf7JucEfvj4DQ/beLTjOk
         nhXvctMsRl9o39F+hbtrWL9TNhyn0dAFNeFO8iCayRBTnf992Lphn1UX7LyEzds1jSVW
         sBON9R0+2aq/GWwlXOpwwAn8UvNKmxZHO/Rny3mu3DtlLNIoYTRb+voIKSTapwWxeOHt
         x4FBpJj3z4By4ue1345/VfZCkCzHtinfVJJ9cPfuV1K7r9yPJxL27heYphpZM7c8tI3n
         I01SxcvDZSp6ZNMVvdnbaqujt/fegQiIidD1Y+2hrmV9MdHz4ae6YQaEHWB/0BsC4B91
         sNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299829; x=1745904629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyswPERNVPUmMfuIfE21udR+zks7HJrFsl2VmGBeB2w=;
        b=E2W7yHnjJd2ExcTxN/0i5hUfrroLnxKM7cSwTeIzmQp/shiXh1tDlzzvl7SlPkTXd0
         F4+lArRlNN0bWK2/50zx9uPji+/VmDb6xhiYEjOUE8gA7Zhd8zDjeSz0g1Xs30Q3cbt+
         XqCI2xviopw73v4k9okRtmO3SwaZRvR22HfZ67TzdoSg7aUKiEZGWNekFiXn61OZpXjJ
         Px/K4NxI8myr47A1za3OCHMavZHzV4FNYapYtKN00eqGNNNKerHXVE8T75inIubXEYNo
         jXG9BMxthFz08Ua21IGvxZ7Da/Il0Iip/KXTNtlBD0YBOzB6tOO7AuDfAoQBsVT/CTk3
         NZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKaW+SBZQmm7zZZ/uDw4opkR3ajap/QCj9lqWTYNwj9/M3gGpC6XYCFe4R5rx/YkPePy/5F22tgEJudqET/F33woE=@linaro.org, AJvYcCUPTL/d1Bm1C5I8AXQHGfDi+9IV+BYO2+j46IG8rs5UgPWUNqC54l9fjo7xJY/g8GVYBuRM5cebSjov8jm87dd0Zw==@linaro.org, AJvYcCW0t42WsJUZR8nLgqDLuLtPUpi9JYErf0dHgbVBAXHKDlYYk7Dc5ieGEt/lzEEuOZr2r90B2MvBsgdEqcqo@linaro.org, AJvYcCWHgt2IxMxCl2YjTfUEufYMdUe/zJ0PG3PLLLtPQx7w4Tp/3ZWut8VQP+j7/5/AlzvYWsQuYeth@linaro.org
X-Gm-Message-State: AOJu0YxYCsqcmMDSSja+ug+95uTdW1/b0oY7i3y6xXUP+qxG0nTfeUi/
	0pxzMS47XU/8fq8pV3vyGNkxp8IEOkFVFJZMhMeT9/iF6iaAcxM0
X-Gm-Gg: ASbGnctyA1h3UMLCBO6K8A2qKfi+IoowuP5N8RTbYYEKakH8zGvBnLl6ODCbgcLM2xN
	hQfv8aVUwxFK+AdD5rqHgGwGjouW3Y6NjiALCLsUV2kZJ+NHVc2fSwX2UrX5cr5FGbmveh7vdKR
	SKo7ZIQSA+Qr5Wm0O3MgBvpkyIpZSSSOQz867Nw9D4BalVGf2G3CN0wyFVkSbX5OK5MMvCg/2xc
	D70fygn1DOB8Q7a0g23+4PigsR6JHGsK6gGBG5dfghg+h4BJ9auNTciuqv1wH7GDfZ0TzwcNvHO
	Cfs4vqCaosByabK2aauTJQK08klLvDrsFyDWBL4YqARFvfv+MxPAWgJEjro=
X-Google-Smtp-Source: AGHT+IF866eeRMlWTJ5okWrqXs+r8BGchJhPURBo/iH1ZtCGUA/9C/H97nfcbV0T9/pDqgYGWsEh/w==
X-Received: by 2002:a17:902:f54c:b0:224:1074:63a2 with SMTP id d9443c01a7336-22c5361c436mr224374235ad.43.1745299829232;
        Mon, 21 Apr 2025 22:30:29 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:30:28 -0700 (PDT)
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
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
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
Subject: [PATCH v2 19/20] tests: Add Dockerfile containing dependencies for Emscripten build
Date: Tue, 22 Apr 2025 14:27:23 +0900
Message-Id: <2c76c1bdc27786d54a267b52a861debb64f067f8.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bu2szzLZzpb6

The added Dockerfile is based on the emsdk image, which includes the
Emscripten toolchain. It also cross-compiles the necessary dependencies
(glib, libffi, pixman, and zlib) for the Emscripten target environment.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS                                   |   1 +
 .../dockerfiles/emsdk-wasm32-cross.docker     | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 tests/docker/dockerfiles/emsdk-wasm32-cross.docker

V2:
- Split the Dockerfile addition from the previous 18th patch into a separate
  commit.
- Split the MAINTAINERS file change that adds emsdk-wasm32-cross.docker from
  the previous 19th patch into this commit.

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fb7fd79b6..58e4bdedba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -626,6 +626,7 @@ F: include/system/os-wasm.h
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
2.25.1
