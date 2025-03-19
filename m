Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4453227dsm25979735e9.40.2025.03.19.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:22:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 220CA6046F;
	Wed, 19 Mar 2025 18:22:56 +0000 (GMT)
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
Subject: [PATCH 10/10] target/microblaze: convert gdbstub to new helper
Date: Wed, 19 Mar 2025 18:22:55 +0000
Message-Id: <20250319182255.3096731-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319182255.3096731-1-alex.bennee@linaro.org>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AUt1xqPBvZ+o

This is a pretty simple conversion which will be trivial to update
once TARGET_BIGENDIAN is replaced with a helper function.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/microblaze/gdbstub.c | 44 ++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index d493681d38..106d6efbab 100644
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
@@ -50,62 +50,52 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUMBState *env = &cpu->env;
-    uint32_t val;
+    MemOp mo = TARGET_BIG_ENDIAN ? MO_BEUL : MO_LEUL;
 
     switch (n) {
     case 1 ... 31:
-        val = env->regs[n];
-        break;
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->regs[n]);
     case GDB_PC:
-        val = env->pc;
-        break;
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->pc);
     case GDB_MSR:
-        val = mb_cpu_read_msr(env);
-        break;
+        uint32_t msr = mb_cpu_read_msr(env);
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &msr);
     case GDB_EAR:
-        val = env->ear;
-        break;
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->ear);
     case GDB_ESR:
-        val = env->esr;
-        break;
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->esr);
     case GDB_FSR:
-        val = env->fsr;
-        break;
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->fsr);
     case GDB_BTR:
-        val = env->btr;
-        break;
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->btr);
     case GDB_PVR0 ... GDB_PVR11:
         /* PVR12 is intentionally skipped */
-        val = cpu->cfg.pvr_regs[n - GDB_PVR0];
-        break;
+        return gdb_get_register_value(mo, mem_buf,
+                                      (uint8_t *) &cpu->cfg.pvr_regs[n - GDB_PVR0]);
     case GDB_EDR:
-        val = env->edr;
-        break;
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->edr);
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
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->slr);
         break;
     case GDB_SP_SHR:
-        val = env->shr;
+        return gdb_get_register_value(mo, mem_buf, (uint8_t *) &env->shr);
         break;
     default:
         return 0;
     }
-    return gdb_get_reg32(mem_buf, val);
 }
 
 int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
-- 
2.39.5
