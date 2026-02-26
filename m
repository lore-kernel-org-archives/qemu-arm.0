Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5428EFD8FF4
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 18:54:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvgU8-0008E7-Sq; Thu, 26 Feb 2026 13:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgU3-0008CY-Gi
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:13 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgTz-0003WU-IO
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:11 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b93698bb57aso113229066b.0
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 10:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772131986; x=1772736786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MSs0etEZmmvImF5qEa73W/Q5BBnsscmwqVF4ojVJyjY=;
 b=kMhQd0JSRsIpanAUugDWzLgG6KubzSD0SxWMwWleub7okqxb6lBDOSOrJMFm6SYPfA
 OkVN0UbrGWT6sX3v/21kxSxuEEVwbNTI3VSXeNxvdNVpClAA8Anrho3msyC/t1n/2Inm
 ZkbXaRqR7LLeGXQAFluMiqAE51zWsk33PWBKuUCeJT3AGRkc8RvpItRb2kuwkXN+Xjze
 mSq/hI9wMqnxj+PFjwDZpCnvSOBN6XL/Y3jL3iAmRmp5mhSM5Ue3LDUh+l2+jOWE4eKn
 oA+PPX/Ne//QNOblCR4VlIniHEVIk4m1aEsUjAMqpf3DM4mLqQ8PtMEKb3MbU+3HOP+W
 uVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772131986; x=1772736786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MSs0etEZmmvImF5qEa73W/Q5BBnsscmwqVF4ojVJyjY=;
 b=pRkjHkdweYyVD4Iel8jcJ2DnPR8Fr+Q0ybOjwkQk36YxMVOcmnxSXYQaz58AvJlvYW
 /Wc5kSdmih7yS2Fqx3YcN3asFokawWQyF236n9sLs0VHXCtjL7qtHH9UmFjbbu9BKO8c
 ojqK+N7b6SxkmUD0GwL2gTTPPf/vdFxqcQbxPyfBU4LPgVLG2bRXj5gKfUe/6QedEGy0
 X72dpFXPhibM8aiWQF7zztFmtFZN/ac4hL9pt6ZRp85x6gahNgqDhYm97KX3ec9QAHN/
 3Tl87SC0GJadPw0x8V2GSYYWHAGDXIRrNivXP8XnnOCLguND00+QzQEb9qW3QW1g6LBZ
 DvhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfjqpxby8jwoxNxMDB9Wz+nifCTRx6m0tKulYoGCjK40U812xJsMf4LlNMpOjPRfEHIhO6G331Qw==@nongnu.org
X-Gm-Message-State: AOJu0YxeaGwm3ewurxYKFBrMj7taPa0CZN1qHAjXL5FijUfhtR7z/8iK
 MqZBMZu7EitfGO5N8ejNW7TG+W1eKxmCKhLeL8/P3AD7lOsKm5ynSKsapR1oinF2juk=
X-Gm-Gg: ATEYQzybyJp+jU/pYuAyyw4ycmcW9v6NjeQp3PbN5MM/vZsQSztQFQ2qnRCCsgbeMNH
 WiE+VfE9ytL0p4CYSGHAfRRKRPkPwBe8e5+JapGv06Hlgx2xL6uxvcfvQzK/kbPmyKIhArAoFjo
 sgbFC2yj4w6eMbDLF2221dut4bru4w3UnK133vEZzbtJTr3wUvxQlFXsusapeqaJ1zNJJ5Wq9n4
 QkB/4vZM3OQdpzMNZGeiVqK6juXlB5J//2IgSq4rP5h4dw6FfmO0tCgNQ4MXmNC1ognPjlVYrLG
 WpW46erg/Aldw4n1P/JmuC2/A6UQyaoaXp0iophdseObk6QeKiwTA8/4IYmlnoS84TnO1koNwq+
 7ZaZnEIciZV887WczSBgo+EcwTcvm0zjMUWKMfZOOFnq+Y1XOl0KdmdX+aM5z9Gj8J2WPv/AnJY
 xhUk7iMVxOrg2CBfaOqR5QraU=
X-Received: by 2002:a17:907:7205:b0:b93:6360:9071 with SMTP id
 a640c23a62f3a-b937580caaemr6506566b.2.1772131985716; 
 Thu, 26 Feb 2026 10:53:05 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935aede363sm79463466b.60.2026.02.26.10.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 10:53:04 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9AE8C5F8BC;
 Thu, 26 Feb 2026 18:53:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 2/7] tests/docker: migrate legacy-test-cross compilers to
 trixie
Date: Thu, 26 Feb 2026 18:52:57 +0000
Message-ID: <20260226185303.1920021-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226185303.1920021-1-alex.bennee@linaro.org>
References: <20260226185303.1920021-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

The bugs have evidently been fixed in the latest release so we can
migrate the laggards into how all-test-cross container and remove the
legacy hacks. They are also packaged for the main architectures so we
don't need to jump through the amd64 hoops.

Suggested-by: John Snow <jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                                     | 10 +---
 .gitlab-ci.d/buildtest.yml                    | 12 -----
 .gitlab-ci.d/container-cross.yml              |  6 ---
 .gitlab-ci.d/containers.yml                   |  1 -
 .../dockerfiles/debian-all-test-cross.docker  |  8 ++-
 .../debian-legacy-test-cross.docker           | 51 -------------------
 tests/lcitool/refresh                         |  8 ++-
 7 files changed, 13 insertions(+), 83 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-legacy-test-cross.docker

diff --git a/configure b/configure
index c4837eba2b1..683813473e9 100755
--- a/configure
+++ b/configure
@@ -1450,7 +1450,7 @@ probe_target_compiler() {
         container_image=debian-all-test-cross
         container_cross_prefix=aarch64-linux-gnu-
         ;;
-      hppa|m68k|mips|riscv64|sparc64)
+      alpha|hppa|m68k|mips|riscv64|sh4|sparc64)
         container_image=debian-all-test-cross
         ;;
       mips64)
@@ -1462,14 +1462,6 @@ probe_target_compiler() {
         container_cross_prefix=powerpc${target_arch#ppc}-linux-gnu-
         ;;
 
-      # debian-legacy-test-cross architectures (need Debian 11)
-      # - libc6.1-dev-alpha-cross: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054412
-      # - sh4-linux-user: binaries don't run with bookworm compiler
-
-      alpha|sh4)
-        container_image=debian-legacy-test-cross
-        ;;
-
       # architectures with individual containers
 
       aarch64)
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 1b656b9eb08..fef19c2d5da 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -376,18 +376,6 @@ build-user-static:
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system --static
-      --target-list-exclude=alpha-linux-user,sh4-linux-user
-    MAKE_CHECK_ARGS: check-tcg
-
-# targets stuck on older compilers
-build-legacy:
-  extends: .native_build_job_template
-  needs:
-    - job: amd64-debian-legacy-cross-container
-  variables:
-    IMAGE: debian-legacy-test-cross
-    TARGETS: alpha-linux-user alpha-softmmu sh4-linux-user
-    CONFIGURE_ARGS: --disable-tools
     MAKE_CHECK_ARGS: check-tcg
 
 build-user-hexagon:
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 2a0cea6ce1a..92a7f1c1b47 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -10,12 +10,6 @@ amd64-debian-user-cross-container:
   variables:
     NAME: debian-all-test-cross
 
-amd64-debian-legacy-cross-container:
-  extends: .container_job_template
-  stage: containers
-  variables:
-    NAME: debian-legacy-test-cross
-
 arm64-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 6aeccf8be0c..c8b8e44ad86 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -45,7 +45,6 @@ weekly-container-builds:
     # cross
     - amd64-debian-cross-container
     - amd64-debian-user-cross-container
-    - amd64-debian-legacy-cross-container
     - arm64-debian-cross-container
     - hexagon-cross-container
     - loongarch-debian-cross-container
diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index 1823233438a..b73776d95b5 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -64,6 +64,8 @@ ENV AVAILABLE_COMPILERS gcc-aarch64-linux-gnu \
   libc6-dev-arm64-cross \
   gcc-arm-linux-gnueabihf \
   libc6-dev-armhf-cross \
+  gcc-alpha-linux-gnu \
+  libc6.1-dev-alpha-cross \
   gcc-mips-linux-gnu \
   libc6-dev-mips-cross \
   gcc-mips64-linux-gnuabi64 \
@@ -77,7 +79,9 @@ ENV AVAILABLE_COMPILERS gcc-aarch64-linux-gnu \
   gcc-riscv64-linux-gnu \
   libc6-dev-riscv64-cross \
   gcc-s390x-linux-gnu \
-  libc6-dev-s390x-cross
+  libc6-dev-s390x-cross\
+  gcc-sh4-linux-gnu \
+  libc6-dev-sh4-cross
 RUN if dpkg-architecture -e amd64; then \
   export AVAILABLE_COMPILERS="${AVAILABLE_COMPILERS} gcc-hppa-linux-gnu libc6-dev-hppa-cross"; \
   export AVAILABLE_COMPILERS="${AVAILABLE_COMPILERS} gcc-m68k-linux-gnu libc6-dev-m68k-cross"; \
@@ -90,7 +94,7 @@ apt install -y --no-install-recommends \
 ${AVAILABLE_COMPILERS} && \
 dpkg-query --showformat '${Package}_${Version}_${Architecture}' --show > /packages.txt
 ENV QEMU_CONFIGURE_OPTS --disable-docs
-ENV DEF_TARGET_LIST aarch64-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sparc64-linux-user
+ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-legacy-test-cross.docker b/tests/docker/dockerfiles/debian-legacy-test-cross.docker
deleted file mode 100644
index 5a6616b7d39..00000000000
--- a/tests/docker/dockerfiles/debian-legacy-test-cross.docker
+++ /dev/null
@@ -1,51 +0,0 @@
-# Docker legacy cross-compiler target (tests and minimal qemu)
-#
-# Compilers for some of our older targets which we cant currently
-# upgrade. Currently:
-#
-#   libc6.1-dev-alpha-cross: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054412
-#   sh4-linux-user: binaries don't run with bookworm compiler
-#
-# As we are targeting check-tcg here we only need minimal qemu
-# dependencies and the relevant cross compilers.
-
-FROM docker.io/library/debian:11-slim
-
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
-
-RUN export DEBIAN_FRONTEND=noninteractive && \
-    apt-get update && \
-    apt-get install -y eatmydata && \
-    eatmydata apt-get dist-upgrade -y && \
-    apt build-dep -yy qemu
-
-# Add extra build tools and as many cross compilers as we can for testing
-RUN DEBIAN_FRONTEND=noninteractive eatmydata \
-        apt install -y --no-install-recommends \
-        bison \
-        ccache \
-        clang  \
-        flex \
-        git \
-        ninja-build \
-        gcc-alpha-linux-gnu \
-        libc6.1-dev-alpha-cross \
-        gcc-sh4-linux-gnu \
-        libc6-dev-sh4-cross \
-        python3-pip \
-        python3-setuptools \
-        python3-venv \
-        python3-wheel && \
-        dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt
-
-RUN /usr/bin/pip3 install tomli
-
-ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
-ENV DEF_TARGET_LIST alpha-linux-user,sh4-linux-user
-ENV MAKE /usr/bin/make
-# As a final step configure the user (if env is defined)
-ARG USER
-ARG UID
-RUN if [ "${USER}" ]; then \
-  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 8f0aa3fa343..c74345e03d0 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -172,6 +172,8 @@ debian_all_test_cross_compilers = [
     "  libc6-dev-arm64-cross \\\n",
     "  gcc-arm-linux-gnueabihf \\\n",
     "  libc6-dev-armhf-cross \\\n",
+    "  gcc-alpha-linux-gnu \\\n"
+    "  libc6.1-dev-alpha-cross \\\n"
     "  gcc-mips-linux-gnu \\\n",
     "  libc6-dev-mips-cross \\\n",
     "  gcc-mips64-linux-gnuabi64 \\\n",
@@ -185,7 +187,9 @@ debian_all_test_cross_compilers = [
     "  gcc-riscv64-linux-gnu \\\n",
     "  libc6-dev-riscv64-cross \\\n",
     "  gcc-s390x-linux-gnu \\\n",
-    "  libc6-dev-s390x-cross\n",
+    "  libc6-dev-s390x-cross\\\n",
+    "  gcc-sh4-linux-gnu \\\n",
+    "  libc6-dev-sh4-cross\n",
     "RUN if dpkg-architecture -e amd64; then \\\n",
     "  export AVAILABLE_COMPILERS=\"${AVAILABLE_COMPILERS} gcc-hppa-linux-gnu libc6-dev-hppa-cross\"; \\\n",
     "  export AVAILABLE_COMPILERS=\"${AVAILABLE_COMPILERS} gcc-m68k-linux-gnu libc6-dev-m68k-cross\"; \\\n",
@@ -198,7 +202,7 @@ debian_all_test_cross_compilers = [
     "${AVAILABLE_COMPILERS} && \\\n",
     "dpkg-query --showformat '${Package}_${Version}_${Architecture}' --show > /packages.txt\n",
     "ENV QEMU_CONFIGURE_OPTS --disable-docs\n",
-    "ENV DEF_TARGET_LIST aarch64-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sparc64-linux-user\n",
+    "ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user\n",
 ]
 
 def cross_build(prefix, targets):
-- 
2.47.3


