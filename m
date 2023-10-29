Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s10-20020a5d69ca000000b00323287186aasm6075663wrw.32.2023.10.29.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 07:50:36 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 850215F7A5;
	Sun, 29 Oct 2023 14:50:34 +0000 (GMT)
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
Subject: [PATCH v2 05/19] gitlab: add build-loongarch to matrix
Date: Sun, 29 Oct 2023 14:50:19 +0000
Message-Id: <20231029145033.592566-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029145033.592566-1-alex.bennee@linaro.org>
References: <20231029145033.592566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8nRcYjDcEA6A

We have the compiler and with a few updates a container that can build
QEMU so we should at least run the check-tcg smoke tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml                    |  9 ++++++++
 .gitlab-ci.d/container-cross.yml              |  6 +++++
 tests/docker/Makefile.include                 |  1 -
 .../dockerfiles/debian-loongarch-cross.docker | 22 ++++++++++++++++++-
 4 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 5e9cbf9385..9500ea6e2c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -303,6 +303,15 @@ build-some-softmmu:
     TARGETS: arm-softmmu aarch64-softmmu i386-softmmu riscv64-softmmu
       s390x-softmmu x86_64-softmmu
     MAKE_CHECK_ARGS: check-tcg
+
+build-loongarch64:
+  extends: .native_build_job_template
+  needs:
+    job: loongarch-debian-cross-container
+  variables:
+    IMAGE: debian-loongarch-cross
+    CONFIGURE_ARGS: --disable-tools --enable-debug
+    TARGETS: loongarch64-linux-user loongarch64-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
 # We build tricore in a very minimal tricore only container
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 80c540230a..d200f3e00d 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -52,6 +52,12 @@ hppa-debian-cross-container:
   variables:
     NAME: debian-hppa-cross
 
+loongarch-debian-cross-container:
+  extends: .container_job_template
+  stage: containers
+  variables:
+    NAME: debian-loongarch-cross
+
 m68k-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ab68b2dbad..5635d1537f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -125,7 +125,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
-DOCKER_PARTIAL_IMAGES += debian-loongarch-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-mips-cross
diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
index b4bf265717..b25e779a2c 100644
--- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -9,22 +9,42 @@ FROM docker.io/library/debian:11-slim
 # Duplicate deb line as deb-src
 RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    apt build-dep -yy qemu
+
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt-get install -y --no-install-recommends \
         build-essential \
+        bison \
         ca-certificates \
+        ccache \
+        clang  \
+        flex \
         curl \
         gettext \
         git \
-        python3-minimal
+        ninja-build \
+        python3-pip \
+        python3-setuptools \
+        python3-venv \
+        python3-wheel
+
+RUN /usr/bin/pip3 install tomli
 
 RUN curl -#SL https://github.com/loongson/build-tools/releases/download/2023.08.08/CLFS-loongarch64-8.1-x86_64-cross-tools-gcc-glibc.tar.xz \
     | tar -xJC /opt
 
 ENV PATH $PATH:/opt/cross-tools/bin
 ENV LD_LIBRARY_PATH /opt/cross-tools/lib:/opt/cross-tools/loongarch64-unknown-linux-gnu/lib:$LD_LIBRARY_PATH
+
+ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
+ENV DEF_TARGET_LIST loongarch64-linux-user,loongarch-softmmu
+
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
-- 
2.39.2
