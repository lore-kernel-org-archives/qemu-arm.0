Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v64sm8979316wmf.12.2019.09.19.10.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:19:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E179F1FF9C;
	Thu, 19 Sep 2019 18:10:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH  v2 12/16] tests/docker: Add fedora-win10sdk-cross image
Date: Thu, 19 Sep 2019 18:10:11 +0100
Message-Id: <20190919171015.12681-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +Nggb95Gwr5R

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190919105932.19412-2-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                 |  1 +
 .../dockerfiles/fedora-win10sdk-cross.docker  | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 tests/docker/dockerfiles/fedora-win10sdk-cross.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 3fc7a863e51..d796f71b63a 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -125,6 +125,7 @@ docker-image-debian-ppc64-cross: docker-image-debian10
 docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
+docker-image-fedora-win10sdk-cross: docker-image-fedora
 
 docker-image-travis: NOUSER=1
 
diff --git a/tests/docker/dockerfiles/fedora-win10sdk-cross.docker b/tests/docker/dockerfiles/fedora-win10sdk-cross.docker
new file mode 100644
index 00000000000..1aafdad483c
--- /dev/null
+++ b/tests/docker/dockerfiles/fedora-win10sdk-cross.docker
@@ -0,0 +1,21 @@
+#
+# Docker MinGW64 cross-compiler target with WHPX header installed
+#
+# This docker target builds on the Fedora 30 base image.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+FROM qemu:fedora
+
+# Install headers extracted by the Android folks from the win10sdk.iso:
+# https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk
+ENV WIN10SDK_INCDIR /usr/local/include/win10sdk
+RUN mkdir ${WIN10SDK_INCDIR} && \
+    for hdr in WinHvEmulation.h WinHvPlatformDefs.h WinHvPlatform.h; do \
+        curl -s "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/host/x86_64-w64-mingw32-4.8/+/1bde9c3b14f3a3b081ada6e32da9f2870671b46f/x86_64-w64-mingw32/include/${hdr}?format=TEXT" | base64 --decode > ${WIN10SDK_INCDIR}/${hdr}; \
+    done
+
+ENV QEMU_CONFIGURE_OPTS ${QEMU_CONFIGURE_OPTS} \
+    --cross-prefix=x86_64-w64-mingw32- \
+    --extra-cflags="-I ${WIN10SDK_INCDIR}" --disable-werror \
+    --enable-hax --enable-whpx
-- 
2.20.1
