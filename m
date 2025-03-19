Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39972df9b9esm3027838f8f.18.2025.03.19.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:22:56 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7B7E45FAA0;
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
Subject: [PATCH 03/10] target/arm: convert 32 bit gdbstub to new helper
Date: Wed, 19 Mar 2025 18:22:48 +0000
Message-Id: <20250319182255.3096731-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319182255.3096731-1-alex.bennee@linaro.org>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cFIo+odTj7Ee

For some of the helpers we need a temporary variable to copy from
although we could add some helpers to return pointers into env in
those cases if we wanted to.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/gdbstub.c | 57 ++++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 30068c2262..14d931b0bf 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#include "gdbstub/helpers.h"
+#include "gdbstub/registers.h"
 #include "gdbstub/commands.h"
 #include "system/tcg.h"
 #include "internals.h"
@@ -33,12 +33,16 @@ typedef struct RegisterSysregFeatureParam {
     int n;
 } RegisterSysregFeatureParam;
 
-/* Old gdb always expect FPA registers.  Newer (xml-aware) gdb only expect
-   whatever the target description contains.  Due to a historical mishap
-   the FPA registers appear in between core integer regs and the CPSR.
-   We hack round this by giving the FPA regs zero size when talking to a
-   newer gdb.  */
-
+/*
+ * Old gdb always expect FPA registers. Newer (xml-aware) gdb only
+ * expect whatever the target description contains. Due to a
+ * historical mishap the FPA registers appear in between core integer
+ * regs and the CPSR. We hack round this by giving the FPA regs zero
+ * size when talking to a newer gdb.
+ *
+ * While gdb cares about the memory endianess of the target all
+ * registers are passed in little-endian mode.
+ */
 int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -46,15 +50,17 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
     if (n < 16) {
         /* Core integer register.  */
-        return gdb_get_reg32(mem_buf, env->regs[n]);
+        return gdb_get_register_value(MO_TEUL, mem_buf, (uint8_t *) &env->regs[n]);
     }
     if (n == 25) {
         /* CPSR, or XPSR for M-profile */
+        uint32_t reg;
         if (arm_feature(env, ARM_FEATURE_M)) {
-            return gdb_get_reg32(mem_buf, xpsr_read(env));
+            reg = xpsr_read(env);
         } else {
-            return gdb_get_reg32(mem_buf, cpsr_read(env));
+            reg = cpsr_read(env);
         }
+        return gdb_get_register_value(MO_TEUL, mem_buf, (uint8_t *) &reg);
     }
     /* Unknown register.  */
     return 0;
@@ -115,19 +121,22 @@ static int vfp_gdb_get_reg(CPUState *cs, GByteArray *buf, int reg)
 
     /* VFP data registers are always little-endian.  */
     if (reg < nregs) {
-        return gdb_get_reg64(buf, *aa32_vfp_dreg(env, reg));
+        return gdb_get_register_value(MO_TEUQ, buf,
+                                      (uint8_t *) aa32_vfp_dreg(env, reg));
     }
     if (arm_feature(env, ARM_FEATURE_NEON)) {
         /* Aliases for Q regs.  */
         nregs += 16;
         if (reg < nregs) {
             uint64_t *q = aa32_vfp_qreg(env, reg - 32);
-            return gdb_get_reg128(buf, q[0], q[1]);
+            return gdb_get_register_value(MO_TEUO, buf, (uint8_t *) q);
         }
     }
     switch (reg - nregs) {
+        uint32_t fpcr;
     case 0:
-        return gdb_get_reg32(buf, vfp_get_fpscr(env));
+        fpcr = vfp_get_fpscr(env);
+        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &fpcr);
     }
     return 0;
 }
@@ -166,9 +175,11 @@ static int vfp_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
 
     switch (reg) {
     case 0:
-        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
+        return gdb_get_register_value(MO_TEUL, buf,
+                                      (uint8_t *) &env->vfp.xregs[ARM_VFP_FPSID]);
     case 1:
-        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]);
+        return gdb_get_register_value(MO_TEUL, buf,
+                                      (uint8_t *) &env->vfp.xregs[ARM_VFP_FPEXC]);
     }
     return 0;
 }
@@ -196,7 +207,8 @@ static int mve_gdb_get_reg(CPUState *cs, GByteArray *buf, int reg)
 
     switch (reg) {
     case 0:
-        return gdb_get_reg32(buf, env->v7m.vpr);
+        return gdb_get_register_value(MO_TEUL, buf,
+                                      (uint8_t *) &env->v7m.vpr);
     default:
         return 0;
     }
@@ -236,9 +248,11 @@ static int arm_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
     ri = get_arm_cp_reginfo(cpu->cp_regs, key);
     if (ri) {
         if (cpreg_field_is_64bit(ri)) {
-            return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env, ri));
+            uint64_t cpreg = read_raw_cp_reg(env, ri);
+            return gdb_get_register_value(MO_TEUQ, buf, (uint8_t *) &cpreg);
         } else {
-            return gdb_get_reg32(buf, (uint32_t)read_raw_cp_reg(env, ri));
+            uint32_t cpreg = (uint32_t) read_raw_cp_reg(env, ri);
+            return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &cpreg);
         }
     }
     return 0;
@@ -375,12 +389,12 @@ static uint32_t *m_sysreg_ptr(CPUARMState *env, MProfileSysreg reg, bool sec)
 static int m_sysreg_get(CPUARMState *env, GByteArray *buf,
                         MProfileSysreg reg, bool secure)
 {
-    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
+    uint8_t *ptr = (uint8_t *) m_sysreg_ptr(env, reg, secure);
 
     if (ptr == NULL) {
         return 0;
     }
-    return gdb_get_reg32(buf, *ptr);
+    return gdb_get_register_value(MO_TEUL, buf, ptr);
 }
 
 static int arm_gdb_get_m_systemreg(CPUState *cs, GByteArray *buf, int reg)
@@ -393,7 +407,8 @@ static int arm_gdb_get_m_systemreg(CPUState *cs, GByteArray *buf, int reg)
      * banked and non-banked bits.
      */
     if (reg == M_SYSREG_CONTROL) {
-        return gdb_get_reg32(buf, arm_v7m_mrs_control(env, env->v7m.secure));
+        uint32_t reg32 = arm_v7m_mrs_control(env, env->v7m.secure);
+        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &reg32);
     }
     return m_sysreg_get(env, buf, reg, env->v7m.secure);
 }
-- 
2.39.5
