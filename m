Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z20-20020a05600c221400b003f8f8fc3c32sm2187755wml.31.2023.06.23.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:21:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2EC0B1FFBE;
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
Subject: [PATCH 14/26] tests/lcitool: add an explicit gcc-native package
Date: Fri, 23 Jun 2023 13:20:48 +0100
Message-Id: <20230623122100.1640995-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623122100.1640995-1-alex.bennee@linaro.org>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eua8/6ueNJtI

We need a native compiler to build the hexagon codegen tools. In our
current images we already have a gcc as a side effect of a broken
dependency between gcovr and lcov but this will be fixed when we move
to bookworm. See
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=987818 for details.

Update the packages while we are at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 1 +
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 1 +
 tests/docker/dockerfiles/debian-armel-cross.docker    | 1 +
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 1 +
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 1 +
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 1 +
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 1 +
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 1 +
 tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 +
 tests/lcitool/projects/qemu.yml                       | 1 +
 11 files changed, 11 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 40a2b6acc4..016c2321f1 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       exuberant-ctags \
                       findutils \
                       flex \
+                      gcc \
                       gcovr \
                       gettext \
                       git \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index c99300bbfa..3c114efa11 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       exuberant-ctags \
                       findutils \
                       flex \
+                      gcc \
                       gcovr \
                       gettext \
                       git \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index 5db5c78b31..dfbd47db89 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       exuberant-ctags \
                       findutils \
                       flex \
+                      gcc \
                       gcovr \
                       gettext \
                       git \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index ae6600b25f..4e0084e896 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       exuberant-ctags \
                       findutils \
                       flex \
+                      gcc \
                       gcovr \
                       gettext \
                       git \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index daa2d48e36..88adf333e9 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       exuberant-ctags \
                       findutils \
                       flex \
+                      gcc \
                       gcovr \
                       gettext \
                       git \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 5af04e2054..256e8b5dfe 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       exuberant-ctags \
                       findutils \
                       flex \
+                      gcc \
                       gcovr \
                       gettext \
                       git \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 1eeba7fcab..4d19cd2bd7 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       exuberant-ctags \
                       findutils \
                       flex \
+                      gcc \
                       gcovr \
                       gettext \
                       git \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 52e89a6dab..642bbde3d1 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       exuberant-ctags \
                       findutils \
                       flex \
+                      gcc \
                       gcovr \
                       gettext \
                       git \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index a0a3cd9e5b..e3dfd68bed 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -29,6 +29,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                diffutils \
                findutils \
                flex \
+               gcc \
                gcovr \
                git \
                glib2-devel \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index b6c1a6a339..0e15c9643a 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -29,6 +29,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                diffutils \
                findutils \
                flex \
+               gcc \
                gcovr \
                git \
                glib2-devel \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 566db8313b..21fd3d2cf9 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -24,6 +24,7 @@ packages:
  - fuse3
  - g++
  - gcc
+ - gcc-native
  - gcovr
  - gettext
  - glib2
-- 
2.39.2
