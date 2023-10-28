Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c220600b00407b93d8085sm7038650wml.27.2023.10.28.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4AA325F799;
	Sat, 28 Oct 2023 11:33:12 +0100 (BST)
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
Subject: [PATCH 03/17] gitlab: split alpha testing into a legacy container
Date: Sat, 28 Oct 2023 11:32:57 +0100
Message-Id: <20231028103311.347104-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231028103311.347104-1-alex.bennee@linaro.org>
References: <20231028103311.347104-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HXN1eJnCFSkk

The current bookworm compiler doesn't build the static binaries due to
bug #1054412 and it might be awhile before it gets fixes. The problem
of keeping older architecture compilers running isn't going to go away
so lets prepare the ground. Create a legacy container and move some
tests around so the others can get upgraded.

While checking the softmmu TCG tests I realised more had been added so
that makes up a little bit for the lost alpha-softmmu coverage.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml                    | 20 ++++++--
 .gitlab-ci.d/container-cross.yml              |  6 +++
 .../dockerfiles/debian-all-test-cross.docker  |  4 +-
 .../debian-legacy-test-cross.docker           | 46 +++++++++++++++++++
 4 files changed, 70 insertions(+), 6 deletions(-)
 create mode 100644 tests/docker/dockerfiles/debian-legacy-test-cross.docker

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 25af1bc41e..d670fb42b9 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -256,6 +256,7 @@ build-user:
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system
+      --target-list-exclude=alpha-linux-user
     MAKE_CHECK_ARGS: check-tcg
 
 build-user-static:
@@ -264,6 +265,18 @@ build-user-static:
     job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --disable-system --static
+      --target-list-exclude=alpha-linux-user
+    MAKE_CHECK_ARGS: check-tcg
+
+# targets stuck on older compilers
+build-user-legacy:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-legacy-cross-container
+  variables:
+    IMAGE: debian-legacy-test-cross
+    TARGETS: alpha-linux-user
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
@@ -278,6 +291,7 @@ build-user-hexagon:
     MAKE_CHECK_ARGS: check-tcg
 
 # Only build the softmmu targets we have check-tcg tests for
+# (skip alpha due to missing compilers, others need their own containers)
 build-some-softmmu:
   extends: .native_build_job_template
   needs:
@@ -285,7 +299,7 @@ build-some-softmmu:
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --enable-debug
-    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
+    TARGETS: arm-softmmu aarch64-softmmu i386-softmmu riscv64-softmmu s390x-softmmu xtensa-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
 # We build tricore in a very minimal tricore only container
@@ -318,7 +332,7 @@ clang-user:
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
-      --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
+      --target-list-exclude=alpha-linux-user,microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
       --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check-unit check-tcg
 
@@ -505,7 +519,7 @@ build-tci:
   variables:
     IMAGE: debian-all-test-cross
   script:
-    - TARGETS="aarch64 alpha arm hppa m68k microblaze ppc64 s390x x86_64"
+    - TARGETS="aarch64 arm hppa m68k microblaze ppc64 s390x x86_64"
     - mkdir build
     - cd build
     - ../configure --enable-tcg-interpreter --disable-docs --disable-gtk --disable-vnc
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 2848166ba3..80c540230a 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -16,6 +16,12 @@ amd64-debian-user-cross-container:
   variables:
     NAME: debian-all-test-cross
 
+amd64-debian-legacy-cross-container:
+  extends: .container_job_template
+  stage: containers
+  variables:
+    NAME: debian-legacy-test-cross
+
 arm64-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index 54e957d5e7..205173b0a5 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -28,8 +28,6 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         ninja-build \
         gcc-aarch64-linux-gnu \
         libc6-dev-arm64-cross \
-        gcc-alpha-linux-gnu \
-        libc6.1-dev-alpha-cross \
         gcc-arm-linux-gnueabihf \
         libc6-dev-armhf-cross \
         gcc-hppa-linux-gnu \
@@ -66,7 +64,7 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
 RUN /usr/bin/pip3 install tomli
 
 ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
-ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
+ENV DEF_TARGET_LIST aarch64-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
diff --git a/tests/docker/dockerfiles/debian-legacy-test-cross.docker b/tests/docker/dockerfiles/debian-legacy-test-cross.docker
new file mode 100644
index 0000000000..763d36dfe3
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-legacy-test-cross.docker
@@ -0,0 +1,46 @@
+# Docker legacy cross-compiler target (tests and minimal qemu)
+#
+# Compilers for some of our older targets which we cant currently
+# upgrade. Currently:
+#
+#   libc6.1-dev-alpha-cross: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054412
+#
+# As we are targeting check-tcg here we only need minimal qemu
+# dependencies and the relevant cross compilers.
+
+FROM docker.io/library/debian:11-slim
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    apt build-dep -yy qemu
+
+# Add extra build tools and as many cross compilers as we can for testing
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+        apt install -y --no-install-recommends \
+        bison \
+        ccache \
+        clang  \
+        flex \
+        git \
+        ninja-build \
+        gcc-alpha-linux-gnu \
+        libc6.1-dev-alpha-cross \
+        python3-pip \
+        python3-setuptools \
+        python3-venv \
+        python3-wheel
+
+RUN /usr/bin/pip3 install tomli
+
+ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
+ENV DEF_TARGET_LIST alpha-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
-- 
2.39.2
