Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k6-20020adff286000000b0032da8fb0d05sm6071554wro.110.2023.10.29.07.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 07:50:40 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 89FDD656E6;
	Sun, 29 Oct 2023 14:50:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Brad Smith <brad@comstyle.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Kyle Evans <kevans@freebsd.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 15/19] tests/docker: upgrade debian-all-test-cross to bookworm
Date: Sun, 29 Oct 2023 14:50:29 +0000
Message-Id: <20231029145033.592566-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029145033.592566-1-alex.bennee@linaro.org>
References: <20231029145033.592566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Rtm5qwEgJ2Re

This requires a few more tweaks than usual as:

  - the default sources format has changed
  - bring in python3-tomli from the repos
  - split base install from cross compilers
  - also include libclang-rt-dev for sanitiser builds

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231028103311.347104-14-alex.bennee@linaro.org>
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
