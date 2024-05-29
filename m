Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc500a1sm730713466b.125.2024.05.29.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 09:09:38 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B65815FA92;
	Wed, 29 May 2024 17:09:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	John Snow <jsnow@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 07/10] tests/lcitool: bump to latest version
Date: Wed, 29 May 2024 17:09:31 +0100
Message-Id: <20240529160934.982373-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529160934.982373-1-alex.bennee@linaro.org>
References: <20240529160934.982373-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9FMtSxIQvskq

We have to simultaneously update a few bits on our side as lcitool has
already deprecated fedora-38, alpine-3.18 and centos-8-stream. However
there is no change to the package list yet.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fix typo s/lci-tool/lcitool/
---
 tests/docker/dockerfiles/alpine.docker             | 4 ++--
 tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
 tests/docker/dockerfiles/fedora.docker             | 4 ++--
 tests/lcitool/libvirt-ci                           | 2 +-
 tests/lcitool/refresh                              | 6 +++---
 tests/lcitool/targets/centos-stream-8.yml          | 3 ---
 6 files changed, 10 insertions(+), 13 deletions(-)
 delete mode 100644 tests/lcitool/targets/centos-stream-8.yml

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 554464f31e..b76cc2a35e 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all alpine-318 qemu
+#  $ lcitool dockerfile --layers all alpine-320 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/alpine:3.18
+FROM docker.io/library/alpine:3.20
 
 RUN apk update && \
     apk upgrade && \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 0f78711876..cce6739613 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross-arch mingw64 fedora-38 qemu,qemu-win-installer
+#  $ lcitool dockerfile --layers all --cross-arch mingw64 fedora-40 qemu,qemu-win-installer
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:38
+FROM registry.fedoraproject.org/fedora:40
 
 RUN dnf install -y nosync && \
     printf '#!/bin/sh\n\
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 098c894d10..bd51e1e149 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all fedora-38 qemu
+#  $ lcitool dockerfile --layers all fedora-40 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:38
+FROM registry.fedoraproject.org/fedora:40
 
 RUN dnf install -y nosync && \
     printf '#!/bin/sh\n\
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index cec6703971..a300a26c0d 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit cec67039719becbfbab866f9c23574f389cf9559
+Subproject commit a300a26c0d7f48544c40af268b3245ebd63c7351
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 789acefb75..ace4d08364 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -124,11 +124,11 @@ try:
     #
     # Standard native builds
     #
-    generate_dockerfile("alpine", "alpine-318")
+    generate_dockerfile("alpine", "alpine-320")
     generate_dockerfile("centos9", "centos-stream-9")
     generate_dockerfile("debian", "debian-12",
                         trailer="".join(debian12_extras))
-    generate_dockerfile("fedora", "fedora-38")
+    generate_dockerfile("fedora", "fedora-40")
     generate_dockerfile("opensuse-leap", "opensuse-leap-15")
     generate_dockerfile("ubuntu2204", "ubuntu-2204")
 
@@ -191,7 +191,7 @@ try:
                         trailer=cross_build("s390x-linux-gnu-",
                                             "s390x-softmmu,s390x-linux-user"))
 
-    generate_dockerfile("fedora-win64-cross", "fedora-38",
+    generate_dockerfile("fedora-win64-cross", "fedora-40",
                         project='qemu,qemu-win-installer',
                         cross="mingw64",
                         trailer=cross_build("x86_64-w64-mingw32-",
diff --git a/tests/lcitool/targets/centos-stream-8.yml b/tests/lcitool/targets/centos-stream-8.yml
deleted file mode 100644
index 6b11160fd1..0000000000
--- a/tests/lcitool/targets/centos-stream-8.yml
+++ /dev/null
@@ -1,3 +0,0 @@
-paths:
-  pip3: /usr/bin/pip3.8
-  python: /usr/bin/python3.8
-- 
2.39.2
