Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a203-v6sm1900890wme.46.2018.06.22.07.12.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:12:12 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 1DEE03E0C4D;
	Fri, 22 Jun 2018 15:12:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 16/22] risu_reginfo_aarch64: unionify VFP regs
Date: Fri, 22 Jun 2018 15:11:59 +0100
Message-Id: <20180622141205.16306-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nAyQuROFBAMT

This is preparation for the SVE work as we won't want to be carrying
around both VFP and SVE registers at the same time as they overlap.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_aarch64.c | 16 ++++++++--------
 risu_reginfo_aarch64.h |  9 ++++++++-
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 34dd9af..62a5599 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -64,7 +64,7 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
     ri->fpcr = fp->fpcr;
 
     for (i = 0; i < 32; i++) {
-        ri->vregs[i] = fp->vregs[i];
+        ri->simd.vregs[i] = fp->vregs[i];
     }
 }
 
@@ -92,8 +92,8 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
 
     for (i = 0; i < 32; i++) {
         fprintf(f, "  V%2d   : %016" PRIx64 "%016" PRIx64 "\n", i,
-                (uint64_t) (ri->vregs[i] >> 64),
-                (uint64_t) (ri->vregs[i] & 0xffffffffffffffff));
+                (uint64_t) (ri->simd.vregs[i] >> 64),
+                (uint64_t) (ri->simd.vregs[i] & 0xffffffffffffffff));
     }
 
     return !ferror(f);
@@ -138,14 +138,14 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
     }
 
     for (i = 0; i < 32; i++) {
-        if (m->vregs[i] != a->vregs[i]) {
+        if (m->simd.vregs[i] != a->simd.vregs[i]) {
             fprintf(f, "  V%2d   : "
                     "%016" PRIx64 "%016" PRIx64 " vs "
                     "%016" PRIx64 "%016" PRIx64 "\n", i,
-                    (uint64_t) (m->vregs[i] >> 64),
-                    (uint64_t) (m->vregs[i] & 0xffffffffffffffff),
-                    (uint64_t) (a->vregs[i] >> 64),
-                    (uint64_t) (a->vregs[i] & 0xffffffffffffffff));
+                    (uint64_t) (m->simd.vregs[i] >> 64),
+                    (uint64_t) (m->simd.vregs[i] & 0xffffffffffffffff),
+                    (uint64_t) (a->simd.vregs[i] >> 64),
+                    (uint64_t) (a->simd.vregs[i] & 0xffffffffffffffff));
         }
     }
 
diff --git a/risu_reginfo_aarch64.h b/risu_reginfo_aarch64.h
index a05fb4e..a1c708b 100644
--- a/risu_reginfo_aarch64.h
+++ b/risu_reginfo_aarch64.h
@@ -13,6 +13,10 @@
 #ifndef RISU_REGINFO_AARCH64_H
 #define RISU_REGINFO_AARCH64_H
 
+struct simd_reginfo {
+    __uint128_t vregs[32];
+};
+
 struct reginfo {
     uint64_t fault_address;
     uint64_t regs[31];
@@ -24,7 +28,10 @@ struct reginfo {
     /* FP/SIMD */
     uint32_t fpsr;
     uint32_t fpcr;
-    __uint128_t vregs[32];
+
+    union {
+        struct simd_reginfo simd;
+    };
 };
 
 #endif /* RISU_REGINFO_AARCH64_H */
-- 
2.17.1
