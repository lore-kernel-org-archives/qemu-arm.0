Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id t4-20020a05600001c400b002bdcce37d31sm1207378wrx.99.2023.01.26.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 03:31:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 249E91FFC9;
	Thu, 26 Jan 2023 11:22:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Robert Henry <robhenry@microsoft.com>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 25/35] tests/tcg: add memory-sve test for aarch64
Date: Thu, 26 Jan 2023 11:22:40 +0000
Message-Id: <20230126112250.2584701-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: biYzOn2r0WSO

This will be helpful in debugging problems with tracking SVE memory
accesses via the TCG plugins system.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Robert Henry <robhenry@microsoft.com>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Message-Id: <20230124180127.1881110-26-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index a1368905f5..df9747bae8 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -36,6 +36,13 @@ config-cc.mak: Makefile
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
+memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3 -fno-tree-loop-distribute-patterns
+
+TESTS+=memory-sve
+
 # Running
 QEMU_BASE_MACHINE=-M virt -cpu max -display none
 QEMU_OPTS+=$(QEMU_BASE_MACHINE) -semihosting-config enable=on,target=native,chardev=output -kernel
diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index e190b1efa6..f136363d2a 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -179,12 +179,13 @@ __start:
 	isb
 
 	/*
-	 * Enable FP registers. The standard C pre-amble will be
+	 * Enable FP/SVE registers. The standard C pre-amble will be
 	 * saving these and A-profile compilers will use AdvSIMD
 	 * registers unless we tell it not to.
 	*/
 	mrs	x0, cpacr_el1
 	orr	x0, x0, #(3 << 20)
+	orr	x0, x0, #(3 << 16)
 	msr	cpacr_el1, x0
 
 	/* Setup some stack space and enter the test code.
-- 
2.34.1
