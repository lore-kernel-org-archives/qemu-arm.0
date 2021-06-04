Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p1sm6127310wmc.11.2021.06.04.09.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5A4751FFC3;
	Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 44/99] target/arm: fixup sve_exception_el code style before move
Date: Fri,  4 Jun 2021 16:52:17 +0100
Message-Id: <20210604155312.15902-45-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JCU+jNhf0Rkx

From: Claudio Fontana <cfontana@suse.de>

before moving over sve_exception_el from the helper code,
cleanup the style.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 9dd83911f2..1c69a69d5a 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -261,7 +261,8 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 }
 #endif /* TARGET_AARCH64 */
 
-/* Return the exception level to which exceptions should be taken
+/*
+ * Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
  * take care of raising that exception.
@@ -275,7 +276,8 @@ int sve_exception_el(CPUARMState *env, int el)
     if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         bool disabled = false;
 
-        /* The CPACR.ZEN controls traps to EL1:
+        /*
+         * The CPACR.ZEN controls traps to EL1:
          * 0, 2 : trap EL0 and EL1 accesses
          * 1    : trap only EL0 accesses
          * 3    : trap no accesses
@@ -301,7 +303,8 @@ int sve_exception_el(CPUARMState *env, int el)
         }
     }
 
-    /* CPTR_EL2.  Since TZ and TFP are positive,
+    /*
+     * CPTR_EL2.  Since TZ and TFP are positive,
      * they will be zero when EL2 is not present.
      */
     if (el <= 2 && arm_is_el2_enabled(env)) {
-- 
2.20.1
