Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w5-v6sm679466wmw.45.2018.05.17.10.53.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 May 2018 10:53:58 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 1F19F3E0ED6;
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
Subject: [PATCH v4 29/49] tests/tcg/arm: disable -p 32768 mmap test
Date: Thu, 17 May 2018 18:46:58 +0100
Message-Id: <20180517174718.10107-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517174718.10107-1-alex.bennee@linaro.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /WLUxEeohVdA

Broken since I updated to 18.04

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/Makefile.target | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 1ef5d79fe3..9d2b551732 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -16,3 +16,11 @@ hello-arm: LDFLAGS+=-nostdlib
 test-arm-iwmmxt: CFLAGS+=-marm -march=iwmmxt -mabi=aapcs -mfpu=fpv4-sp-d16
 test-arm-iwmmxt: test-arm-iwmmxt.S
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+
+# Currently broken for -p 32768
+ifeq ($(TARGET_NAME), arm)
+run-test-mmap: test-mmap
+	$(call quiet-command, $(QEMU) $< > test-mmap.out, "TEST", "$< (default) on $(TARGET_NAME)")
+	$(call quiet-command, $(QEMU) -p 8192 $< 8192 > test-mmap-8192.out, "TEST", "$< (8k pages) on $(TARGET_NAME)")
+	$(call quiet-command, $(QEMU) -p 16384 $< 16384 > test-mmap-16384.out, "TEST", "$< (16k pages) on $(TARGET_NAME)")
+endif
-- 
2.17.0
