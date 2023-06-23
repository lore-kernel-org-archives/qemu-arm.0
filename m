Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c230700b003fa7b39f13esm1935658wmo.12.2023.06.23.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:21:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6631D1FFC7;
	Fri, 23 Jun 2023 13:21:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Riku Voipio <riku.voipio@iki.fi>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leonardo Bras <leobras@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 16/26] tests/docker: convert riscv64-cross to lcitool
Date: Fri, 23 Jun 2023 13:20:50 +0100
Message-Id: <20230623122100.1640995-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623122100.1640995-1-alex.bennee@linaro.org>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Cw3FMeRufD2n

We still need to base this on Debian Sid until riscv64 is promoted to
a release architecture (or another distro provides a full cross
compile target). We use the new qemu-minimal project description to
avoid bringing in all the extra dependencies because every extra
package is another chance for sid to fail.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../dockerfiles/debian-riscv64-cross.docker   | 119 +++++++++++-------
 tests/lcitool/projects/qemu-minimal.yml       |   4 +
 tests/lcitool/refresh                         |  10 +-
 3 files changed, 87 insertions(+), 46 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 081404e014..a2d879ee1f 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -1,54 +1,85 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker cross-compiler target for riscv64
+#  $ lcitool dockerfile --layers all --cross riscv64 debian-sid qemu-minimal
 #
-# Currently the only distro that gets close to cross compiling riscv64
-# images is Debian Sid (with unofficial ports). As this is a moving
-# target we keep the library list minimal and are aiming to migrate
-# from this hack as soon as we are able.
-#
-FROM docker.io/library/debian:sid-slim
+# https://gitlab.com/libvirt/libvirt-ci
 
-# Add ports
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt update -yy && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt upgrade -yy
-
-# Install common build utilities
-RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
-    bison \
-    bc \
-    build-essential \
-    ca-certificates \
-    debian-ports-archive-keyring \
-    dpkg-dev \
-    flex \
-    gettext \
-    git \
-    libglib2.0-dev \
-    ninja-build \
-    pkg-config \
-    python3 \
-    python3-venv
+FROM docker.io/library/debian:sid-slim
 
-# Add ports and riscv64 architecture
-RUN echo "deb http://ftp.ports.debian.org/debian-ports/ sid main" >> /etc/apt/sources.list
-RUN dpkg --add-architecture riscv64
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      ca-certificates \
+                      ccache \
+                      findutils \
+                      flex \
+                      gcc \
+                      git \
+                      libglib2.0-dev \
+                      locales \
+                      make \
+                      meson \
+                      ninja-build \
+                      pkgconf \
+                      python3 \
+                      python3-venv \
+                      sed \
+                      tar && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
 
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-         gcc-riscv64-linux-gnu \
-         libc6-dev-riscv64-cross \
-         libfdt-dev:riscv64 \
-         libffi-dev:riscv64 \
-         libglib2.0-dev:riscv64 \
-         libpixman-1-dev:riscv64
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture riscv64 && \
+    eatmydata apt-get install debian-ports-archive-keyring && \
+    eatmydata echo 'deb http://ftp.ports.debian.org/debian-ports/ sid main' > /etc/apt/sources.list.d/ports.list && \
+    eatmydata echo 'deb http://ftp.ports.debian.org/debian-ports/ unreleased main' >> /etc/apt/sources.list.d/ports.list && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-riscv64-linux-gnu \
+                      gcc-riscv64-linux-gnu \
+                      libc6-dev:riscv64 \
+                      libfdt-dev:riscv64 \
+                      libffi-dev:riscv64 \
+                      libglib2.0-dev:riscv64 \
+                      libpixman-1-dev:riscv64 && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/riscv64-linux-gnu-gcc'\n\
+ar = '/usr/bin/riscv64-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/riscv64-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/riscv64-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'riscv64'\n\
+cpu = 'riscv64'\n\
+endian = 'little'\n" > /usr/local/share/meson/cross/riscv64-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/riscv64-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/riscv64-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/riscv64-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/riscv64-linux-gnu-gcc
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+ENV ABI "riscv64-linux-gnu"
+ENV MESON_OPTS "--cross-file=riscv64-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=riscv64-linux-gnu-
 ENV DEF_TARGET_LIST riscv64-softmmu,riscv64-linux-user
 # As a final step configure the user (if env is defined)
diff --git a/tests/lcitool/projects/qemu-minimal.yml b/tests/lcitool/projects/qemu-minimal.yml
index 507f1f6881..a977a51ab6 100644
--- a/tests/lcitool/projects/qemu-minimal.yml
+++ b/tests/lcitool/projects/qemu-minimal.yml
@@ -4,6 +4,8 @@ packages:
  - bash
  - bc
  - bison
+ - ccache
+ - findutils
  - flex
  - g++
  - gcc
@@ -21,3 +23,5 @@ packages:
  - pkg-config
  - python3
  - python3-venv
+ - sed
+ - tar
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 5e06fb2cf5..b54566edcc 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -63,12 +63,12 @@ add_user_mapping = [
     "  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi\n"
 ]
 
-def generate_dockerfile(host, target, cross=None, trailer=None):
+def generate_dockerfile(host, target, project="qemu", cross=None, trailer=None):
     filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
     cmd = lcitool_cmd + ["dockerfile"]
     if cross is not None:
         cmd.extend(["--cross", cross])
-    cmd.extend([target, "qemu"])
+    cmd.extend([target, project])
 
     if trailer is not None:
         trailer += "\n".join(add_user_mapping)
@@ -164,6 +164,12 @@ try:
                         trailer=cross_build("powerpc64le-linux-gnu-",
                                             "ppc64-softmmu,ppc64-linux-user"))
 
+    generate_dockerfile("debian-riscv64-cross", "debian-sid",
+                        project="qemu-minimal",
+                        cross="riscv64",
+                        trailer=cross_build("riscv64-linux-gnu-",
+                                            "riscv64-softmmu,riscv64-linux-user"))
+
     generate_dockerfile("debian-s390x-cross", "debian-11",
                         cross="s390x",
                         trailer=cross_build("s390x-linux-gnu-",
-- 
2.39.2
