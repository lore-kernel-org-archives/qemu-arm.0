Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e8-v6sm4243641wrw.75.2018.11.08.08.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Nov 2018 08:33:32 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 59D063E059D;
	Thu,  8 Nov 2018 16:33:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 6/6] arm: fix aa64_generate_debug_exceptions to work with EL2
Date: Thu,  8 Nov 2018 16:33:29 +0000
Message-Id: <20181108163329.19940-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181108163329.19940-1-alex.bennee@linaro.org>
References: <20181108163329.19940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OVfLfcNNiMxW

The test was incomplete and incorrectly caused debug exceptions to be
generated when returning to EL2 after a failed attempt to single-step
an EL1 instruction. Fix this while cleaning up the function a little.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1efff21a18..a6d8eb14f6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2764,23 +2764,33 @@ static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
     return (cpu->clidr & R_V7M_CLIDR_CTYPE_ALL_MASK) != 0;
 }
 
+/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
 static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
 {
+    int cur_el = arm_current_el(env);
+    int debug_el;
+
     if (arm_is_secure(env)) {
         /* MDCR_EL3.SDD disables debug events from Secure state */
         if (extract32(env->cp15.mdcr_el3, 16, 1) != 0
-            || arm_current_el(env) == 3) {
+            || cur_el == 3) {
             return false;
         }
     }
 
-    if (arm_current_el(env) == arm_debug_target_el(env)) {
-        if ((extract32(env->cp15.mdscr_el1, 13, 1) == 0)
-            || (env->daif & PSTATE_D)) {
-            return false;
-        }
+    /*
+     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
+     * while not masking the (D)ebug bit in DAIF.
+     */
+    debug_el = arm_debug_target_el(env);
+
+    if (cur_el == debug_el) {
+        return extract32(env->cp15.mdscr_el1, 13, 1)
+            && !(env->daif & PSTATE_D);
     }
-    return true;
+
+    /* Otherwise the debug target needs to be a higher EL */
+    return debug_el > cur_el;
 }
 
 static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
@@ -2833,9 +2843,6 @@ static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
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
