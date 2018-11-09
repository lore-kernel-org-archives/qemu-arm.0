Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e10-v6sm2019691wmg.23.2018.11.09.07.21.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Nov 2018 07:21:25 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 9C74B3E05B2;
	Fri,  9 Nov 2018 15:21:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 7/7] arm: fix aa64_generate_debug_exceptions to work with EL2
Date: Fri,  9 Nov 2018 15:21:19 +0000
Message-Id: <20181109152119.9242-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109152119.9242-1-alex.bennee@linaro.org>
References: <20181109152119.9242-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: v+iKfLYJ9UiJ

The test was incomplete and incorrectly caused debug exceptions to be
generated when returning to EL2 after a failed attempt to single-step
an EL1 instruction. Fix this while cleaning up the function a little.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - further re-arrangement as suggested by rth
---
 target/arm/cpu.h | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1efff21a18..814ff69bc2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2764,23 +2764,35 @@ static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
     return (cpu->clidr & R_V7M_CLIDR_CTYPE_ALL_MASK) != 0;
 }
 
+/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
 static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
 {
-    if (arm_is_secure(env)) {
-        /* MDCR_EL3.SDD disables debug events from Secure state */
-        if (extract32(env->cp15.mdcr_el3, 16, 1) != 0
-            || arm_current_el(env) == 3) {
-            return false;
-        }
+    int cur_el = arm_current_el(env);
+    int debug_el;
+
+    if (cur_el == 3) {
+        return false;
     }
 
-    if (arm_current_el(env) == arm_debug_target_el(env)) {
-        if ((extract32(env->cp15.mdscr_el1, 13, 1) == 0)
-            || (env->daif & PSTATE_D)) {
-            return false;
-        }
+    /* MDCR_EL3.SDD disables debug events from Secure state */
+    if (arm_is_secure_below_el3(env)
+        && extract32(env->cp15.mdcr_el3, 16, 1)) {
+        return false;
     }
-    return true;
+
+    /*
+     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
+     * while not masking the (D)ebug bit in DAIF.
+     */
+    debug_el = arm_debug_target_el(env);
+
+    if (cur_el == debug_el) {
+        return extract32(env->cp15.mdscr_el1, 13, 1)
+            && !(env->daif & PSTATE_D);
+    }
+
+    /* Otherwise the debug target needs to be a higher EL */
+    return debug_el > cur_el;
 }
 
 static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
@@ -2833,9 +2845,6 @@ static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
  * since the pseudocode has it at all callsites except for the one in
  * CheckSoftwareStep(), where it is elided because both branches would
  * always return the same value.
- *
- * Parts of the pseudocode relating to EL2 and EL3 are omitted because we
- * don't yet implement those exception levels or their associated trap bits.
  */
 static inline bool arm_generate_debug_exceptions(CPUARMState *env)
 {
-- 
2.17.1
