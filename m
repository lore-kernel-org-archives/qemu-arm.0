Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd3aab3sm636836466b.156.2025.03.24.03.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:21:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 85D915FDAC;
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
Subject: [PATCH v2 10/11] target/microblaze: convert gdbstub to new helper
Date: Mon, 24 Mar 2025 10:21:41 +0000
Message-Id: <20250324102142.67022-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324102142.67022-1-alex.bennee@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +DsdNIHT6/UK

This is a pretty simple conversion given a single set of registers and
an existing helper to probe endianess.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use mb_cpu_is_big_endian
  - use explicit MO_32 size
  - handle differing size of env->ear between user/system
---
 target/microblaze/gdbstub.c | 49 +++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index d493681d38..dbaf7ecb9c 100644
--- a/target/microblaze/gdbstub.c
+++ b/target/microblaze/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "gdbstub/helpers.h"
+#include "gdbstub/registers.h"
 
 /*
  * GDB expects SREGs in the following order:
@@ -50,62 +50,57 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUMBState *env = &cpu->env;
-    uint32_t val;
+    MemOp mo = mb_cpu_is_big_endian(cs) ? MO_BE : MO_LE;
+    uint32_t msr;
 
     switch (n) {
     case 1 ... 31:
-        val = env->regs[n];
-        break;
+        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->regs[n]);
     case GDB_PC:
-        val = env->pc;
-        break;
+        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->pc);
     case GDB_MSR:
-        val = mb_cpu_read_msr(env);
-        break;
+        msr = mb_cpu_read_msr(env);
+        return gdb_get_reg32_value(mo | MO_32, mem_buf, &msr);
     case GDB_EAR:
-        val = env->ear;
-        break;
+#if TARGET_LONG_BITS == 64
+        return gdb_get_reg64_value(mo | MO_64, mem_buf, &env->ear);
+#else
+        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->ear);
+#endif
     case GDB_ESR:
-        val = env->esr;
-        break;
+        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->esr);
     case GDB_FSR:
-        val = env->fsr;
-        break;
+        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->fsr);
     case GDB_BTR:
-        val = env->btr;
-        break;
+        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->btr);
     case GDB_PVR0 ... GDB_PVR11:
         /* PVR12 is intentionally skipped */
-        val = cpu->cfg.pvr_regs[n - GDB_PVR0];
-        break;
+        return gdb_get_reg32_value(mo | MO_32, mem_buf,
+                                      &cpu->cfg.pvr_regs[n - GDB_PVR0]);
     case GDB_EDR:
-        val = env->edr;
-        break;
+        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->edr);
     default:
         /* Other SRegs aren't modeled, so report a value of 0 */
-        val = 0;
-        break;
+        return 0;
     }
-    return gdb_get_reg32(mem_buf, val);
 }
 
 int mb_cpu_gdb_read_stack_protect(CPUState *cs, GByteArray *mem_buf, int n)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUMBState *env = &cpu->env;
-    uint32_t val;
+    MemOp mo = TARGET_BIG_ENDIAN ? MO_BEUL : MO_LEUL;
 
     switch (n) {
     case GDB_SP_SHL:
-        val = env->slr;
+        return gdb_get_reg32_value(mo, mem_buf, &env->slr);
         break;
     case GDB_SP_SHR:
-        val = env->shr;
+        return gdb_get_reg32_value(mo, mem_buf, &env->shr);
         break;
     default:
         return 0;
     }
-    return gdb_get_reg32(mem_buf, val);
 }
 
 int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
-- 
2.39.5
