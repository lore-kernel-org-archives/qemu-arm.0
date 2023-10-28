Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c021a00b0040813e14b49sm7176737wmi.30.2023.10.28.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4FD735F7A3;
	Sat, 28 Oct 2023 11:33:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Brad Smith <brad@comstyle.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 13/17] tests/docker: upgrade debian-all-test-cross to bookworm
Date: Sat, 28 Oct 2023 11:33:07 +0100
Message-Id: <20231028103311.347104-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231028103311.347104-1-alex.bennee@linaro.org>
References: <20231028103311.347104-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kB26hY6rfVR8

This requires a few more tweaks than usual as:

  - the default sources format has changed
  - bring in python3-tomli from the repos
  - split base install from cross compilers
  - also include libclang-rt-dev for sanitiser builds

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../dockerfiles/debian-all-test-cross.docker  | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index 43cc083318..2cc7a24d4d 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -6,10 +6,10 @@
 # basic compilers for as many targets as possible. We shall use this
 # to build and run linux-user tests on GitLab
 #
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:12-slim
 
 # Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+RUN sed -in "s/Types: deb/Types: deb deb-src/g" /etc/apt/sources.list.d/debian.sources
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get update && \
@@ -25,7 +25,16 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         clang  \
         flex \
         git \
+        libclang-rt-dev \
         ninja-build \
+        python3-pip \
+        python3-setuptools \
+        python3-tomli \
+        python3-venv \
+        python3-wheel
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+        apt install -y --no-install-recommends \
         gcc-aarch64-linux-gnu \
         libc6-dev-arm64-cross \
         gcc-arm-linux-gnueabihf \
@@ -53,13 +62,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         gcc-s390x-linux-gnu \
         libc6-dev-s390x-cross \
         gcc-sparc64-linux-gnu \
-        libc6-dev-sparc64-cross \
-        python3-pip \
-        python3-setuptools \
-        python3-venv \
-        python3-wheel
+        libc6-dev-sparc64-cross
 
-RUN /usr/bin/pip3 install tomli
 
 ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
 ENV DEF_TARGET_LIST aarch64-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sparc64-linux-user
-- 
2.39.2
