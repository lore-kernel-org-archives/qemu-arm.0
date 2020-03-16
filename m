Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h10sm799676wrb.24.2020.03.16.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:21:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3CBFE1FF87;
	Mon, 16 Mar 2020 17:21:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v1 01/28] tests/docker: Install tools to cross-debug and build Linux kernels
Date: Mon, 16 Mar 2020 17:21:28 +0000
Message-Id: <20200316172155.971-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PxyQg1IfCotU

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We often run Linux kernels to test QEMU. We sometimes need
to build them manually to use non-default features. We only
miss the tiny 'bc' tool.

The ncurses library is helpful to run 'make menuconfig'.

Finally, gdb-multiarch allow us to debug a TCG guest when its
architecture is different than the host.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200212202738.12986-1-philmd@redhat.com>
---
 tests/docker/dockerfiles/debian10.docker | 3 +++
 tests/docker/dockerfiles/debian9.docker  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 5de79ae5527..2fcdc406e83 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -17,14 +17,17 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bc \
         bison \
         build-essential \
         ca-certificates \
         clang \
         dbus \
         flex \
+        gdb-multiarch \
         gettext \
         git \
+        libncurses5-dev \
         pkg-config \
         psmisc \
         python3 \
diff --git a/tests/docker/dockerfiles/debian9.docker b/tests/docker/dockerfiles/debian9.docker
index 8cbd742bb5f..92edbbf0f48 100644
--- a/tests/docker/dockerfiles/debian9.docker
+++ b/tests/docker/dockerfiles/debian9.docker
@@ -17,13 +17,16 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bc \
         bison \
         build-essential \
         ca-certificates \
         clang \
         flex \
+        gdb-multiarch \
         gettext \
         git \
+        libncurses5-dev \
         pkg-config \
         psmisc \
         python3 \
-- 
2.20.1
