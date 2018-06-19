Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 84-v6sm606727wme.16.2018.06.19.09.01.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jun 2018 09:01:49 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7F69A3E0C4D;
	Tue, 19 Jun 2018 16:44:37 +0100 (BST)
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
Subject: [PULL 24/56] tests/tcg/arm: fix up test-arm-iwmmxt test
Date: Tue, 19 Jun 2018 16:44:03 +0100
Message-Id: <20180619154435.18898-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619154435.18898-1-alex.bennee@linaro.org>
References: <20180619154435.18898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TSAjBs5/MnEU

We need to rename the source file to a .S so we can do a single-line
assemble and link invocation. We also specify the additional CFLAGS
for the compile as it's a non-standard ARM binary.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[rth: force fpu configuration]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v4
  - include rth's -mfpu=fpv4-sp-d16
v5
  - merge fixes

diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 0312293dca..cadb385890 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -8,9 +8,14 @@ ARM_SRC=$(SRC_PATH)/tests/tcg/arm
 # Set search path for all sources
 VPATH 		+= $(ARM_SRC)
 
+TESTS += hello-arm test-arm-iwmmxt
 
 hello-arm: CFLAGS+=-marm -ffreestanding
 hello-arm: LDFLAGS+=-nostdlib
 
+test-arm-iwmmxt: CFLAGS+=-marm -march=iwmmxt -mabi=aapcs -mfpu=fpv4-sp-d16
+test-arm-iwmmxt: test-arm-iwmmxt.S
+	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+
 # On ARM Linux only supports 4k pages
 EXTRA_RUNS+=run-test-mmap-4096
diff --git a/tests/tcg/arm/test-arm-iwmmxt.s b/tests/tcg/arm/test-arm-iwmmxt.S
similarity index 100%
rename from tests/tcg/arm/test-arm-iwmmxt.s
rename to tests/tcg/arm/test-arm-iwmmxt.S
-- 
2.17.1
