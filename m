Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 141-v6sm8357189wmf.35.2018.05.17.10.47.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 May 2018 10:47:30 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 3336E3E0ED9;
	Thu, 17 May 2018 18:47:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: cota@braap.org,
	famz@redhat.com,
	berrange@redhat.com,
	f4bug@amsat.org,
	richard.henderson@linaro.org,
	balrogg@gmail.com,
	aurelien@aurel32.net,
	agraf@suse.de
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v4 30/49] tests/tcg: enable building for AArch64
Date: Thu, 17 May 2018 18:46:59 +0100
Message-Id: <20180517174718.10107-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517174718.10107-1-alex.bennee@linaro.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KR6Boh3GBiK7

We only have compilers for the (default) little endian variants.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - update MAINTAINERS
---
 MAINTAINERS                        | 1 +
 tests/tcg/aarch64/Makefile.include | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 tests/tcg/aarch64/Makefile.include

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e331c4db4..ee7f101890 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -136,6 +136,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
+F: tests/tcg/aarch64/
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
diff --git a/tests/tcg/aarch64/Makefile.include b/tests/tcg/aarch64/Makefile.include
new file mode 100644
index 0000000000..de32c91235
--- /dev/null
+++ b/tests/tcg/aarch64/Makefile.include
@@ -0,0 +1,8 @@
+# Makefile.include for AArch64 targets
+#
+# We don't have any bigendian build tools so we only use this for AArch64
+
+ifeq ($(TARGET_NAME),aarch64)
+DOCKER_IMAGE=debian-arm64-cross
+DOCKER_CROSS_COMPILER=aarch64-linux-gnu-gcc
+endif
-- 
2.17.0
