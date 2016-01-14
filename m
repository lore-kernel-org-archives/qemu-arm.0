Received: by 10.25.159.19 with SMTP id i19csp1948868lfe;
        Thu, 14 Jan 2016 10:34:23 -0800 (PST)
X-Received: by 10.112.201.3 with SMTP id jw3mr1535961lbc.27.1452796454331;
        Thu, 14 Jan 2016 10:34:14 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id ul9si3747031lbb.110.2016.01.14.10.34.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000mN-Fw; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 6/8] target-arm: Handle exception return from AArch64 to non-EL0 AArch32
Date: Thu, 14 Jan 2016 18:34:09 +0000
Message-Id: <1452796451-2946-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 4QbuRbwRbxlt

Remove the assumptions that the AArch64 exception return code was
making about a return to AArch32 always being a return to EL0.
This includes pulling out the illegal-SPSR checks so we can apply
them for return to 32 bit as well as return to 64-bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/op_helper.c | 80 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 59 insertions(+), 21 deletions(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index e42d287..38d46d8 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -640,12 +640,51 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
     }
 }
 
+static int el_from_spsr(uint32_t spsr)
+{
+    /* Return the exception level that this SPSR is requesting a return to,
+     * or -1 if it is invalid (an illegal return)
+     */
+    if (spsr & PSTATE_nRW) {
+        switch (spsr & CPSR_M) {
+        case ARM_CPU_MODE_USR:
+            return 0;
+        case ARM_CPU_MODE_HYP:
+            return 2;
+        case ARM_CPU_MODE_FIQ:
+        case ARM_CPU_MODE_IRQ:
+        case ARM_CPU_MODE_SVC:
+        case ARM_CPU_MODE_ABT:
+        case ARM_CPU_MODE_UND:
+        case ARM_CPU_MODE_SYS:
+            return 1;
+        case ARM_CPU_MODE_MON:
+            /* Returning to Mon from AArch64 is never possible,
+             * so this is an illegal return.
+             */
+        default:
+            return -1;
+        }
+    } else {
+        if (extract32(spsr, 1, 1)) {
+            /* Return with reserved M[1] bit set */
+            return -1;
+        }
+        if (extract32(spsr, 0, 4) == 1) {
+            /* return to EL0 with M[0] bit set */
+            return -1;
+        }
+        return extract32(spsr, 2, 2);
+    }
+}
+
 void HELPER(exception_return)(CPUARMState *env)
 {
     int cur_el = arm_current_el(env);
     unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
     uint32_t spsr = env->banked_spsr[spsr_idx];
     int new_el;
+    bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
 
     aarch64_save_sp(env, cur_el);
 
@@ -662,35 +701,34 @@ void HELPER(exception_return)(CPUARMState *env)
         spsr &= ~PSTATE_SS;
     }
 
-    if (spsr & PSTATE_nRW) {
-        /* TODO: We currently assume EL1/2/3 are running in AArch64.  */
+    new_el = el_from_spsr(spsr);
+    if (new_el == -1) {
+        goto illegal_return;
+    }
+    if (new_el > cur_el
+        || (new_el == 2 && !arm_feature(env, ARM_FEATURE_EL2))) {
+        /* Disallow return to an EL which is unimplemented or higher
+         * than the current one.
+         */
+        goto illegal_return;
+    }
+
+    if (new_el != 0 && arm_el_is_aa64(env, new_el) != return_to_aa64) {
+        /* Return to an EL which is configured for a different register width */
+        goto illegal_return;
+    }
+
+    if (!return_to_aa64) {
         env->aarch64 = 0;
-        new_el = 0;
-        env->uncached_cpsr = 0x10;
+        env->uncached_cpsr = spsr & CPSR_M;
         cpsr_write(env, spsr, ~0);
         if (!arm_singlestep_active(env)) {
             env->uncached_cpsr &= ~PSTATE_SS;
         }
         aarch64_sync_64_to_32(env);
 
-        env->regs[15] = env->elr_el[1] & ~0x1;
+        env->regs[15] = env->elr_el[cur_el] & ~0x1;
     } else {
-        new_el = extract32(spsr, 2, 2);
-        if (new_el > cur_el
-            || (new_el == 2 && !arm_feature(env, ARM_FEATURE_EL2))) {
-            /* Disallow return to an EL which is unimplemented or higher
-             * than the current one.
-             */
-            goto illegal_return;
-        }
-        if (extract32(spsr, 1, 1)) {
-            /* Return with reserved M[1] bit set */
-            goto illegal_return;
-        }
-        if (new_el == 0 && (spsr & PSTATE_SP)) {
-            /* Return to EL0 with M[0] bit set */
-            goto illegal_return;
-        }
         env->aarch64 = 1;
         pstate_write(env, spsr);
         if (!arm_singlestep_active(env)) {
-- 
1.9.1
