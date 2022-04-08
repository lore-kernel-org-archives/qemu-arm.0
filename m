Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm11003039wmb.3.2022.04.08.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:47:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 37B641FFC3;
	Fri,  8 Apr 2022 17:47:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu,
	ma.mandourr@gmail.com,
	Luke.Craig@ll.mit.edu,
	cota@braap.org,
	aaron@os.amperecomputing.com,
	kuhn.chenqun@huawei.com,
	robhenry@microsoft.com,
	mahmoudabdalghany@outlook.com,
	fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 12/15] tests/tcg: add memory-sve test for aarch64
Date: Fri,  8 Apr 2022 17:47:39 +0100
Message-Id: <20220408164742.2844631-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5wBqGxwLh6RF

This will be helpful in debugging problems with tracking SVE memory
accesses via the TCG plugins system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Robert Henry <robhenry@microsoft.com>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 7 +++++++
 tests/tcg/aarch64/system/boot.S           | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index a7286ac295..cc02814065 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -31,6 +31,13 @@ LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
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
2.30.2
