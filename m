Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B92BCD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:20:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3IC-0004l6-RK; Thu, 21 May 2026 09:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hp-00047S-IV
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:08 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008WM-UE
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:05 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49039a8851fso6617265e9.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369472; x=1779974272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1UnE4Cueanic0qP2SwE7C5Cts7q+wD2Nd0LKACKzGHo=;
 b=hx3UOptas736Ahv0eWogol8ab2dVgv47OI/CMOkuWg7sMbCoSfuEL6b5JokFpxm4SG
 RSG/lefD54pDWZhDjxv9ItCD9t9E7HvurgMYx3+KZrwvYna4o4X7s40+FBGT5RbbFtw/
 yLfLiAEyyJh4FUH4UnJGZAO3JfFOP9cUDN8cpi4Dwc/cYDfwc15sQKy63vYd0s1/JYH9
 Hs/NlC4MkNPkE0+KAcMbnJvxnl9/ijr2Qzz0AukO2nyCIA9vyQZx7Zoug/k2RNgKYfE3
 PnQo8tEw6rmII4CkIa7n+MhtF5R4zugOv66CBnIRRnE8XtjKAUm1zbzmuDLIzpOxz1Z8
 ORqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369472; x=1779974272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1UnE4Cueanic0qP2SwE7C5Cts7q+wD2Nd0LKACKzGHo=;
 b=YOeyTzMYRhpyGs8ST0AHy60xHux0RMa+Uef2A9SNDRsV6VePWrLyt/X4AF/caC15CP
 2tn4T7jU3538O0JRzubNvS9yd22a1yX9wBlm/zPXKFJWulhWKeoaRiSJC8E1TQsnh4tR
 1ygoAy6SaqWjps247eXxqDv6nQ3mvuUmG+M5lOclcjZOpUwwKhQEVKNjLT6nx/1Z59W9
 pxGTLnV0ibAI/XbcZD4b7NA3A0q/eSTWWm/hjYqpgfqDCw+kmcCVG7qC4+EVl21kcEya
 1iD0DQBIgar6c1UEAG+cwXxD8eOH9HQQ2s0VRhVXwelWj5nCIQHE2MwJ7+Q5w9FDWyy/
 1R1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/YWhQ5e69AqQtSOfG+2jr4yBfvfCgdfq4iurJDAo1ef+L/AjouBF0mBv0DPPUWHwJU25xCy2PTCQ==@nongnu.org
X-Gm-Message-State: AOJu0YzedLm6A07RV2cckCURgspNRTSZm7yQIgOXX3YBXSS76OqhglTQ
 NoohuqQRIXqBV8fUsi4BqIj7HuRqswFR/7p4iRd9rx55lR2I0Wk+4w5BLN5tFbRU3JiaPPgVefH
 WdmB0Gt0=
X-Gm-Gg: Acq92OEnnnBlu0d98rpTMddSW0sVnoVbPE8vNgNJ2+2/6sTg5BIefqflyC4n/Cb6WA1
 oV4WoVoImuOA9FBsDhGpgTrfxsxOV7DcT9nW4n4jxsZvdOdKcxYJ5CT0lPCVKts1M2/JCmB0WqK
 KP+DzN241EUlYAZ9Vm0gkYwA+HKIQMUdd4t/mNZqsN11RqSiSuAjge3Pf6WIDx2sVmiUOfbG+fu
 d6C7RJy2d9+GuCWuY+oaDfDoVKwFbiXI3dCtBDEIXv2IPQklIR6FEMjoRRThgae58t3w4YzGUaU
 ots/AqvsBJ+BZMJ+ZWgCQUxAamQHRUQ1UceZvZwZdIC2PnOnsyGUXGQOdSVmLap3kCfulbiB0f9
 Mh3Gfsz/eA0e0ZNKF0ILUWexBMVVgHnhxq+YAMGTqzQj0u51Cr0QxEXTvZZesx5Q8s0Y7k/UQ2y
 n1iW+y5NT4SRyHmi8NoZIpSZM=
X-Received: by 2002:a05:600c:4d98:b0:489:2005:b36e with SMTP id
 5b1f17b1804b1-4903607ced6mr25289875e9.19.1779369471872; 
 Thu, 21 May 2026 06:17:51 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d3514esm73440345e9.3.2026.05.21.06.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B206D61064;
 Thu, 21 May 2026 14:17:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 15/16] docker: Remove LegacyKeyValueFormat warnings in
 non-generated files
Date: Thu, 21 May 2026 14:17:37 +0100
Message-ID: <20260521131739.540157-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Manually update Dockerfiles to not use legacy 'ENV key value' format:
https://docs.docker.com/reference/build-checks/legacy-key-value-format/

This removes warnings when building / using the containers:

 - LegacyKeyValueFormat: "ENV key=value" should be used instead of legacy "ENV key value" format (line 98)
 - LegacyKeyValueFormat: "ENV key=value" should be used instead of legacy "ENV key value" format (line 64)
 - LegacyKeyValueFormat: "ENV key=value" should be used instead of legacy "ENV key value" format (line 97)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20260518102222.80735-7-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../docker/dockerfiles/debian-hexagon-cross.docker | 14 +++++++-------
 .../dockerfiles/debian-loongarch-cross.docker      | 10 +++++-----
 .../docker/dockerfiles/debian-tricore-cross.docker |  6 +++---
 .../docker/dockerfiles/debian-xtensa-cross.docker  |  8 ++++----
 tests/docker/dockerfiles/python.docker             |  5 +++--
 scripts/coverity-scan/coverity-scan.docker         | 12 ++++++------
 6 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 91d4b71ac95..3c94f040b81 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -39,15 +39,15 @@ RUN apt-get update && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt
 
-ENV TOOLCHAIN_INSTALL /opt
-ENV TOOLCHAIN_RELEASE 12.Dec.2023
-ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-unknown-linux-musl"
-ENV TOOLCHAIN_URL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV TOOLCHAIN_INSTALL=/opt
+ENV TOOLCHAIN_RELEASE=12.Dec.2023
+ENV TOOLCHAIN_BASENAME=clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-unknown-linux-musl
+ENV TOOLCHAIN_URL=https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz
+ENV CCACHE_WRAPPERSDIR=/usr/libexec/ccache-wrappers
 
 RUN curl -#SL "$TOOLCHAIN_URL" | tar -xJC "$TOOLCHAIN_INSTALL"
-ENV PATH $PATH:${TOOLCHAIN_INSTALL}/${TOOLCHAIN_BASENAME}/x86_64-linux-gnu/bin
-ENV MAKE /usr/bin/make
+ENV PATH=$PATH:${TOOLCHAIN_INSTALL}/${TOOLCHAIN_BASENAME}/x86_64-linux-gnu/bin
+ENV MAKE=/usr/bin/make
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
index 55b3dbe4510..d2ba07972ce 100644
--- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -40,12 +40,12 @@ RUN apt-get update && \
 RUN curl -#SL https://github.com/loongson/build-tools/releases/download/2023.08.08/CLFS-loongarch64-8.1-x86_64-cross-tools-gcc-glibc.tar.xz \
     | tar -xJC /opt
 
-ENV PATH $PATH:/opt/cross-tools/bin
-ENV LD_LIBRARY_PATH /opt/cross-tools/lib:/opt/cross-tools/loongarch64-unknown-linux-gnu/lib:$LD_LIBRARY_PATH
+ENV PATH=$PATH:/opt/cross-tools/bin
+ENV LD_LIBRARY_PATH=/opt/cross-tools/lib:/opt/cross-tools/loongarch64-unknown-linux-gnu/lib:$LD_LIBRARY_PATH
 
-ENV QEMU_CONFIGURE_OPTS --disable-docs --disable-tools
-ENV DEF_TARGET_LIST loongarch64-linux-user,loongarch64-softmmu
-ENV MAKE /usr/bin/make
+ENV QEMU_CONFIGURE_OPTS="--disable-docs --disable-tools"
+ENV DEF_TARGET_LIST=loongarch64-linux-user,loongarch64-softmmu
+ENV MAKE=/usr/bin/make
 
 # As a final step configure the user (if env is defined)
 ARG USER
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index fd797dc7ee4..9e7ff321677 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -40,9 +40,9 @@ RUN curl -#SL https://github.com/bkoppelmann/package_940/releases/download/trico
     | tar -xzC /usr/local/
 
 # This image can only build a very minimal QEMU as well as the tests
-ENV DEF_TARGET_LIST tricore-softmmu
-ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools --disable-fdt
-ENV MAKE /usr/bin/make
+ENV DEF_TARGET_LIST=tricore-softmmu
+ENV QEMU_CONFIGURE_OPTS="--disable-user --disable-tools --disable-fdt"
+ENV MAKE=/usr/bin/make
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
index ef63e44e2ef..d9130fc3378 100644
--- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -19,16 +19,16 @@ RUN apt-get update && \
         python3-minimal && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt
 
-ENV CPU_LIST dc232b dc233c de233_fpu dsp3400
-ENV TOOLCHAIN_RELEASE 2020.07
+ENV CPU_LIST="dc232b dc233c de233_fpu dsp3400"
+ENV TOOLCHAIN_RELEASE=2020.07
 
 RUN for cpu in $CPU_LIST; do \
         curl -#SL http://github.com/foss-xtensa/toolchain/releases/download/$TOOLCHAIN_RELEASE/x86_64-$TOOLCHAIN_RELEASE-xtensa-$cpu-elf.tar.gz \
         | tar -xzC /opt; \
     done
 
-ENV PATH $PATH:/opt/$TOOLCHAIN_RELEASE/xtensa-dc232b-elf/bin:/opt/$TOOLCHAIN_RELEASE/xtensa-dc233c-elf/bin:/opt/$TOOLCHAIN_RELEASE/xtensa-de233_fpu-elf/bin:/opt/$TOOLCHAIN_RELEASE/xtensa-dsp3400-elf/bin
-ENV MAKE /usr/bin/make
+ENV PATH=$PATH:/opt/$TOOLCHAIN_RELEASE/xtensa-dc232b-elf/bin:/opt/$TOOLCHAIN_RELEASE/xtensa-dc233c-elf/bin:/opt/$TOOLCHAIN_RELEASE/xtensa-de233_fpu-elf/bin:/opt/$TOOLCHAIN_RELEASE/xtensa-dsp3400-elf/bin
+ENV MAKE=/usr/bin/make
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/dockerfiles/python.docker
index 59e70a02484..79c554a2d87 100644
--- a/tests/docker/dockerfiles/python.docker
+++ b/tests/docker/dockerfiles/python.docker
@@ -4,7 +4,7 @@ FROM fedora:latest
 MAINTAINER John Snow <jsnow@redhat.com>
 
 # Please keep this list sorted alphabetically
-ENV PACKAGES \
+ENV PACKAGES="\
     gcc \
     make \
     python3 \
@@ -15,7 +15,8 @@ ENV PACKAGES \
     python3.11 \
     python3.12 \
     python3.13 \
-    python3.9
+    python3.9 \
+    "
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
index 93e558c8623..30d154c0d86 100644
--- a/scripts/coverity-scan/coverity-scan.docker
+++ b/scripts/coverity-scan/coverity-scan.docker
@@ -152,12 +152,12 @@ exec "$@"' > /usr/bin/nosync && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
-ENV LANG "en_US.UTF-8"
-ENV MAKE "/usr/bin/make"
-ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
-ENV QEMU_CONFIGURE_OPTS --meson=internal
+ENV CCACHE_WRAPPERSDIR=/usr/libexec/ccache-wrappers
+ENV LANG=en_US.UTF-8
+ENV MAKE=/usr/bin/make
+ENV NINJA=/usr/bin/ninja
+ENV PYTHON=/usr/bin/python3
+ENV QEMU_CONFIGURE_OPTS=--meson=internal
 
 RUN dnf install -y curl wget
 ENV COVERITY_TOOL_BASE=/coverity-tools
-- 
2.47.3


