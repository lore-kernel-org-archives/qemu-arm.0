Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09D0CCFA18
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:19:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs0M-0006Se-V4; Tue, 11 Nov 2025 12:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzo-0005ZO-EC
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:38 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzk-0003ui-Lz
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:31 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b73161849e1so418084666b.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881447; x=1763486247; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZYQn6/uymBH31KVX4b4pqVGB6rAA5zUGopyAE1ApMGI=;
 b=bKulZHjuXsjTdpR1Cr+JxR0zUZVZfs42hE/HwYC1OjaWtLqAc1DUXWYvt7BSFq4SIR
 ZX2/mLCffapcnEMJqCzoYaCPexJ9kqNoV03j4Jirdvl1i+b56BD+XzQJSLc86nXOEMmA
 dAnLifYGhGDPNUX5p+CWRFCMIW7+Q/ys51Zs9vu13utJVeU2FrOKRyXSaxGjOZJMS7G6
 nm80oLsln0CDn1VdGzId0B4953Zo0dUPWcHprPzEmPWzdNQj/nQCnxrEnFSW5GIhQSiB
 BKIW8I7PKph9gW6Y5eexQwxosD7YYXdb2PBNu9Tq7BvUsOR2Ajv+6sIEkzo2etfp1yFZ
 Kwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881447; x=1763486247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZYQn6/uymBH31KVX4b4pqVGB6rAA5zUGopyAE1ApMGI=;
 b=ZIFh28l3KT4H3l4LZz9p+FN04EbaS+Cw0LzUH4UMXM+3xNWfuTMKRZxnCKPdQVCap0
 qHg+ZvLrk/WblthTkwqIZo+w2/iMrWn6fJwEnHWuFHCUmWK034A4ttqXrR59WWQNhmJY
 +EmaRp+g0YVy5PZBODMu16kJvjxeFMSMnr1zD/ZUC1cAPhYexs3HxnssBOvuSzGqBps8
 LBJiDfCp+rXKcZPPH8oglPvGFxmx3R23YpLz6DSAc/FM0IbwVZYTKKc8oPvDlvoJGnFx
 YjATQt75YC8lUqHOageFuYVMfyH+b9PCuBvdYDQKkm+x13vXHsPy5WmgLflpM/yo59lN
 WxAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuyCmI3h6TVgvcCr7JxldISILR/vz3M94vMA/rqUjavYcuHf+B0oVGI/M4opKKIp6H5ivu04pvfg==@nongnu.org
X-Gm-Message-State: AOJu0YweTt/MHzSme2hCYmHY9ejUAf+lf109YmYt/TsA/rx8zZ1vaPTw
 R8cs9LnLQwVG2x3T57cTexgCwoEAesw4nOp6v2UJsyVoeOapBVahZCLu3uJOfnJlpgI=
X-Gm-Gg: ASbGncvwsM5+m8+59OAEoSDVLOLjjV1LxPjJXmVv59Kw8IJyzaIgdMqQmQuFhz3AHjG
 BnjTglCybtcLilWnT8ZECycAtKwzcPDxsn8c1Hd+sujk2asfQyP0SZ4/HuBbOvq7VOopsKF4Odw
 62/Rv/iFrhqn50FObaHgp4k0LqxrB3cGduzONN7U8DWh4wRw/Enj9QjAFCNZzaPWAAZEIjrnH9I
 9M88VRwNmUjwZomLMWh7PtlOKznJLeIWZ9iTJ84bbHfIfwu72QGwZdcwgCJak5V0bSf129hqvRW
 3hi+6FoP8ePYrompBudCSrYKXnDSnMm3ZRjiaEB6MOaowATqyUkI1HmNi7lwJQrnzeJwgR3QfrZ
 cFp1bh2jCFjJ7Ufr30rBcBEjoULT8sMGafbhUkfVA4bPD+AJ+6epqQ5LVCzHxE33MQ3jCiYFNUj
 w4zCJaUsdK210=
X-Google-Smtp-Source: AGHT+IFmTPJzZk+apg7cewpbeGrEfZIXXY5dsF4h7G4Xwmq/CJb55E002QJo9LoBYrab7xORVDGFRA==
X-Received: by 2002:a17:906:6d8d:b0:b73:1634:6d71 with SMTP id
 a640c23a62f3a-b7316346df3mr498066166b.26.1762881446993; 
 Tue, 11 Nov 2025 09:17:26 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf312271sm1376720366b.19.2025.11.11.09.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A7E705F91D;
 Tue, 11 Nov 2025 17:17:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 03/16] tests/lcitool: update ENV stazas outputted by refresh
Date: Tue, 11 Nov 2025 17:17:10 +0000
Message-ID: <20251111171724.78201-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


