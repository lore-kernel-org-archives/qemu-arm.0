Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d21sm54907067wrc.44.2019.02.28.12.25.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:25:44 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CD1E91FF8C;
	Thu, 28 Feb 2019 20:25:37 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 09/16] tests/docker: add fedora-cris-cross compilers
Date: Thu, 28 Feb 2019 20:25:30 +0000
Message-Id: <20190228202537.4638-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aZrlYWUIoOaa

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora-cris-cross.docker | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 tests/docker/dockerfiles/fedora-cris-cross.docker

diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/docker/dockerfiles/fedora-cris-cross.docker
new file mode 100644
index 0000000000..b168ada615
--- /dev/null
+++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
@@ -0,0 +1,8 @@
+#
+# Cross compiler for cris system tests
+#
+
+FROM fedora:latest
+ENV PACKAGES gcc-cris-linux-gnu
+RUN dnf install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.20.1
