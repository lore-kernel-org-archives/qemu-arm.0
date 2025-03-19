Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f376d3sm26330865e9.4.2025.03.19.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:22:56 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 908D45FAC7;
	Wed, 19 Mar 2025 18:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 04/10] target/arm: convert 64 bit gdbstub to new helper
Date: Wed, 19 Mar 2025 18:22:49 +0000
Message-Id: <20250319182255.3096731-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319182255.3096731-1-alex.bennee@linaro.org>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bsvdlSrUIX3E

For some of the helpers we need a temporary variable to copy from
although we could add some helpers to return pointers into env in
those cases if we wanted to.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/gdbstub64.c | 53 ++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 1a4dbec567..793332af31 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -20,7 +20,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
-#include "gdbstub/helpers.h"
+#include "gdbstub/registers.h"
 #include "gdbstub/commands.h"
 #include "tcg/mte_helper.h"
 #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
@@ -35,15 +35,16 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
     if (n < 31) {
         /* Core integer register.  */
-        return gdb_get_reg64(mem_buf, env->xregs[n]);
+        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &env->xregs[n]);
     }
     switch (n) {
     case 31:
-        return gdb_get_reg64(mem_buf, env->xregs[31]);
+        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &env->xregs[31]);
     case 32:
-        return gdb_get_reg64(mem_buf, env->pc);
+        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &env->pc);
     case 33:
-        return gdb_get_reg32(mem_buf, pstate_read(env));
+        uint32_t pstate = pstate_read(env);
+        return gdb_get_register_value(MO_TEUL, mem_buf, (uint8_t *) &pstate);
     }
     /* Unknown register.  */
     return 0;
@@ -82,23 +83,27 @@ int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    uint32_t fpr;
 
     switch (reg) {
     case 0 ... 31:
     {
         /* 128 bit FP register - quads are in LE order */
         uint64_t *q = aa64_vfp_qreg(env, reg);
-        return gdb_get_reg128(buf, q[1], q[0]);
+        return gdb_get_register_value(MO_TEUO, buf, (uint8_t *) q);
     }
     case 32:
         /* FPSR */
-        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+        fpr = vfp_get_fpsr(env);
+        break;
     case 33:
         /* FPCR */
-        return gdb_get_reg32(buf, vfp_get_fpcr(env));
+        fpr = vfp_get_fpcr(env);
+        break;
     default:
         return 0;
     }
+    return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &fpr);
 }
 
 int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
@@ -132,30 +137,37 @@ int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    uint32_t fpr;
 
     switch (reg) {
     /* The first 32 registers are the zregs */
     case 0 ... 31:
     {
         int vq, len = 0;
+        ARMVectorReg *zreg = &env->vfp.zregs[reg];
+
         for (vq = 0; vq < cpu->sve_max_vq; vq++) {
-            len += gdb_get_reg128(buf,
-                                  env->vfp.zregs[reg].d[vq * 2 + 1],
-                                  env->vfp.zregs[reg].d[vq * 2]);
+            len += gdb_get_register_value(MO_TEUQ, buf,
+                                          (uint8_t *) &zreg->d[vq * 2 + 1]);
+            len += gdb_get_register_value(MO_TEUQ, buf,
+                                          (uint8_t *) &zreg->d[vq * 2]);
         }
         return len;
     }
     case 32:
-        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+        fpr = vfp_get_fpsr(env);
+        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &fpr);
     case 33:
-        return gdb_get_reg32(buf, vfp_get_fpcr(env));
+        fpr = vfp_get_fpcr(env);
+        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &fpr);
     /* then 16 predicates and the ffr */
     case 34 ... 50:
     {
         int preg = reg - 34;
         int vq, len = 0;
         for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
-            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
+            len += gdb_get_register_value(MO_TEUQ, buf,
+                                          (uint8_t *) &env->vfp.pregs[preg].p[vq / 4]);
         }
         return len;
     }
@@ -165,8 +177,8 @@ int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
          * We report in Vector Granules (VG) which is 64bit in a Z reg
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
-        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
-        return gdb_get_reg64(buf, vq * 2);
+        uint64_t vq = (sve_vqm1_for_el(env, arm_current_el(env)) + 1) * 2;
+        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &vq);
     }
     default:
         /* gdbstub asked for something out our range */
@@ -248,10 +260,11 @@ int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg)
             bool is_data = !(reg & 1);
             bool is_high = reg & 2;
             ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-            ARMVAParameters param;
+            ARMVAParameters param = aa64_va_parameters(env, -is_high, mmu_idx,
+                                                       is_data, false);
+            uint64_t pauth_mask = pauth_ptr_mask(param);
 
-            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data, false);
-            return gdb_get_reg64(buf, pauth_ptr_mask(param));
+            return gdb_get_register_value(MO_TEUQ, buf, (uint8_t *) &pauth_mask);
         }
     default:
         return 0;
@@ -399,7 +412,7 @@ int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteArray *buf, int reg)
 
     tcf0 = extract64(env->cp15.sctlr_el[1], 38, 2);
 
-    return gdb_get_reg64(buf, tcf0);
+    return gdb_get_register_value(MO_TEUQ, buf, (uint8_t *) &tcf0);
 }
 
 int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
-- 
2.39.5
