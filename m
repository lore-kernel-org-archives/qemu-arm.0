Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b003b4cba4ef71sm23492283wmb.41.2023.01.10.09.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:39:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D39191FFC2;
	Tue, 10 Jan 2023 17:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Ed Maste <emaste@freebsd.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 10/26] Update lcitool and fedora to 37
Date: Tue, 10 Jan 2023 17:39:06 +0000
Message-Id: <20230110173922.265055-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mf2w0Mel0pHE

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fedora 35 is EOL.

Update to upstream lcitool, that dropped f35 and added f37.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230110132700.833690-7-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora-win32-cross.docker | 4 ++--
 tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
 tests/docker/dockerfiles/fedora.docker             | 4 ++--
 tests/lcitool/libvirt-ci                           | 2 +-
 tests/lcitool/refresh                              | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 75383ba185..cc5d1ac4be 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross mingw32 fedora-35 qemu
+#  $ lcitool dockerfile --layers all --cross mingw32 fedora-37 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 98c03dc13b..cabbf4edfc 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross mingw64 fedora-35 qemu
+#  $ lcitool dockerfile --layers all --cross mingw64 fedora-37 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index d200c7fc10..f44b005000 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all fedora-35 qemu
+#  $ lcitool dockerfile --layers all fedora-37 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index e3eb28cf2e..319a534c22 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
+Subproject commit 319a534c220f53fc8670254cac25d6f662c82112
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index fa966e4009..a5ea0efc3b 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -111,7 +111,7 @@ try:
     generate_dockerfile("centos8", "centos-stream-8")
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
-    generate_dockerfile("fedora", "fedora-35")
+    generate_dockerfile("fedora", "fedora-37")
     generate_dockerfile("opensuse-leap", "opensuse-leap-153")
     generate_dockerfile("ubuntu2004", "ubuntu-2004",
                         trailer="".join(ubuntu2004_tsanhack))
@@ -161,12 +161,12 @@ try:
                         trailer=cross_build("s390x-linux-gnu-",
                                             "s390x-softmmu,s390x-linux-user"))
 
-    generate_dockerfile("fedora-win32-cross", "fedora-35",
+    generate_dockerfile("fedora-win32-cross", "fedora-37",
                         cross="mingw32",
                         trailer=cross_build("i686-w64-mingw32-",
                                             "i386-softmmu"))
 
-    generate_dockerfile("fedora-win64-cross", "fedora-35",
+    generate_dockerfile("fedora-win64-cross", "fedora-37",
                         cross="mingw64",
                         trailer=cross_build("x86_64-w64-mingw32-",
                                             "x86_64-softmmu"))
-- 
2.34.1
