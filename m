Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p8-20020a7bcc88000000b003fb225d414fsm13226166wma.21.2023.06.30.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:04:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3B04E1FFC5;
	Fri, 30 Jun 2023 19:04:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Erik Skultety <eskultet@redhat.com>
Subject: [PATCH v4 12/38] tests/lcitool: Bump fedora container versions
Date: Fri, 30 Jun 2023 19:03:57 +0100
Message-Id: <20230630180423.558337-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bVBh7xTYrXTX

From: Erik Skultety <eskultet@redhat.com>

Fedora 37 -> 38

Signed-off-by: Erik Skultety <eskultet@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230627160943.2956928-13-alex.bennee@linaro.org>
Message-Id: <c9b00e573a7a80fc6ce5c68595382f5c916a9195.1685528076.git.eskultet@redhat.com>
[AJB: Dropped alpine (in prev commit), reflow commit msg]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora-win32-cross.docker | 4 ++--
 tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
 tests/docker/dockerfiles/fedora.docker             | 4 ++--
 tests/lcitool/refresh                              | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index dc72ae9cc9..a0a3cd9e5b 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross mingw32 fedora-37 qemu
+#  $ lcitool dockerfile --layers all --cross mingw32 fedora-38 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:37
+FROM registry.fedoraproject.org/fedora:38
 
 RUN dnf install -y nosync && \
     printf '#!/bin/sh\n\
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 7eb4a5dba2..b6c1a6a339 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross mingw64 fedora-37 qemu
+#  $ lcitool dockerfile --layers all --cross mingw64 fedora-38 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:37
+FROM registry.fedoraproject.org/fedora:38
 
 RUN dnf install -y nosync && \
     printf '#!/bin/sh\n\
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 3a69eefdda..8a35a17617 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all fedora-37 qemu
+#  $ lcitool dockerfile --layers all fedora-38 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:37
+FROM registry.fedoraproject.org/fedora:38
 
 RUN dnf install -y nosync && \
     printf '#!/bin/sh\n\
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 5d36a62b10..5e06fb2cf5 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -119,7 +119,7 @@ try:
     generate_dockerfile("centos8", "centos-stream-8")
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
-    generate_dockerfile("fedora", "fedora-37")
+    generate_dockerfile("fedora", "fedora-38")
     generate_dockerfile("opensuse-leap", "opensuse-leap-15")
     generate_dockerfile("ubuntu2004", "ubuntu-2004")
     generate_dockerfile("ubuntu2204", "ubuntu-2204")
@@ -169,12 +169,12 @@ try:
                         trailer=cross_build("s390x-linux-gnu-",
                                             "s390x-softmmu,s390x-linux-user"))
 
-    generate_dockerfile("fedora-win32-cross", "fedora-37",
+    generate_dockerfile("fedora-win32-cross", "fedora-38",
                         cross="mingw32",
                         trailer=cross_build("i686-w64-mingw32-",
                                             "i386-softmmu"))
 
-    generate_dockerfile("fedora-win64-cross", "fedora-37",
+    generate_dockerfile("fedora-win64-cross", "fedora-38",
                         cross="mingw64",
                         trailer=cross_build("x86_64-w64-mingw32-",
                                             "x86_64-softmmu"))
-- 
2.39.2
