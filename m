Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h7-v6sm1736493wmb.48.2018.06.13.06.04.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 06:04:45 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id DB8EC3E12A1;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 14/22] risu: add process_arch_opt
Date: Wed, 13 Jun 2018 13:55:53 +0100
Message-Id: <20180613125601.14371-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +55E/dv5gfhH

From: Richard Henderson <richard.henderson@linaro.org>

Allows the backend to do more that just set a flag when it comes to
processing options.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[AJB: tweaked order, added stdlib includes]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risu.c                 | 33 +++++++++++----------------------
 risu.h                 |  7 +++++--
 risu_reginfo_aarch64.c | 10 ++++++++--
 risu_reginfo_arm.c     | 14 ++++++++++----
 risu_reginfo_m68k.c    | 10 ++++++++--
 risu_reginfo_ppc64.c   | 10 ++++++++--
 6 files changed, 50 insertions(+), 34 deletions(-)

diff --git a/risu.c b/risu.c
index 18de351..01525d2 100644
--- a/risu.c
+++ b/risu.c
@@ -18,7 +18,6 @@
 #include <errno.h>
 #include <signal.h>
 #include <ucontext.h>
-#include <getopt.h>
 #include <setjmp.h>
 #include <assert.h>
 #include <sys/stat.h>
@@ -27,7 +26,6 @@
 #include <string.h>
 
 #include "config.h"
-
 #include "risu.h"
 
 void *memblock;
@@ -287,7 +285,7 @@ void usage(void)
     }
 }
 
-struct option * setup_options(char **short_opts)
+static struct option * setup_options(char **short_opts)
 {
     static struct option default_longopts[] = {
         {"help", no_argument, 0, '?'},
@@ -303,20 +301,19 @@ struct option * setup_options(char **short_opts)
 
     if (arch_long_opts) {
         const size_t osize = sizeof(struct option);
-        const int default_count = ARRAY_SIZE(default_longopts);
-        struct option *dptr;
-        int extra_count = 0;
+        const int default_count = ARRAY_SIZE(default_longopts) - 1;
+        int arch_count;
 
         /* count additional opts */
-        dptr = arch_long_opts;
-        do {} while (dptr[extra_count++].name);
+        for (arch_count = 0; arch_long_opts[arch_count].name; arch_count++) {
+            continue;
+        }
 
-        lopts = calloc(default_count + extra_count, osize);
+        lopts = calloc(default_count + arch_count + 1, osize);
 
         /* Copy default opts + extra opts */
         memcpy(lopts, default_longopts, default_count * osize);
-        dptr = &lopts[default_count - 1];
-        memcpy(dptr, arch_long_opts, extra_count * osize);
+        memcpy(lopts + default_count, arch_long_opts, arch_count * osize);
     }
 
     return lopts;
@@ -343,34 +340,26 @@ int main(int argc, char **argv)
 
         switch (c) {
         case 0:
-        {
             /* flag set by getopt_long, do nothing */
             break;
-        }
         case 't':
-        {
             trace_fn = optarg;
             trace = 1;
             break;
-        }
         case 'h':
-        {
             hostname = optarg;
             break;
-        }
         case 'p':
-        {
             /* FIXME err handling */
             port = strtol(optarg, 0, 10);
             break;
-        }
         case '?':
-        {
             usage();
             exit(1);
-        }
         default:
-            abort();
+            assert(c >= FIRST_ARCH_OPT);
+            process_arch_opt(c, optarg);
+            break;
         }
     }
 
diff --git a/risu.h b/risu.h
index 89811f4..48c50d9 100644
--- a/risu.h
+++ b/risu.h
@@ -16,10 +16,13 @@
 #include <stdint.h>
 #include <ucontext.h>
 #include <stdio.h>
+#include <getopt.h>
 
 /* Extra option processing for architectures */
-extern void *arch_long_opts;
-extern char *arch_extra_help;
+extern const struct option * const arch_long_opts;
+extern const char * const arch_extra_help;
+void process_arch_opt(int opt, const char *arg);
+#define FIRST_ARCH_OPT   0x100
 
 /* GCC computed include to pull in the correct risu_reginfo_*.h for
  * the architecture.
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index ab12270..c270e0b 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -14,12 +14,18 @@
 #include <ucontext.h>
 #include <string.h>
 #include <signal.h> /* for FPSIMD_MAGIC */
+#include <stdlib.h>
 
 #include "risu.h"
 #include "risu_reginfo_aarch64.h"
 
-void *arch_long_opts;
-char *arch_extra_help;
+const struct option * const arch_long_opts;
+const char * const arch_extra_help;
+
+void process_arch_opt(int opt, const char *arg)
+{
+    abort();
+}
 
 /* reginfo_init: initialize with a ucontext */
 void reginfo_init(struct reginfo *ri, ucontext_t *uc)
diff --git a/risu_reginfo_arm.c b/risu_reginfo_arm.c
index 5acad02..12ad0ef 100644
--- a/risu_reginfo_arm.c
+++ b/risu_reginfo_arm.c
@@ -13,7 +13,7 @@
 #include <stdio.h>
 #include <ucontext.h>
 #include <string.h>
-#include <getopt.h>
+#include <stdlib.h>
 
 #include "risu.h"
 #include "risu_reginfo_arm.h"
@@ -22,13 +22,19 @@ extern int insnsize(ucontext_t *uc);
 
 /* Should we test for FP exception status bits? */
 static int test_fp_exc;
-static struct option extra_opts[] = {
+static const struct option extra_opts[] = {
     {"test-fp-exc", no_argument, &test_fp_exc, 1},
     {0, 0, 0, 0}
 };
 
-void *arch_long_opts = &extra_opts[0];
-char *arch_extra_help = "  --test-fp-exc     Check FP exception bits when comparing\n";
+const struct option * const arch_long_opts = &extra_opts[0];
+const char * const arch_extra_help =
+    "  --test-fp-exc     Check FP exception bits when comparing\n";
+
+void process_arch_opt(int opt, const char *arg)
+{
+    abort();
+}
 
 static void reginfo_init_vfp(struct reginfo *ri, ucontext_t *uc)
 {
diff --git a/risu_reginfo_m68k.c b/risu_reginfo_m68k.c
index d429502..7a1c5a9 100644
--- a/risu_reginfo_m68k.c
+++ b/risu_reginfo_m68k.c
@@ -10,12 +10,18 @@
 #include <ucontext.h>
 #include <string.h>
 #include <math.h>
+#include <stdlib.h>
 
 #include "risu.h"
 #include "risu_reginfo_m68k.h"
 
-void *arch_long_opts;
-char *arch_extra_help;
+const struct option * const arch_long_opts;
+const char * const arch_extra_help;
+
+void process_arch_opt(int opt, const char *arg)
+{
+    abort();
+}
 
 /* reginfo_init: initialize with a ucontext */
 void reginfo_init(struct reginfo *ri, ucontext_t *uc)
diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index 395111c..4b70460 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -15,6 +15,7 @@
 #include <ucontext.h>
 #include <string.h>
 #include <math.h>
+#include <stdlib.h>
 
 #include "risu.h"
 #include "risu_reginfo_ppc64.h"
@@ -22,8 +23,13 @@
 #define XER 37
 #define CCR 38
 
-void *arch_long_opts;
-char *arch_extra_help;
+const struct option * const arch_long_opts;
+const char * const arch_extra_help;
+
+void process_arch_opt(int opt, const char *arg)
+{
+    abort();
+}
 
 /* reginfo_init: initialize with a ucontext */
 void reginfo_init(struct reginfo *ri, ucontext_t *uc)
-- 
2.17.1
