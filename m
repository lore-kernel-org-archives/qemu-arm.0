Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c191100b003dd1c45a7b0sm3432149wmq.23.2023.02.15.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 66D961FFBE;
	Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Darren Kenny <darren.kenny@oracle.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
Date: Wed, 15 Feb 2023 19:25:25 +0000
Message-Id: <20230215192530.299263-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g0Q3f4GQiD9r

The 22.04 LTS release has been out for almost a year now so its time
to update all the remaining images to the current LTS. We can also
drop some hacks we need for older clang TSAN support.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing.rst                        |  4 ++--
 .gitlab-ci.d/buildtest.yml                    | 22 +++++++++----------
 .gitlab-ci.d/containers.yml                   |  4 ++--
 .../{ubuntu2004.docker => ubuntu2204.docker}  | 16 +++++---------
 tests/docker/test-tsan                        |  2 +-
 tests/lcitool/refresh                         | 10 +--------
 6 files changed, 23 insertions(+), 35 deletions(-)
 rename tests/docker/dockerfiles/{ubuntu2004.docker => ubuntu2204.docker} (91%)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e10c47b5a7..309a575abe 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -574,13 +574,13 @@ https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual
 
 Thread Sanitizer in Docker
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-TSan is currently supported in the ubuntu2004 docker.
+TSan is currently supported in the ubuntu2204 docker.
 
 The test-tsan test will build using TSan and then run make check.
 
 .. code::
 
-  make docker-test-tsan@ubuntu2004
+  make docker-test-tsan@ubuntu2204
 
 TSan warnings under docker are placed in files located at build/tsan/.
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8f332fc36f..be319ab2d0 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -38,9 +38,9 @@ avocado-system-alpine:
 build-system-ubuntu:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-capstone
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
@@ -56,7 +56,7 @@ check-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     MAKE_CHECK_ARGS: check
 
 avocado-system-ubuntu:
@@ -65,7 +65,7 @@ avocado-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-debian:
@@ -459,10 +459,10 @@ avocado-cfi-x86_64:
 tsan-build:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
+    IMAGE: ubuntu2204
+    CONFIGURE_ARGS: --enable-tsan --cc=clang --cxx=clang++
           --enable-trace-backends=ust --enable-fdt=system --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
@@ -471,10 +471,10 @@ tsan-build:
 gcov:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   timeout: 80m
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-gcov
     TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
     MAKE_CHECK_ARGS: check
@@ -539,9 +539,9 @@ build-tci:
 build-coroutine-sigaltstack:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
                     --enable-trace-backends=ftrace
     MAKE_CHECK_ARGS: check-unit
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 96d2a3b58b..8637a13d86 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -13,10 +13,10 @@ amd64-debian-container:
   variables:
     NAME: debian-amd64
 
-amd64-ubuntu2004-container:
+amd64-ubuntu2204-container:
   extends: .container_job_template
   variables:
-    NAME: ubuntu2004
+    NAME: ubuntu2204
 
 amd64-opensuse-leap-container:
   extends: .container_job_template
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2204.docker
similarity index 91%
rename from tests/docker/dockerfiles/ubuntu2004.docker
rename to tests/docker/dockerfiles/ubuntu2204.docker
index f34d88d33d..30b9e56793 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
+#  $ lcitool dockerfile --layers all ubuntu-2204 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/ubuntu:20.04
+FROM docker.io/library/ubuntu:22.04
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get update && \
@@ -14,7 +14,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       bash \
                       bc \
                       bison \
-                      bsdmainutils \
+                      bsdextrautils \
                       bzip2 \
                       ca-certificates \
                       ccache \
@@ -36,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libasan5 \
                       libasound2-dev \
                       libattr1-dev \
+                      libbpf-dev \
                       libbrlapi-dev \
                       libbz2-dev \
                       libc6-dev \
@@ -90,6 +91,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libtasn1-6-dev \
                       libubsan1 \
                       libudev-dev \
+                      liburing-dev \
                       libusb-1.0-0-dev \
                       libusbredirhost-dev \
                       libvdeplug-dev \
@@ -100,6 +102,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       llvm \
                       locales \
                       make \
+                      meson \
                       multipath-tools \
                       ncat \
                       nettle-dev \
@@ -111,11 +114,9 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-opencv \
                       python3-pillow \
                       python3-pip \
-                      python3-setuptools \
                       python3-sphinx \
                       python3-sphinx-rtd-theme \
                       python3-venv \
-                      python3-wheel \
                       python3-yaml \
                       rpm2cpio \
                       sed \
@@ -139,13 +140,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3 install meson==0.56.0
-
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-# Apply patch https://reviews.llvm.org/D75820
-# This is required for TSan in clang-10 to compile with QEMU.
-RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h
diff --git a/tests/docker/test-tsan b/tests/docker/test-tsan
index 53d90d2f79..f6d6590e39 100755
--- a/tests/docker/test-tsan
+++ b/tests/docker/test-tsan
@@ -21,7 +21,7 @@ setup_tsan()
     tsan_log_dir="/tmp/qemu-test/build/tsan"
     mkdir -p $tsan_log_dir > /dev/null || true
     EXTRA_CONFIGURE_OPTS="${EXTRA_CONFIGURE_OPTS} --enable-tsan \
-                          --cc=clang-10 --cxx=clang++-10 \
+                          --cc=clang --cxx=clang++ \
                           --disable-werror --extra-cflags=-O0"
     # detect deadlocks is false currently simply because
     # TSan crashes immediately with deadlock detector enabled.
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index a5ea0efc3b..eeee9a7b34 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -69,13 +69,6 @@ def generate_cirrus(target, trailer=None):
     generate(filename, cmd, trailer)
 
 
-ubuntu2004_tsanhack = [
-    "# Apply patch https://reviews.llvm.org/D75820\n",
-    "# This is required for TSan in clang-10 to compile with QEMU.\n",
-    "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"
-]
-
-
 # Netmap still needs to be manually built as it is yet to be packaged
 # into a distro. We also add cscope and gtags which are used in the CI
 # test
@@ -113,8 +106,7 @@ try:
                         trailer="".join(debian11_extras))
     generate_dockerfile("fedora", "fedora-37")
     generate_dockerfile("opensuse-leap", "opensuse-leap-153")
-    generate_dockerfile("ubuntu2004", "ubuntu-2004",
-                        trailer="".join(ubuntu2004_tsanhack))
+    generate_dockerfile("ubuntu2204", "ubuntu-2204")
 
     #
     # Cross compiling builds
-- 
2.39.1
