Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w15sm3053551wmi.35.2020.05.27.07.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 07:54:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6D4081FF90;
	Wed, 27 May 2020 15:54:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 04/12] tests/tcg: fix invocation of the memory record/replay tests
Date: Wed, 27 May 2020 15:54:47 +0100
Message-Id: <20200527145455.2550-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527145455.2550-1-alex.bennee@linaro.org>
References: <20200527145455.2550-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uJ1BKTesdcBt

I'm not sure when this broke but we should use EXTRA_RUNS for
"virtual" tests which are not generated from the binary names.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Message-Id: <20200520140541.30256-5-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 71f72cfbe34..1057a8ac498 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -61,7 +61,7 @@ run-memory-replay: memory-replay run-memory-record
 	   	  $(QEMU_OPTS) memory, \
 	  "$< on $(TARGET_NAME)")
 
-EXTRA_TESTS+=memory-record memory-replay
+EXTRA_RUNS+=run-memory-replay
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
 pauth-3: CFLAGS += -march=armv8.3-a
-- 
2.20.1
