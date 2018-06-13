Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c3-v6sm1748869wmb.40.2018.06.13.06.04.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 06:04:45 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 1928E3E12F0;
	Wed, 13 Jun 2018 13:56:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 18/22] risu_reginfo_aarch64: left justify regnums and drop masks
Date: Wed, 13 Jun 2018 13:55:57 +0100
Message-Id: <20180613125601.14371-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1i7DUkGj/ov/

Left justification is more pleasing to the eye than the default. We
also drop the masking which isn't needed as we are casting to a
smaller size anyway.

This was split out of Richard's re-factoring work for SVE.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risu_reginfo_aarch64.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 5da9e39..3ccaf0e 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -90,7 +90,7 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
     fprintf(f, "  faulting insn %08x\n", ri->faulting_insn);
 
     for (i = 0; i < 31; i++) {
-        fprintf(f, "  X%2d   : %016" PRIx64 "\n", i, ri->regs[i]);
+        fprintf(f, "  X%-2d   : %016" PRIx64 "\n", i, ri->regs[i]);
     }
 
     fprintf(f, "  sp    : %016" PRIx64 "\n", ri->sp);
@@ -100,9 +100,9 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
     fprintf(f, "  fpcr  : %08x\n", ri->fpcr);
 
     for (i = 0; i < 32; i++) {
-        fprintf(f, "  V%2d   : %016" PRIx64 "%016" PRIx64 "\n", i,
+        fprintf(f, "  V%-2d   : %016" PRIx64 "%016" PRIx64 "\n", i,
                 (uint64_t) (ri->simd.vregs[i] >> 64),
-                (uint64_t) (ri->simd.vregs[i] & 0xffffffffffffffff));
+                (uint64_t) (ri->simd.vregs[i]));
     }
 
     return !ferror(f);
@@ -119,7 +119,7 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
     }
     for (i = 0; i < 31; i++) {
         if (m->regs[i] != a->regs[i]) {
-            fprintf(f, "  X%2d   : %016" PRIx64 " vs %016" PRIx64 "\n",
+            fprintf(f, "  X%-2d   : %016" PRIx64 " vs %016" PRIx64 "\n",
                     i, m->regs[i], a->regs[i]);
         }
     }
@@ -148,13 +148,13 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
 
     for (i = 0; i < 32; i++) {
         if (m->simd.vregs[i] != a->simd.vregs[i]) {
-            fprintf(f, "  V%2d   : "
+            fprintf(f, "  V%-2d   : "
                     "%016" PRIx64 "%016" PRIx64 " vs "
                     "%016" PRIx64 "%016" PRIx64 "\n", i,
                     (uint64_t) (m->simd.vregs[i] >> 64),
-                    (uint64_t) (m->simd.vregs[i] & 0xffffffffffffffff),
+                    (uint64_t) m->simd.vregs[i],
                     (uint64_t) (a->simd.vregs[i] >> 64),
-                    (uint64_t) (a->simd.vregs[i] & 0xffffffffffffffff));
+                    (uint64_t) a->simd.vregs[i]);
         }
     }
 
-- 
2.17.1
