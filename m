Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf68308sm5823794a12.5.2025.03.24.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:21:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2CD3B5FC1A;
	Mon, 24 Mar 2025 10:21:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/11] target/arm: convert 64 bit gdbstub to new helpers
Date: Mon, 24 Mar 2025 10:21:37 +0000
Message-Id: <20250324102142.67022-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324102142.67022-1-alex.bennee@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ICBc/N/tUrPy

For some of the helpers we need a temporary variable to copy from
although we could add some helpers to return pointers into env in
those cases if we wanted to.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use MO32/MO64 varients for reg sizes
  - use wrappers for 32/64 bit regs
  - do SVE Z registers in 128bit chunks
---
 target/arm/gdbstub64.c | 53 ++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 1a4dbec567..6ad10368e8 100644
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
@@ -32,18 +32,21 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    MemOp mop = MO_TE; /* TE = LE for registers despite SCTLR.EE/E0E */
+    uint32_t pstate;
 
     if (n < 31) {
         /* Core integer register.  */
-        return gdb_get_reg64(mem_buf, env->xregs[n]);
+        return gdb_get_reg64_value(mop | MO_64, mem_buf, &env->xregs[n]);
     }
     switch (n) {
     case 31:
-        return gdb_get_reg64(mem_buf, env->xregs[31]);
+        return gdb_get_reg64_value(mop | MO_64, mem_buf, &env->xregs[31]);
     case 32:
-        return gdb_get_reg64(mem_buf, env->pc);
+        return gdb_get_reg64_value(mop | MO_64, mem_buf, &env->pc);
     case 33:
-        return gdb_get_reg32(mem_buf, pstate_read(env));
+        pstate = pstate_read(env);
+        return gdb_get_reg32_value(mop | MO_32, mem_buf, &pstate);
     }
     /* Unknown register.  */
     return 0;
@@ -82,23 +85,27 @@ int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg)
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
+        return gdb_get_register_value(MO_TE | MO_128, buf, q);
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
+    return gdb_get_reg32_value(MO_TE | MO_32, buf, &fpr);
 }
 
 int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
@@ -132,30 +139,35 @@ int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    MemOp mop = MO_TE; /* TE = LE for registers despite SCTLR.EE/E0E */
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
+            len += gdb_get_register_value(mop | MO_128, buf, &zreg->d[vq * 2]);
         }
         return len;
     }
     case 32:
-        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+        fpr = vfp_get_fpsr(env);
+        return gdb_get_reg32_value(mop | MO_32, buf, &fpr);
     case 33:
-        return gdb_get_reg32(buf, vfp_get_fpcr(env));
+        fpr = vfp_get_fpcr(env);
+        return gdb_get_reg32_value(mop | MO_32, buf, &fpr);
     /* then 16 predicates and the ffr */
     case 34 ... 50:
     {
         int preg = reg - 34;
         int vq, len = 0;
         for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
-            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
+            len += gdb_get_reg64_value(mop | MO_64, buf,
+                                       &env->vfp.pregs[preg].p[vq / 4]);
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
+        return gdb_get_reg64_value(mop | MO_64, buf, &vq);
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
+            return gdb_get_reg64_value(MO_TE | MO_64, buf, &pauth_mask);
         }
     default:
         return 0;
@@ -399,7 +412,7 @@ int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteArray *buf, int reg)
 
     tcf0 = extract64(env->cp15.sctlr_el[1], 38, 2);
 
-    return gdb_get_reg64(buf, tcf0);
+    return gdb_get_reg64_value(MO_TE | MO_64, buf, &tcf0);
 }
 
 int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
-- 
2.39.5
