Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g192-v6sm7539421wmd.36.2018.05.17.10.53.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 May 2018 10:53:52 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 0C9EF3E0ED1;
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
Subject: [PATCH v4 28/49] tests/tcg/arm: fix up test-arm-iwmmxt test
Date: Thu, 17 May 2018 18:46:57 +0100
Message-Id: <20180517174718.10107-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517174718.10107-1-alex.bennee@linaro.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hy8PsNzrC+Jp

We need to rename the source file to a .S so we can do a single-line
assemble and link invocation. We also specify the additional CFLAGS
for the compile as it's a non-standard ARM binary.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[rth: force fpu configuration]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---
v4
  - include rth's -mfpu=fpv4-sp-d16
---
 tests/tcg/arm/Makefile.target                          | 5 +++++
 tests/tcg/arm/{test-arm-iwmmxt.s => test-arm-iwmmxt.S} | 0
 2 files changed, 5 insertions(+)
 rename tests/tcg/arm/{test-arm-iwmmxt.s => test-arm-iwmmxt.S} (100%)

diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index bc6962ecc6..1ef5d79fe3 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -8,6 +8,11 @@ ARM_SRC=$(SRC_PATH)/tests/tcg/arm
 # Set search path for all sources
 VPATH 		+= $(ARM_SRC)
 
+TESTS += hello-arm test-arm-iwmmxt
 
 hello-arm: CFLAGS+=-marm -ffreestanding
 hello-arm: LDFLAGS+=-nostdlib
+
+test-arm-iwmmxt: CFLAGS+=-marm -march=iwmmxt -mabi=aapcs -mfpu=fpv4-sp-d16
+test-arm-iwmmxt: test-arm-iwmmxt.S
+	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
diff --git a/tests/tcg/arm/test-arm-iwmmxt.s b/tests/tcg/arm/test-arm-iwmmxt.S
similarity index 100%
rename from tests/tcg/arm/test-arm-iwmmxt.s
rename to tests/tcg/arm/test-arm-iwmmxt.S
-- 
2.17.0
