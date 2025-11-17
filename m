Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41C5CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 11:58:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKxpV-0008G7-8Q; Mon, 17 Nov 2025 06:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpT-0008EA-6x
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:31 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpQ-0005ff-61
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so12219105e9.3
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763380526; x=1763985326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpUKmfaEKTlNTNJSKD1xW90pGm4ku3I0sxc5dq5csXU=;
 b=XColfPAHCz2o+4MDADE3EsBAGR7G+noDxhlI7VlU01OpC17gUAALpieifdDAjefuoj
 PbixPApiNWM9yGq1C9oQa30xjuqgJ02sWcYjedk10JIYgUmfpl9+lPTzjgOFyq58XmwW
 xmeeMPksduGKEfSDi6nsI/9oEX/mk7Kb/iqj9rJTnJlRzQLbVdVJBVxDk+TU7I/4kOhI
 k3IlvF6Qs33YdQd8g5/cUNyYHI+haMeh5EBFVnCvjWObSXeO6cmAH/bZuptxdx0r9uKP
 iYb7ZOtJXHoVJF9D6Cm0tif4miIcfcOlykGC5eD+GtglHEjgdGLaM95Bs698vbmmhqtD
 OOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380526; x=1763985326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VpUKmfaEKTlNTNJSKD1xW90pGm4ku3I0sxc5dq5csXU=;
 b=f8Xy0aDOQLULimsngrqUS8ZjOjggF+foyFeNrnhfT4GDUo5knIvahxTAb0SeoLmHLE
 B549UHzzAZhI/lmCxZhQ8zYZ6a0QnCf398tAIDpY+XyVrd7WFbgw0Pr/hOK5OsRDyrYW
 WJa1oefNo2H+P7cRijqBPOWuEFCfs/Rg/E/+0f2HPuG361rJZvu53rdhp+Rd9Q1aWsn5
 QrQ4ym8QMTSuc2wbSY8q7A6o6Hkd+nDXi3hSxkMvDV3aIx+/rO462/JwwvErQ97EaEHO
 5sRToctGvypbDIK7KUjE7PX+F+8tWC/16aKhEOKmtqxh+WXPiiznP4MbJcpfSZsoEZMa
 eb2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl2MsZIJnmeAKtgb6BIFraB3xFsAMQJUwV64cF47w2gy0C2v7Gc1U1jaVuXUQhowdk6P8u1PyITw==@nongnu.org
X-Gm-Message-State: AOJu0Yyxi0tE2wkL22nczZmp4pZsTXnAF0WfJzqxlczsRJ7pVAtpdPSZ
 tOoU4NNlApLgfgfHRRRKQ5+Q22+hy0OK2hImIB4Jbs0GLOp1RpxqtI6ibDYnIPNehHk=
X-Gm-Gg: ASbGncsTQ5qyLyKCSkDTotc9HFc0PbWTYCBZL1f1cY+s0XXow8KOgHEkBD9rECB6lLD
 eKhsW0i4PPlCxwg71vDpyRK3DnT8bPzSB0JaIm72eZANTuOdpQkPEgkmBu6d7WJb44oeggoAOfD
 er6LyCuJbfAcI0JArtpvryt6wMX4vFgaeliAt8DnZIEQNsQCdOLLE1PfL8l5yLKw1k4hPq0SDfP
 UpSPC5dTez5igxu18kxkHO2rHOXHWQTphfywjy3QrrONF6zuuwlmnJnOMAHEsRS4/PxfLiu8D0N
 0JO7QnnC2V2W8TSJG95/lNWJ9IwXhglwZao5q4bn5cDSRv7WgSP8zzj2v2pnsFA+P0RQUjkDGN8
 WTmNnqTEGmC2E4iCgUeQYWqtrwa2ZJKGoh6+bsfphOlWUvU1xPX9+nznr0/4nTzk8q72Q++Ow/F
 p7hUa7YXrwY/dZg9BQpww5gg==
X-Google-Smtp-Source: AGHT+IGB3c3p5OwcxanqbiTXrKNXErlBsAu9cBDWko/AAsOGJwtgBBqt0G3G36SomlhiDBroekbJwQ==
X-Received: by 2002:a05:600c:8b43:b0:477:6e02:54a5 with SMTP id
 5b1f17b1804b1-4778fe6098dmr113707505e9.18.1763380526476; 
 Mon, 17 Nov 2025 03:55:26 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779973ddcfsm127060875e9.15.2025.11.17.03.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:55:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 79A5E5F8C8;
 Mon, 17 Nov 2025 11:55:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 03/18] tests/lcitool: update ENV stazas outputted by refresh
Date: Mon, 17 Nov 2025 11:55:08 +0000
Message-ID: <20251117115523.3993105-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117115523.3993105-1-alex.bennee@linaro.org>
References: <20251117115523.3993105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Now lcitool has been updated to use the non-legacy ENVs we should do
the same for what refresh adds.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20251113102525.1255370-4-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 4 ++--
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 4 ++--
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 4 ++--
 tests/docker/dockerfiles/debian-i686-cross.docker     | 4 ++--
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 4 ++--
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 4 ++--
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 4 ++--
 tests/docker/dockerfiles/debian-riscv64-cross.docker  | 4 ++--
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 4 ++--
 tests/docker/dockerfiles/debian.docker                | 2 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 4 ++--
 tests/lcitool/refresh                                 | 6 +++---
 12 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 26a39940126..c38ab8247d5 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -181,8 +181,8 @@ endian = 'little'\n" > /usr/local/share/meson/cross/x86_64-linux-gnu && \
 ENV ABI="x86_64-linux-gnu"
 ENV MESON_OPTS="--cross-file=x86_64-linux-gnu"
 ENV RUST_TARGET="x86_64-unknown-linux-gnu"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-linux-gnu-
-ENV DEF_TARGET_LIST x86_64-softmmu,x86_64-linux-user,i386-softmmu,i386-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=x86_64-linux-gnu-
+ENV DEF_TARGET_LIST=x86_64-softmmu,x86_64-linux-user,i386-softmmu,i386-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 4b0163fa1b9..2f62da0f5eb 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -180,8 +180,8 @@ endian = 'little'\n" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
 ENV ABI="aarch64-linux-gnu"
 ENV MESON_OPTS="--cross-file=aarch64-linux-gnu"
 ENV RUST_TARGET="aarch64-unknown-linux-gnu"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
-ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=aarch64-linux-gnu-
+ENV DEF_TARGET_LIST=aarch64-softmmu,aarch64-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 742031ce0a2..62e297f5d12 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -177,8 +177,8 @@ endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabihf && \
 ENV ABI="arm-linux-gnueabihf"
 ENV MESON_OPTS="--cross-file=arm-linux-gnueabihf"
 ENV RUST_TARGET="armv7-unknown-linux-gnueabihf"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
-ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=arm-linux-gnueabihf-
+ENV DEF_TARGET_LIST=arm-softmmu,arm-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-i686-cross.docker b/tests/docker/dockerfiles/debian-i686-cross.docker
index 1ccfde2e4bb..eb9a915d492 100644
--- a/tests/docker/dockerfiles/debian-i686-cross.docker
+++ b/tests/docker/dockerfiles/debian-i686-cross.docker
@@ -177,8 +177,8 @@ endian = 'little'\n" > /usr/local/share/meson/cross/i686-linux-gnu && \
 ENV ABI="i686-linux-gnu"
 ENV MESON_OPTS="--cross-file=i686-linux-gnu"
 ENV RUST_TARGET="i686-unknown-linux-gnu"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=i686-linux-gnu-
-ENV DEF_TARGET_LIST i386-softmmu,i386-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=i686-linux-gnu-
+ENV DEF_TARGET_LIST=i386-softmmu,i386-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index eeb77212d5d..42e8444d153 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -176,8 +176,8 @@ endian = 'little'\n" > /usr/local/share/meson/cross/mips64el-linux-gnuabi64 && \
 ENV ABI="mips64el-linux-gnuabi64"
 ENV MESON_OPTS="--cross-file=mips64el-linux-gnuabi64"
 ENV RUST_TARGET="mips64el-unknown-linux-gnuabi64"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=mips64el-linux-gnuabi64-
-ENV DEF_TARGET_LIST mips64el-softmmu,mips64el-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=mips64el-linux-gnuabi64-
+ENV DEF_TARGET_LIST=mips64el-softmmu,mips64el-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 9b3dca44f15..1ab197b144d 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -176,8 +176,8 @@ endian = 'little'\n" > /usr/local/share/meson/cross/mipsel-linux-gnu && \
 ENV ABI="mipsel-linux-gnu"
 ENV MESON_OPTS="--cross-file=mipsel-linux-gnu"
 ENV RUST_TARGET="mipsel-unknown-linux-gnu"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=mipsel-linux-gnu-
-ENV DEF_TARGET_LIST mipsel-softmmu,mipsel-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=mipsel-linux-gnu-
+ENV DEF_TARGET_LIST=mipsel-softmmu,mipsel-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 15c6b436d31..85d2c0ffdc2 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -179,8 +179,8 @@ endian = 'little'\n" > /usr/local/share/meson/cross/powerpc64le-linux-gnu && \
 ENV ABI="powerpc64le-linux-gnu"
 ENV MESON_OPTS="--cross-file=powerpc64le-linux-gnu"
 ENV RUST_TARGET="powerpc64le-unknown-linux-gnu"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=powerpc64le-linux-gnu-
-ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=powerpc64le-linux-gnu-
+ENV DEF_TARGET_LIST=ppc64-softmmu,ppc64-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 2591c4adc96..4f01eecf416 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -179,8 +179,8 @@ endian = 'little'\n" > /usr/local/share/meson/cross/riscv64-linux-gnu && \
 ENV ABI="riscv64-linux-gnu"
 ENV MESON_OPTS="--cross-file=riscv64-linux-gnu"
 ENV RUST_TARGET="riscv64gc-unknown-linux-gnu"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=riscv64-linux-gnu-
-ENV DEF_TARGET_LIST riscv64-softmmu,riscv64-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=riscv64-linux-gnu-
+ENV DEF_TARGET_LIST=riscv64-softmmu,riscv64-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 57aa3209c5c..2a3046e7859 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -178,8 +178,8 @@ endian = 'big'\n" > /usr/local/share/meson/cross/s390x-linux-gnu && \
 ENV ABI="s390x-linux-gnu"
 ENV MESON_OPTS="--cross-file=s390x-linux-gnu"
 ENV RUST_TARGET="s390x-unknown-linux-gnu"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=s390x-linux-gnu-
-ENV DEF_TARGET_LIST s390x-softmmu,s390x-linux-user
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=s390x-linux-gnu-
+ENV DEF_TARGET_LIST=s390x-softmmu,s390x-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian.docker b/tests/docker/dockerfiles/debian.docker
index bbb920c6815..c1817f162f6 100644
--- a/tests/docker/dockerfiles/debian.docker
+++ b/tests/docker/dockerfiles/debian.docker
@@ -169,7 +169,7 @@ RUN cd /usr/src/netmap/LINUX && \
   ./configure --no-drivers --no-apps \
   --kernel-dir=$(ls -d /usr/src/linux-headers-*-$(dpkg --print-architecture)) \
   && make install
-ENV QEMU_CONFIGURE_OPTS --enable-netmap
+ENV QEMU_CONFIGURE_OPTS=--enable-netmap
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index e6f84dd556f..1da425768fc 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -112,8 +112,8 @@ RUN nosync dnf install -y \
 
 ENV ABI="x86_64-w64-mingw32"
 ENV MESON_OPTS="--cross-file=/usr/share/mingw/toolchain-mingw64.meson"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32-
-ENV DEF_TARGET_LIST x86_64-softmmu
+ENV QEMU_CONFIGURE_OPTS=--cross-prefix=x86_64-w64-mingw32-
+ENV DEF_TARGET_LIST=x86_64-softmmu
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index df186caffe6..3a31fcfee9c 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -121,7 +121,7 @@ debian13_extras = [
     "  ./configure --no-drivers --no-apps \\\n",
     "  --kernel-dir=$(ls -d /usr/src/linux-headers-*-$(dpkg --print-architecture)) \\\n",
     "  && make install\n",
-    "ENV QEMU_CONFIGURE_OPTS --enable-netmap\n"
+    "ENV QEMU_CONFIGURE_OPTS=--enable-netmap\n"
 ]
 
 # Based on the hub.docker.com/library/rust Dockerfiles
@@ -162,8 +162,8 @@ ubuntu2204_rust_extras = [
 ]
 
 def cross_build(prefix, targets):
-    conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
-    targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
+    conf = "ENV QEMU_CONFIGURE_OPTS=--cross-prefix=%s\n" % (prefix)
+    targets = "ENV DEF_TARGET_LIST=%s\n" % (targets)
     return "".join([conf, targets])
 
 #
-- 
2.47.3


