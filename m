Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o135sm2262492wmg.1.2017.11.07.07.06.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2017 07:06:16 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id F3AA03E061C;
	Tue,  7 Nov 2017 15:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: Dave.Martin@arm.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 10/10] risu_reginfo_aarch64: add SVE support to reginfo_dump_mismatch
Date: Tue,  7 Nov 2017 15:05:58 +0000
Message-Id: <20171107150558.22131-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171107150558.22131-1-alex.bennee@linaro.org>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OssAyIDcR4Ur

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risu_reginfo_aarch64.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 7c97790..8aba192 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -141,6 +141,18 @@ int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
     return memcmp(r1, r2, sizeof(*r1)) == 0;
 }
 
+#ifdef SVE_MAGIC
+static int sve_zreg_is_eq(struct reginfo *r1, struct reginfo *r2, int z)
+{
+    return memcmp(r1->zregs[z], r2->zregs[z], sizeof(*r1->zregs[z])) == 0;
+}
+
+static int sve_preg_is_eq(struct reginfo *r1, struct reginfo *r2, int p)
+{
+    return memcmp(r1->pregs[p], r2->pregs[p], sizeof(*r1->pregs[p])) == 0;
+}
+#endif
+
 /* reginfo_dump: print state to a stream, returns nonzero on success */
 int reginfo_dump(struct reginfo *ri, FILE * f)
 {
@@ -216,5 +228,42 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
         }
     }
 
+#ifdef SVE_MAGIC
+    if (test_sve) {
+        if (m->vl != a->vl) {
+            fprintf(f, "  SVE VL  : %d vs %d\n", m->vl, a->vl);
+        }
+        for (i = 0; i < SVE_NUM_PREGS; i++) {
+           if (!sve_preg_is_eq(m, a, i)) {
+              int q;
+              fprintf(f, "  P%2d   : ", i);
+              for (q = 0; q < sve_vq_from_vl(m->vl); q++) {
+                 fprintf(f, "%04x", m->pregs[i][q]);
+              }
+              fprintf(f, " vs ");
+              for (q = 0; q < sve_vq_from_vl(m->vl); q++) {
+                 fprintf(f, "%04x", a->pregs[i][q]);
+              }
+              fprintf(f, "\n");
+            }
+        }
+        for (i = 0; i < SVE_NUM_ZREGS; i++) {
+           if (!sve_zreg_is_eq(m, a, i)) {
+              int q;
+              char *pad="";
+              fprintf(f, "  Z%2d   : ", i);
+              for (q = 0; q < sve_vq_from_vl(m->vl); q++) {
+                 if (m->zregs[i][q] != a->zregs[i][q]) {
+                    fprintf(f, "%sq%02d: %016" PRIx64 "%016" PRIx64 " vs %016" PRIx64 "%016" PRIx64"\n", pad, q,
+                            (uint64_t) (m->zregs[i][q] >> 64), (uint64_t) m->zregs[i][q],
+                            (uint64_t) (a->zregs[i][q] >> 64), (uint64_t) a->zregs[i][q]);
+                    pad = "          ";
+                 }
+              }
+           }
+        }
+    }
+#endif
+
     return !ferror(f);
 }
-- 
2.14.2
