Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n9sm6505994wmc.20.2021.06.04.11.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 88BB61FFC5;
	Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 46/99] target/arm: fix comments style of fp_exception_el before moving it
Date: Fri,  4 Jun 2021 16:52:19 +0100
Message-Id: <20210604155312.15902-47-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KnFHztCxgUfS

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 8372089260..d4cafdbd95 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -1625,13 +1625,15 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-/* Return the exception level to which FP-disabled exceptions should
+/*
+ * Return the exception level to which FP-disabled exceptions should
  * be taken, or 0 if FP is enabled.
  */
 int fp_exception_el(CPUARMState *env, int cur_el)
 {
 #ifndef CONFIG_USER_ONLY
-    /* CPACR and the CPTR registers don't exist before v6, so FP is
+    /*
+     * CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
      */
     if (!arm_feature(env, ARM_FEATURE_V6)) {
@@ -1654,7 +1656,8 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         return 0;
     }
 
-    /* The CPACR controls traps to EL1, or PL1 if we're 32 bit:
+    /*
+     * The CPACR controls traps to EL1, or PL1 if we're 32 bit:
      * 0, 2 : trap EL0 and EL1/PL1 accesses
      * 1    : trap only EL0 accesses
      * 3    : trap no accesses
@@ -1701,7 +1704,8 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         }
     }
 
-    /* For the CPTR registers we don't need to guard with an ARM_FEATURE
+    /*
+     * For the CPTR registers we don't need to guard with an ARM_FEATURE
      * check because zero bits in the registers mean "don't trap".
      */
 
-- 
2.20.1
