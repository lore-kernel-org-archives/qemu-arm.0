Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o15-v6sm1191295wrm.38.2018.06.22.07.12.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:12:17 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 643453E0D45;
	Fri, 22 Jun 2018 15:12:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 22/22] risu_reginfo_aarch64: handle variable VQ
Date: Fri, 22 Jun 2018 15:12:05 +0100
Message-Id: <20180622141205.16306-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RRch2aJ5tbYK

This involves parsing the command line parameter and calling the
kernel to set the VQ limit. We also add dumping of the register state
in the main register dump.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risu_reginfo_aarch64.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index bf98ba1..00d1c8b 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -18,6 +18,8 @@
 #include <stddef.h>
 #include <stdbool.h>
 #include <inttypes.h>
+#include <assert.h>
+#include <sys/prctl.h>
 
 #include "risu.h"
 #include "risu_reginfo_aarch64.h"
@@ -30,17 +32,41 @@ const char * const arch_extra_help;
 /* Should we test SVE register state */
 static int test_sve;
 static const struct option extra_opts[] = {
-    {"test-sve", no_argument, &test_sve, 1},
+    {"test-sve", required_argument, NULL, FIRST_ARCH_OPT },
     {0, 0, 0, 0}
 };
 
 const struct option * const arch_long_opts = &extra_opts[0];
-const char * const arch_extra_help = "  --test-sve        Compare SVE registers\n";
+const char * const arch_extra_help
+    = "  --test-sve=<vq>        Compare SVE registers with VQ\n";
 #endif
 
 void process_arch_opt(int opt, const char *arg)
 {
+#ifdef SVE_MAGIC
+    long want, got;
+
+    assert(opt == FIRST_ARCH_OPT);
+    test_sve = strtol(arg, 0, 10);
+
+    if (test_sve <= 0 || test_sve > SVE_VQ_MAX) {
+        fprintf(stderr, "Invalid value for VQ (1-%d)\n", SVE_VQ_MAX);
+        exit(1);
+    }
+    want = sve_vl_from_vq(test_sve);
+    got = prctl(PR_SVE_SET_VL, want);
+    if (want != got) {
+        if (got < 0) {
+            perror("prctl PR_SVE_SET_VL");
+        } else {
+            fprintf(stderr, "Unsupported value for VQ (%d != %d)\n",
+                    test_sve, (int)sve_vq_from_vl(got));
+        }
+        exit(1);
+    }
+#else
     abort();
+#endif
 }
 
 const int reginfo_size(void)
@@ -113,12 +139,18 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 
 #ifdef SVE_MAGIC
     if (test_sve) {
-        int vq = sve_vq_from_vl(sve->vl); /* number of quads for whole vl */
+        int vq = test_sve;
 
         if (sve == NULL) {
             fprintf(stderr, "risu_reginfo_aarch64: failed to get SVE state\n");
             return;
         }
+        if (sve->vl != sve_vl_from_vq(vq)) {
+            fprintf(stderr, "risu_reginfo_aarch64: "
+                    "unexpected SVE state: %d != %d\n",
+                    sve->vl, sve_vl_from_vq(vq));
+            return;
+        }
 
         ri->sve.vl = sve->vl;
 
-- 
2.17.1
