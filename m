Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179612njc;
        Wed, 16 Apr 2025 01:17:23 -0700 (PDT)
X-Received: by 2002:a17:902:d50e:b0:224:c76:5e57 with SMTP id d9443c01a7336-22c359734cemr15090965ad.39.1744791443297;
        Wed, 16 Apr 2025 01:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791443; cv=none;
        d=google.com; s=arc-20240605;
        b=jo48n+CxDGDUX7HO2h6zP+EAu64NE9Svb43bebl4ubnt9HDTAsd7eZkeWLTdDKZ9W/
         RJVwtEncBw5cp8EZHKeYmRafrT00YDyEoEInsYEY0EhInt/T0VGkLdIQOcis4eWagSd2
         n23PR1Yg8/mdWT/HR+H8UkAQNsIZ4HsLemr8BlEodJz1vTuNOm0fhQumbC6DRTfkyEhB
         4/Lth7SHdO1ZnAffMU9OC3A003kISm4DcggCIdbgD9eCzU5a+joXfBsA6KWP0QQwUx83
         IKvhZjA0joKCSKcj7LN7FANnv9JnHZuSPpqvxx7v47Y2iRjF6TOPJkAMuAbG6pnFrTMA
         m8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qh7ZvjfwF1hD8dMzut82Yi3dWFW09ht1e9BNINW8RSM=;
        fh=33vR+wdWwDml2JlVl2ygoS1m7dZyFzvIV3MMNRtjAOE=;
        b=ADhCAvGEMZQOaIZIKnSuibrisrJxuJjD+fogtd4yw7bO/4Xl2akZWBOWIXnpTbasj7
         bDtiSqZhczYOMeYos6ognO72vas7PRzDfPDmUCm9GzVHmHbiEiD1wPuZoS72Merjrx63
         hF8Z/pMll+1U+M5hARcVIDKgN0aF52wDaQwE93fkIsgkRXnj8+z1DP6Q1Jzu8h2R5Kkg
         A+lCFUwhHIIaWdW7EgpitFMGGmUFlFxhz14BzFs0NzeUsIHDYuSQCt2R69QxP1s6gHFY
         ESSyYKqCrrx33GWDXfb+atH8Pu3c+EM1akOS6aK8amOGnz5K8oZxYQBLj86GhLuh9fZL
         wNJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTZKiitD;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1d46998sor14078162b3a.3.2025.04.16.01.17.23
        (Google Transport Security);
        Wed, 16 Apr 2025 01:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTZKiitD;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791443; x=1745396243; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh7ZvjfwF1hD8dMzut82Yi3dWFW09ht1e9BNINW8RSM=;
        b=MTZKiitDEUmmA+gpi7Ck04ZntPwTp8jPEz9uTzU5WnY/8kLxDqWSKh+yqtZ5EaeTxB
         TrhOEk4dOFHg3nc91m3C+egQPkAEQG+DHkT2ZeC5P859z61MvuJ8ZoypqeeeUCt71dvs
         ykcvZMeh7PLsYvUo5z5E9+JEj+Ksx6ktAUDUnZn6U9H0aCSrQ5B4fHED5jQ6qzwJ+MiR
         kBrbqTbA6kk0YZdQBg2h1gDoV1HTWyv1wEa6WQiBgbboj+oTZWHxGDKwvMbnjjocF4Hs
         eGi2aYYMlNkGEBFXvFJabJDJfgwgBqKKjOapwQkTVO4mf5USkZQEzrK/DexYCtcse5Mi
         IVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791443; x=1745396243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qh7ZvjfwF1hD8dMzut82Yi3dWFW09ht1e9BNINW8RSM=;
        b=fmTvv+ZmD1TSc6M+oUa56fcaLYSIxEg3mNPp4Y4wduth/22I/XRKAkbkpYpTE6l4C4
         vZ4K77XWR8WWwOwCM6cbAr/oVcI2Xj8FoxcnSdkAddLOJVwSevsFL76h1bkhtoPF0P5V
         WxrLMI9S0MVYhjo8tkGY+/MHqoqoher57PpKD1oaehxQnHLy7N1DxeUshNA98g1jzwaP
         EPHXgBzURh9nVAfep9/VRzkthiLlG+Z585A4jO7s/2VkSWSS1mv9OgtEKBgIRpWgmp5X
         s7O9GyCn96sZYlAhY9KKJ4RadB9B7xeOPB1Ns/0YDRnK8RFjCVqiqt9dIMxiQclLeY7R
         wHRg==
X-Forwarded-Encrypted: i=1; AJvYcCU2ai0WJHC5ldw/b/eVlrhtZKbxE7VeAwSUgHZ81vZoWdSzM08vq7RkUoOD83KpFdfVQ0XRZswD@linaro.org, AJvYcCVn6MoPVSab9ZHOFRhytD277pOhD4UzFp5Na6jf9cnggc04TL/kWThRuyQLrzFRC/2fu3BQBxlyOfgaLPCZdmUKpQ==@linaro.org, AJvYcCWWkdvvh9C1itR3oiA9oWOxs0GtLhx9Yy61P2Gi1yDdKRTSsTuIaw2WIeKjLFYn2P0iJPVjmZCizK5jTBbLyQM34OA=@linaro.org, AJvYcCXHy/jyjM8KOgdBlogtkvoyP95coQDpPMG+Tdt+i9rWhat9MzD4YjFZPd4m681IqwkBhbGl937puVusbSBP@linaro.org
X-Gm-Message-State: AOJu0YzN6KHqFlkWPzXgzCQ6R2G81X4TMr+gXb+AuSgrntyojo/lYXp+
	qCQ1wy8bTuAyoeMP6f45BZtLxREPp1Q7LHUIkchUtvGnlsR/qj+c
X-Gm-Gg: ASbGnctJK6eo+WKL1CINLI2cygp6W1U9pHQIFjv3NXzTGuGYEIlrlKKC4AvO+hjHK2i
	Mg4Iucr7HCupSs9UJQEVRYpqVCTzc2yAnkq6rn38LXRlDcQhQhjbfNnshQ3wQRsPucwk5GwHrnC
	wATcOkYC16UpekEgEbMULe1xcHGstsz4hFkC1oe1C0faBE2uqi1QTCQRpmGJvVVx/7wwiChWpuv
	Kp+W4VEWEuxqu8Q/l3vwoFxjMjx70rkU5l2vlXfIwvQEkk9HjwfdWL7ec5d1ycEbNjGnrNv20qo
	pndjJN6NvNtMKOjXlBC1obhrW87yc0D8QnyqxyOLoyU0um67E1EXPdj00w==
X-Google-Smtp-Source: AGHT+IFCeHlptEnbJhSJmI0VWsiGyayCzWAUrXdaQCdZgbcfPLImuN5NBzUlCdW6/hhmr03FFM2KKw==
X-Received: by 2002:a05:6a00:279f:b0:736:3e50:bfec with SMTP id d2e1a72fcca58-73c266e7905mr1632687b3a.8.1744791442486;
        Wed, 16 Apr 2025 01:17:22 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:17:21 -0700 (PDT)
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
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 18/19] gitlab: Enable CI for wasm build
Date: Wed, 16 Apr 2025 17:14:23 +0900
Message-Id: <16055d17cadcb5f4c23203218cb8fc3fa81d1754.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: in0dSl0Z95Pm

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
index 00f4bfcd9f..0f92d5313a 100644
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
+    CONFIGURE_ARGS: --static --disable-tools --enable-debug --enable-tcg-interpreter
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
