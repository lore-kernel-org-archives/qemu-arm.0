Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p3-v6sm4156567wrn.31.2018.06.20.23.41.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jun 2018 23:41:56 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 6CA763E0CEF;
	Thu, 21 Jun 2018 07:26:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	cota@braap.org,
	famz@redhat.com,
	berrange@redhat.com,
	f4bug@amsat.org,
	richard.henderson@linaro.org,
	balrogg@gmail.com,
	aurelien@aurel32.net,
	agraf@suse.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PULL v2 26/57] tests/tcg: enable building for AArch64
Date: Thu, 21 Jun 2018 07:25:34 +0100
Message-Id: <20180621062605.941-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180621062605.941-1-alex.bennee@linaro.org>
References: <20180621062605.941-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HRfl+rgJT8oG

We only have compilers for the (default) little endian variants.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d233a43a..de1ae8423e 100644
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
2.17.1
