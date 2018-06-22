Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v15-v6sm6653169wrq.37.2018.06.22.07.22.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:22:00 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4DB983E0CA2;
	Fri, 22 Jun 2018 15:12:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 20/22] risu_reginfo_aarch64: add SVE support to reginfo_dump_mismatch
Date: Fri, 22 Jun 2018 15:12:03 +0100
Message-Id: <20180622141205.16306-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kFg7v/zNF6Bm

We also tweak the justification of the rest of the registers so the :
lines up nicely across the register dump and diff dump.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - include ffr in comparison
  - mild re-factor of preg cmp/diff
v3
  - re-factoring
v4
  - alignment/justification tweaks
  - merge chunks from the variable VQ patch
---
 risu_reginfo_aarch64.c | 140 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 16 deletions(-)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 79db5dd..bf98ba1 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -17,6 +17,7 @@
 #include <stdlib.h>
 #include <stddef.h>
 #include <stdbool.h>
+#include <inttypes.h>
 
 #include "risu.h"
 #include "risu_reginfo_aarch64.h"
@@ -146,12 +147,12 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
         }
 
         /* Finally the FFR */
-        memcpy(&ri->sve.ffr,(void *)sve + SVE_SIG_FFR_OFFSET(vq),
+        memcpy(&ri->sve.ffr, (void *)sve + SVE_SIG_FFR_OFFSET(vq),
                SVE_SIG_FFR_SIZE(vq));
 
         return;
     }
-#endif
+#endif /* SVE_MAGIC */
 
     for (i = 0; i < 32; i++) {
         ri->simd.vregs[i] = fp->vregs[i];
@@ -164,6 +165,52 @@ int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
     return memcmp(r1, r2, reginfo_size()) == 0;
 }
 
+#ifdef SVE_MAGIC
+static int sve_zreg_is_eq(int vq, const void *z1, const void *z2)
+{
+    return memcmp(z1, z2, vq * 16) == 0;
+}
+
+static int sve_preg_is_eq(int vq, const void *p1, const void *p2)
+{
+    return memcmp(p1, p2, vq * 2) == 0;
+}
+
+static void sve_dump_preg(FILE *f, int vq, const uint16_t *p)
+{
+    int q;
+    for (q = vq - 1; q >= 0; q--) {
+        fprintf(f, "%04x", p[q]);
+    }
+}
+
+static void sve_dump_preg_diff(FILE *f, int vq, const uint16_t *p1,
+                               const uint16_t *p2)
+{
+    sve_dump_preg(f, vq, p1);
+    fprintf(f, " vs ");
+    sve_dump_preg(f, vq, p2);
+    fprintf(f, "\n");
+}
+
+static void sve_dump_zreg_diff(FILE *f, int vq, const __uint128_t *z1,
+                               const __uint128_t *z2)
+{
+    const char *pad = "";
+    int q;
+
+    for (q = 0; q < vq; ++q) {
+        if (z1[q] != z2[q]) {
+            fprintf(f, "%sq%-2d: %016" PRIx64 "%016" PRIx64
+                    " vs %016" PRIx64 "%016" PRIx64"\n", pad, q,
+                    (uint64_t)(z1[q] >> 64), (uint64_t)z1[q],
+                    (uint64_t)(z2[q] >> 64), (uint64_t)z2[q]);
+            pad = "      ";
+        }
+    }
+}
+#endif
+
 /* reginfo_dump: print state to a stream, returns nonzero on success */
 int reginfo_dump(struct reginfo *ri, FILE * f)
 {
@@ -171,17 +218,47 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
     fprintf(f, "  faulting insn %08x\n", ri->faulting_insn);
 
     for (i = 0; i < 31; i++) {
-        fprintf(f, "  X%-2d   : %016" PRIx64 "\n", i, ri->regs[i]);
+        fprintf(f, "  X%-2d    : %016" PRIx64 "\n", i, ri->regs[i]);
     }
 
-    fprintf(f, "  sp    : %016" PRIx64 "\n", ri->sp);
-    fprintf(f, "  pc    : %016" PRIx64 "\n", ri->pc);
-    fprintf(f, "  flags : %08x\n", ri->flags);
-    fprintf(f, "  fpsr  : %08x\n", ri->fpsr);
-    fprintf(f, "  fpcr  : %08x\n", ri->fpcr);
+    fprintf(f, "  sp     : %016" PRIx64 "\n", ri->sp);
+    fprintf(f, "  pc     : %016" PRIx64 "\n", ri->pc);
+    fprintf(f, "  flags  : %08x\n", ri->flags);
+    fprintf(f, "  fpsr   : %08x\n", ri->fpsr);
+    fprintf(f, "  fpcr   : %08x\n", ri->fpcr);
+
+#ifdef SVE_MAGIC
+    if (test_sve) {
+        int q, vq = test_sve;
+
+        fprintf(f, "  vl     : %d\n", ri->sve.vl);
+
+        for (i = 0; i < 32; i++) {
+            fprintf(f, "  Z%-2d q%-2d: %016" PRIx64 "%016" PRIx64 "\n", i, 0,
+                    (uint64_t)(ri->sve.zregs[i][0] >> 64),
+                    (uint64_t)ri->sve.zregs[i][0]);
+            for (q = 1; q < vq; ++q) {
+                fprintf(f, "      q%-2d: %016" PRIx64 "%016" PRIx64 "\n", q,
+                        (uint64_t)(ri->sve.zregs[i][q] >> 64),
+                        (uint64_t)ri->sve.zregs[i][q]);
+            }
+        }
+
+        for (i = 0; i < 16; i++) {
+            fprintf(f, "  P%-2d    : ", i);
+            sve_dump_preg(f, vq, &ri->sve.pregs[i][0]);
+            fprintf(f, "\n");
+        }
+        fprintf(f, "  FFR    : ");
+        sve_dump_preg(f, vq, &ri->sve.ffr[0]);
+        fprintf(f, "\n");
+
+        return !ferror(f);
+    }
+#endif
 
     for (i = 0; i < 32; i++) {
-        fprintf(f, "  V%-2d   : %016" PRIx64 "%016" PRIx64 "\n", i,
+        fprintf(f, "  V%-2d    : %016" PRIx64 "%016" PRIx64 "\n", i,
                 (uint64_t) (ri->simd.vregs[i] >> 64),
                 (uint64_t) (ri->simd.vregs[i]));
     }
@@ -200,36 +277,67 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
     }
     for (i = 0; i < 31; i++) {
         if (m->regs[i] != a->regs[i]) {
-            fprintf(f, "  X%-2d   : %016" PRIx64 " vs %016" PRIx64 "\n",
+            fprintf(f, "  X%-2d    : %016" PRIx64 " vs %016" PRIx64 "\n",
                     i, m->regs[i], a->regs[i]);
         }
     }
 
     if (m->sp != a->sp) {
-        fprintf(f, "  sp    : %016" PRIx64 " vs %016" PRIx64 "\n",
+        fprintf(f, "  sp     : %016" PRIx64 " vs %016" PRIx64 "\n",
                 m->sp, a->sp);
     }
 
     if (m->pc != a->pc) {
-        fprintf(f, "  pc    : %016" PRIx64 " vs %016" PRIx64 "\n",
+        fprintf(f, "  pc     : %016" PRIx64 " vs %016" PRIx64 "\n",
                 m->pc, a->pc);
     }
 
     if (m->flags != a->flags) {
-        fprintf(f, "  flags : %08x vs %08x\n", m->flags, a->flags);
+        fprintf(f, "  flags  : %08x vs %08x\n", m->flags, a->flags);
     }
 
     if (m->fpsr != a->fpsr) {
-        fprintf(f, "  fpsr  : %08x vs %08x\n", m->fpsr, a->fpsr);
+        fprintf(f, "  fpsr   : %08x vs %08x\n", m->fpsr, a->fpsr);
     }
 
     if (m->fpcr != a->fpcr) {
-        fprintf(f, "  fpcr  : %08x vs %08x\n", m->fpcr, a->fpcr);
+        fprintf(f, "  fpcr   : %08x vs %08x\n", m->fpcr, a->fpcr);
     }
 
+#ifdef SVE_MAGIC
+    if (test_sve) {
+        int vq = sve_vq_from_vl(m->sve.vl);
+
+        if (m->sve.vl != a->sve.vl) {
+            fprintf(f, "  vl    : %d vs %d\n", m->sve.vl, a->sve.vl);
+        }
+
+        for (i = 0; i < SVE_NUM_ZREGS; i++) {
+            if (!sve_zreg_is_eq(vq, &m->sve.zregs[i], &a->sve.zregs[i])) {
+                fprintf(f, "  Z%-2d ", i);
+                sve_dump_zreg_diff(f, vq, &m->sve.zregs[i][0],
+                                   &a->sve.zregs[i][0]);
+            }
+        }
+        for (i = 0; i < SVE_NUM_PREGS; i++) {
+            if (!sve_preg_is_eq(vq, &m->sve.pregs[i], &a->sve.pregs[i])) {
+                fprintf(f, "  P%-2d    : ", i);
+                sve_dump_preg_diff(f, vq, &m->sve.pregs[i][0],
+                                   &a->sve.pregs[i][0]);
+            }
+        }
+        if (!sve_preg_is_eq(vq, &m->sve.ffr, &a->sve.ffr)) {
+            fprintf(f, "  FFR   : ");
+            sve_dump_preg_diff(f, vq, &m->sve.pregs[i][0], &a->sve.pregs[i][0]);
+        }
+
+        return !ferror(f);
+    }
+#endif
+
     for (i = 0; i < 32; i++) {
         if (m->simd.vregs[i] != a->simd.vregs[i]) {
-            fprintf(f, "  V%-2d   : "
+            fprintf(f, "  V%-2d    : "
                     "%016" PRIx64 "%016" PRIx64 " vs "
                     "%016" PRIx64 "%016" PRIx64 "\n", i,
                     (uint64_t) (m->simd.vregs[i] >> 64),
-- 
2.17.1
