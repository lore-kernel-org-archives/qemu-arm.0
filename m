Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3f17sm652319266b.63.2025.03.24.03.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:21:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 70E845FD7E;
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
Subject: [PATCH v2 09/11] target/ppc: convert gdbstub to new helpers
Date: Mon, 24 Mar 2025 10:21:40 +0000
Message-Id: <20250324102142.67022-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324102142.67022-1-alex.bennee@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DfMe0mZ2Y3tT

By passing the explicit state of LE/BE via the memop we can avoid the
messing about we do with ppc_maybe_bswap_register() at least for
supplying register values to gdbstub.

The fact we still need the helper for setting the values probably
indicates we could do with a reverse helper, possibly to setting env
vars directly? This is complicated by aliasing though.

We also have to deal with heavy usage of target_ulong so we copy some
macro stuff from the old helpers.h and add a gdb_get_regl_value()
helper.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use new helpers
  - fix bunch of target_ulong cases
---
 target/ppc/gdbstub.c | 195 ++++++++++++++++++++++++-------------------
 1 file changed, 111 insertions(+), 84 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index c09e93abaf..b96c3ac5b8 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#include "gdbstub/helpers.h"
+#include "gdbstub/registers.h"
 #include "internal.h"
 
 static int ppc_gdb_register_len_apple(int n)
@@ -74,12 +74,12 @@ static int ppc_gdb_register_len(int n)
 }
 
 /*
- * We need to present the registers to gdb in the "current" memory
- * ordering.  For user-only mode we get this for free;
- * TARGET_BIG_ENDIAN is set to the proper ordering for the
- * binary, and cannot be changed.  For system mode,
- * TARGET_BIG_ENDIAN is always set, and we must check the current
- * mode of the chip to see if we're running in little-endian.
+ * We need to map the target endian registers from gdb in the
+ * "current" memory ordering. For user-only mode we get this for free;
+ * TARGET_BIG_ENDIAN is set to the proper ordering for the binary, and
+ * cannot be changed. For system mode, TARGET_BIG_ENDIAN is always
+ * set, and we must check the current mode of the chip to see if we're
+ * running in little-endian.
  */
 static void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
 {
@@ -98,6 +98,41 @@ static void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len
 #endif
 }
 
+/*
+ * We need to present the registers to gdb in the "current" memory
+ * ordering. For user-only mode this is hardwired by TARGET_BIG_ENDIAN
+ * and cannot be changed. For system mode we must check the current
+ * mode of the chip to see if we're running in little-endian.
+ */
+static MemOp ppc_gdb_memop(CPUPPCState *env, int len)
+{
+#ifndef CONFIG_USER_ONLY
+    MemOp end = FIELD_EX64(env->msr, MSR, LE) ? MO_LE : MO_BE;
+#else
+    #ifdef TARGET_BIG_ENDIAN
+    MemOp end = MO_BE;
+    #else
+    MemOp end = MO_LE;
+    #endif
+#endif
+
+    return size_memop(len) | end;
+}
+
+/*
+ * Helpers copied from helpers.h just for handling target_ulong values
+ * from gdbstub's GByteArray based on what the build config is. This
+ * will need fixing for single-binary.
+ */
+
+#if TARGET_LONG_BITS == 64
+#define ldtul_p(addr) ldq_p(addr)
+#define gdb_get_regl_value(m, b, v) gdb_get_reg64_value(m, b, v)
+#else
+#define ldtul_p(addr) ldl_p(addr)
+#define gdb_get_regl_value(m, b, v) gdb_get_reg32_value(m, b, v)
+#endif
+
 /*
  * Old gdb always expects FP registers.  Newer (xml-aware) gdb only
  * expects whatever the target description contains.  Due to a
@@ -109,51 +144,50 @@ static void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len
 int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
 {
     CPUPPCState *env = cpu_env(cs);
-    uint8_t *mem_buf;
     int r = ppc_gdb_register_len(n);
+    MemOp mo;
 
     if (!r) {
         return r;
     }
 
+    mo = ppc_gdb_memop(env, r);
+
     if (n < 32) {
         /* gprs */
-        gdb_get_regl(buf, env->gpr[n]);
+        return gdb_get_regl_value(mo, buf, &env->gpr[n]);
     } else {
         switch (n) {
         case 64:
-            gdb_get_regl(buf, env->nip);
-            break;
+            return gdb_get_regl_value(mo, buf, &env->nip);
         case 65:
-            gdb_get_regl(buf, env->msr);
-            break;
+            return gdb_get_regl_value(mo, buf, &env->msr);
         case 66:
             {
                 uint32_t cr = ppc_get_cr(env);
-                gdb_get_reg32(buf, cr);
-                break;
+                return gdb_get_register_value(ppc_gdb_memop(env, 4), buf, &cr);
             }
         case 67:
-            gdb_get_regl(buf, env->lr);
+            return gdb_get_regl_value(mo, buf, &env->lr);
             break;
         case 68:
-            gdb_get_regl(buf, env->ctr);
+            return gdb_get_regl_value(mo, buf, &env->ctr);
             break;
         case 69:
-            gdb_get_reg32(buf, cpu_read_xer(env));
-            break;
+            uint32_t val = cpu_read_xer(env);
+            return gdb_get_register_value(ppc_gdb_memop(env, 4), buf, &val);
         }
     }
-    mem_buf = buf->data + buf->len - r;
-    ppc_maybe_bswap_register(env, mem_buf, r);
-    return r;
+
+    return 0;
 }
 
 int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
 {
     CPUPPCState *env = cpu_env(cs);
-    uint8_t *mem_buf;
     int r = ppc_gdb_register_len_apple(n);
+    MemOp mo = ppc_gdb_memop(env, r);
+    int actual = 0;
 
     if (!r) {
         return r;
@@ -161,44 +195,48 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
 
     if (n < 32) {
         /* gprs */
-        gdb_get_reg64(buf, env->gpr[n]);
+        actual = gdb_get_regl_value(mo, buf, &env->gpr[n]);
     } else if (n < 64) {
         /* fprs */
-        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
+        actual = gdb_get_reg64_value(mo, buf, cpu_fpr_ptr(env, n - 32));
     } else if (n < 96) {
-        /* Altivec */
-        gdb_get_reg64(buf, n - 64);
-        gdb_get_reg64(buf, 0);
+        /* Altivec - where are they? ppc_vsr_t vsr[64]? */
+        uint64_t empty = 0;
+        actual = gdb_get_reg64_value(mo, buf, &empty);
+        actual = gdb_get_reg64_value(mo, buf, &empty);
     } else {
         switch (n) {
         case 64 + 32:
-            gdb_get_reg64(buf, env->nip);
+            actual = gdb_get_regl_value(mo, buf, &env->nip);
             break;
         case 65 + 32:
-            gdb_get_reg64(buf, env->msr);
+            actual = gdb_get_regl_value(mo, buf, &env->msr);
             break;
         case 66 + 32:
-            {
-                uint32_t cr = ppc_get_cr(env);
-                gdb_get_reg32(buf, cr);
-                break;
-            }
+        {
+            uint32_t cr = ppc_get_cr(env);
+            actual = gdb_get_reg32_value(mo, buf, &cr);
+            break;
+        }
         case 67 + 32:
-            gdb_get_reg64(buf, env->lr);
+            actual = gdb_get_regl_value(mo, buf, &env->lr);
             break;
         case 68 + 32:
-            gdb_get_reg64(buf, env->ctr);
+            actual = gdb_get_regl_value(mo, buf, &env->ctr);
             break;
         case 69 + 32:
-            gdb_get_reg32(buf, cpu_read_xer(env));
+        {
+            uint32_t xer = cpu_read_xer(env);
+            actual = gdb_get_reg32_value(mo, buf, &xer);
             break;
+        }
         case 70 + 32:
-            gdb_get_reg64(buf, env->fpscr);
+            actual = gdb_get_regl_value(mo, buf, &env->fpscr);
             break;
         }
     }
-    mem_buf = buf->data + buf->len - r;
-    ppc_maybe_bswap_register(env, mem_buf, r);
+
+    g_assert(r == actual);
     return r;
 }
 
@@ -210,6 +248,9 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     if (!r) {
         return r;
     }
+
+    g_assert(r == n);
+    
     ppc_maybe_bswap_register(env, mem_buf, r);
     if (n < 32) {
         /* gprs */
@@ -367,18 +408,16 @@ static int gdb_get_spr_reg(CPUState *cs, GByteArray *buf, int n)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
+    MemOp mo = ppc_gdb_memop(env, TARGET_LONG_SIZE);
+    target_ulong val;
     int reg;
-    int len;
 
     reg = gdb_find_spr_idx(env, n);
     if (reg < 0) {
         return 0;
     }
 
-    len = TARGET_LONG_SIZE;
-
     /* Handle those SPRs that are not part of the env->spr[] array */
-    target_ulong val;
     switch (reg) {
 #if defined(TARGET_PPC64)
     case SPR_CFAR:
@@ -400,10 +439,7 @@ static int gdb_get_spr_reg(CPUState *cs, GByteArray *buf, int n)
     default:
         val = env->spr[reg];
     }
-    gdb_get_regl(buf, val);
-
-    ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, len), len);
-    return len;
+    return gdb_get_regl_value(mo, buf, &val);
 }
 
 static int gdb_set_spr_reg(CPUState *cs, uint8_t *mem_buf, int n)
@@ -441,18 +477,14 @@ static int gdb_get_float_reg(CPUState *cs, GByteArray *buf, int n)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
-    uint8_t *mem_buf;
+    MemOp mo;
     if (n < 32) {
-        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
-        mem_buf = gdb_get_reg_ptr(buf, 8);
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        return 8;
+        mo = ppc_gdb_memop(env, 8);
+        return gdb_get_reg64_value(mo, buf, cpu_fpr_ptr(env, n));
     }
     if (n == 32) {
-        gdb_get_reg32(buf, env->fpscr);
-        mem_buf = gdb_get_reg_ptr(buf, 4);
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        return 4;
+        mo = ppc_gdb_memop(env, TARGET_LONG_SIZE);
+        return gdb_get_regl_value(mo, buf, &env->fpscr);
     }
     return 0;
 }
@@ -479,26 +511,21 @@ static int gdb_get_avr_reg(CPUState *cs, GByteArray *buf, int n)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
-    uint8_t *mem_buf;
+    MemOp mo;
 
     if (n < 32) {
         ppc_avr_t *avr = cpu_avr_ptr(env, n);
-        gdb_get_reg128(buf, avr->VsrD(0), avr->VsrD(1));
-        mem_buf = gdb_get_reg_ptr(buf, 16);
-        ppc_maybe_bswap_register(env, mem_buf, 16);
-        return 16;
+        mo = ppc_gdb_memop(env, 16);
+        return gdb_get_register_value(mo, buf, avr);
     }
     if (n == 32) {
-        gdb_get_reg32(buf, ppc_get_vscr(env));
-        mem_buf = gdb_get_reg_ptr(buf, 4);
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        return 4;
+        uint32_t vscr = ppc_get_vscr(env);
+        mo = ppc_gdb_memop(env, 4);
+        return gdb_get_reg32_value(mo, buf, &vscr);
     }
     if (n == 33) {
-        gdb_get_reg32(buf, (uint32_t)env->spr[SPR_VRSAVE]);
-        mem_buf = gdb_get_reg_ptr(buf, 4);
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        return 4;
+        mo = ppc_gdb_memop(env, TARGET_LONG_SIZE);
+        return gdb_get_regl_value(mo, buf, &env->spr[SPR_VRSAVE]);
     }
     return 0;
 }
@@ -532,25 +559,25 @@ static int gdb_get_spe_reg(CPUState *cs, GByteArray *buf, int n)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
+    MemOp mo;
 
     if (n < 32) {
 #if defined(TARGET_PPC64)
-        gdb_get_reg32(buf, env->gpr[n] >> 32);
-        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
+        uint32_t low = env->gpr[n] >> 32;
+        mo = ppc_gdb_memop(env, 4);
+        return gdb_get_reg32_value(mo, buf, &low);
 #else
-        gdb_get_reg32(buf, env->gprh[n]);
+        mo = ppc_gdb_memop(env, 4);
+        return gdb_get_reg32_value(mo, buf, &env->gprh[n]);
 #endif
-        return 4;
     }
     if (n == 32) {
-        gdb_get_reg64(buf, env->spe_acc);
-        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
-        return 8;
+        mo = ppc_gdb_memop(env, 8);
+        return gdb_get_reg64_value(mo, buf, &env->spe_acc);
     }
     if (n == 33) {
-        gdb_get_reg32(buf, env->spe_fscr);
-        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
-        return 4;
+        mo = ppc_gdb_memop(env, 4);
+        return gdb_get_reg32_value(mo, buf, &env->spe_fscr);
     }
     return 0;
 }
@@ -593,9 +620,9 @@ static int gdb_get_vsx_reg(CPUState *cs, GByteArray *buf, int n)
     CPUPPCState *env = &cpu->env;
 
     if (n < 32) {
-        gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
-        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
-        return 8;
+        return gdb_get_reg64_value(ppc_gdb_memop(env, 8),
+                                   buf,
+                                   cpu_vsrl_ptr(env, n));
     }
     return 0;
 }
-- 
2.39.5
