Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426728njd;
        Mon, 7 Apr 2025 07:48:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:928a:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-739e46c5acemr14027736b3a.0.1744037317528;
        Mon, 07 Apr 2025 07:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037317; cv=none;
        d=google.com; s=arc-20240605;
        b=JWbjxpC7EuSHX8ricljWA4XX5FHN4lGe0K0lso32djCrZlR1gUn0y4iJ/hv2yHv00W
         JhC4FeJndl9moZwHozHLo+u4ZaIOtZuXI/TT/1I143plEUZZcZD6jsr0tbxZmJOdJAnk
         ioAuPGYT4jbvtRJI5xRTqUL/mYmiCnWqSXCHOoFpXhAH04yNMHKWfPz1pxymHp1VcbrU
         /1AQnuFbdFHL2JyO4m8tBfhGl5AVJbcFrk43mOrG9PQYh8jx1twbJ3ntX9dnYrSsKiwf
         /gU+PIClvlk8tFHMTorVwr9wSWlXBoBvM8bu1pVSqO/q/6n0914IQrWZFEmPRdXi90L/
         Hk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Xp+Sr4RJiOROIHlK78lOYGm5bAvFScILK0dzc+vFHek=;
        fh=e/drZ3XC0D2KTyOvQKD8mAI1voGG11D3Ge4Ad0kwHyw=;
        b=OO6FYwiOUh9QHpTuR4BT8rYYEhgSBwg8AgMLt+XlOtq0hP0FTb+DfOeDs7l+ZhOVfD
         Tdhbeli4+MxF3f2+T7iojnD9LIGtcNj1yyygfxn0KmboFTslaWZ49fFpqBeoZ3++KOWo
         HKpv7V4NLhFnSyTn7yR+/fkNG0fZsgApCDch8JrIU4xUeoaIc2dghNtFIcVywqq5W0jZ
         wqaVjjoW/GSTITQJfqXfGsiRQBYA+MQ3nILgYCt6KijrewmiBZHzbJo17Q9qtPyApb6P
         h0v0ta+9LatXsgqK2kjVaI9faLV/hq+no7lr/msySTq3pBKhP88B5JEunVoS0NxG7irC
         MwqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZOoz4mj;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739da0b93b1sor4909692b3a.10.2025.04.07.07.48.37
        (Google Transport Security);
        Mon, 07 Apr 2025 07:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZOoz4mj;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037317; x=1744642117; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp+Sr4RJiOROIHlK78lOYGm5bAvFScILK0dzc+vFHek=;
        b=IZOoz4mjJJu413JY7rXAuxDPHxjab1TsaREPHOw2CacAoJwY1CbhjILetra0EVxAdV
         illE4BPLU9hU4V6AjifBWaaZR/IylHX2ddoj1VpvipfCWw7mX5zcl1VFM/9c0ykkvrk0
         x/RqT+NUuLOC1FOyc/LcPyvzx961Pn5z/vMGL6TigvrpCdXi/8D9aTYOKc8vdUHKLPds
         TfLQW15RSlHAFRsnjraJtjpPi1hKcNN91o9mMNTYJ+5KEOY9RYrteMPIw+xgaBekT0E3
         KHPxcMn4nvdnKEN3mE3ExvsYvbiQ1jbhW9W74qADdMLAWTns6XaE4XHhzoIeEE3mSrps
         K0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037317; x=1744642117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp+Sr4RJiOROIHlK78lOYGm5bAvFScILK0dzc+vFHek=;
        b=APgwFwoKX8pKV7DnIiEdGmGwurkTofsfANFRgeHyMlH6DwtMOHxXBdyYJsmDXY4Jfk
         W3KnNthTDuCzfxCDL+TPTFvLkNlTkiiQHwcuPrXkxcqh8ZH7BLP82pvvht/cjP5NBgQ7
         0rOtX0/scuhntoomQgLSbn1YAJ2bljGaopONdExSoPnqs3l94fpznR0J69VOIjv7q4f4
         USrvbk7PkSqX5aNwo0r4xQl2kLbk+y8itM/pNrvHIDjUys+RLW0SBRJRuSe7cuIJ9pM6
         zjkJPIfmiMIjDdNzRKmpcsQvg4NVbdIx7tCWvR3B9N+iJaWgUARbRRtoEBkLzRAR6br1
         Wqzg==
X-Forwarded-Encrypted: i=1; AJvYcCULdEklek6Emy7Cmrxoc29X+f2PKOwmuGWQwBRsCFfm7IYwThgjvHztYXklWqD7aNevTUVA2A7sZwnpnSksJZWyGW8=@linaro.org, AJvYcCVNzS9zRrdi1OIo6Sv0WXI1ExQdZ4ws3qHWgCG3tXhxuxOcv3WcBIh/FY55eLMkwAfYDUVTNO4k@linaro.org, AJvYcCX7bCR51ArZ6g92VqxbKh4b2hQXIqinyN2y+IMx+hVq2zGH4k8sNYKhjFXPWeqiDBaHxQ3YyuTpcfSajMvz@linaro.org
X-Gm-Message-State: AOJu0YxKZDohg7v/kToQj3gMbp7ULWiD6dNXTwbmYuuTsvfcBfuUL9Ho
	8cBuTnOeout6HM27o8G++7ONGKoNs0SDXOtmQzYWodlCDqfAAXhH
X-Gm-Gg: ASbGncsMIyhcIOpxqweZbxbYo5vnJBCL++EstP41hv40+j7yhR0BpxYdr/1pnJFLyxQ
	OhKYkkU70bLSL6WPJx0keZMVywTGeAaKF8cU86diIDxneENtWTupCAsR6W3XLSiVBCCunYVrTyV
	aCEe3FXNOFuOpRpjD1+/jlSaSeEYlU5+mei7lPE91i9vINnDXoP0RZH8XNoiVHikPaR1Fg5IFoA
	wEvSh421YSA8WgiGWR8s/6k1NH40ug6KIXgssYJ+7B3Ljp23i+FMlg+TiP+9vI59kdoafGzLecV
	Tcg5zkvC4ctEushN9kk7s+K3H8zz6yfjPc7guAvfahua1hHrqaSCefThfqyEPQ==
X-Google-Smtp-Source: AGHT+IHuyyEeZ5PBMHbUyNVYg/55vQ7sPwGRsIy0+EN6C0rI5nS+BO4x/g+mqEDi7yXUA9N7VZAaeA==
X-Received: by 2002:a05:6a20:d50b:b0:1f5:79c4:5da2 with SMTP id adf61e73a8af0-201047368bbmr23154645637.31.1744037316969;
        Mon, 07 Apr 2025 07:48:36 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:48:36 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 09/10] gitlab: Enable CI for wasm build
Date: Mon,  7 Apr 2025 23:46:00 +0900
Message-Id: <3cf17a9fb1ead58fb8be2d8782c793530cad07e2.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UEmXM2zsP27K

Add GitLab CI job that builds QEMU using emscripten. The build runs in the
added Dockerfile that contains dependencies (glib, libffi, pixman, zlib)
compiled by emscripten.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 .gitlab-ci.d/buildtest-template.yml           |  27 ++++
 .gitlab-ci.d/buildtest.yml                    |   9 ++
 .gitlab-ci.d/container-cross.yml              |   5 +
 .../dockerfiles/emsdk-wasm32-cross.docker     | 145 ++++++++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 tests/docker/dockerfiles/emsdk-wasm32-cross.docker

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 39da7698b0..67167d68a5 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -126,3 +126,30 @@
     - du -chs ${CI_PROJECT_DIR}/*-cache
   variables:
     QEMU_JOB_AVOCADO: 1
+
+.wasm_build_job_template:
+  extends: .base_job_template
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
+  before_script:
+    - source scripts/ci/gitlab-ci-section
+    - section_start setup "Pre-script setup"
+    - JOBS=$(expr $(nproc) + 1)
+    - section_end setup
+  script:
+    - du -sh .git
+    - mkdir build
+    - cd build
+    - section_start configure "Running configure"
+    - emconfigure ../configure --disable-docs
+          ${TARGETS:+--target-list="$TARGETS"}
+          $CONFIGURE_ARGS ||
+      { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - if test -n "$LD_JOBS";
+      then
+        pyvenv/bin/meson configure . -Dbackend_max_links="$LD_JOBS" ;
+      fi || exit 1;
+    - section_end configure
+    - section_start build "Building QEMU"
+    - emmake make -j"$JOBS"
+    - section_end build
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 00f4bfcd9f..0f4d15021f 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -801,3 +801,12 @@ coverity:
       when: never
     # Always manual on forks even if $QEMU_CI == "2"
     - when: manual
+
+build-wasm:
+  extends: .wasm_build_job_template
+  timeout: 2h
+  needs:
+    job: wasm-emsdk-cross-container
+  variables:
+    IMAGE: emsdk-wasm32-cross
+    CONFIGURE_ARGS: --static --disable-tools --enable-debug
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 34c0e729ad..3ea4971950 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -94,3 +94,8 @@ win64-fedora-cross-container:
   extends: .container_job_template
   variables:
     NAME: fedora-win64-cross
+
+wasm-emsdk-cross-container:
+  extends: .container_job_template
+  variables:
+    NAME: emsdk-wasm32-cross
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
