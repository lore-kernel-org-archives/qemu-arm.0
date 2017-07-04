Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 5sm14935900wrq.60.2017.07.04.07.48.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:09 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id CBAD03E19E2;
	Tue,  4 Jul 2017 15:49:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 01/11] risu: make match status take tracing into account
Date: Tue,  4 Jul 2017 15:48:49 +0100
Message-Id: <20170704144859.17644-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: a3NgQKcUab+v

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 reginfo.c | 14 +++++++++-----
 risu.c    |  4 ++--
 risu.h    |  2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/reginfo.c b/reginfo.c
index 13879d5..d9d37b3 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -138,7 +138,7 @@ int recv_and_compare_register_info(read_fn read_fn,
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(void)
+int report_match_status(int trace)
 {
     int resp = 0;
     fprintf(stderr, "match status...\n");
@@ -148,7 +148,7 @@ int report_match_status(void)
         /* We don't have valid reginfo from the apprentice side
          * so stop now rather than printing anything about it.
          */
-        fprintf(stderr, "master reginfo:\n");
+        fprintf(stderr, "%s reginfo:\n", trace ? "this":"master");
         reginfo_dump(&master_ri, stderr);
         return 1;
     }
@@ -166,11 +166,15 @@ int report_match_status(void)
         return 0;
     }
 
-    fprintf(stderr, "master reginfo:\n");
+    fprintf(stderr, "%s reginfo:\n", trace ? "this":"master");
     reginfo_dump(&master_ri, stderr);
-    fprintf(stderr, "apprentice reginfo:\n");
+    fprintf(stderr, "%s reginfo:\n", trace ? "trace":"apprentice");
     reginfo_dump(&apprentice_ri, stderr);
 
-    reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
+    if (trace) {
+        reginfo_dump_mismatch(&apprentice_ri, &master_ri, stderr);
+    } else {
+        reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
+    }
     return resp;
 }
diff --git a/risu.c b/risu.c
index 6f213dc..47471c6 100644
--- a/risu.c
+++ b/risu.c
@@ -228,7 +228,7 @@ int master(void)
                     signal_count);
             return 0;
         } else {
-            return report_match_status();
+            return report_match_status(0);
         }
     }
     set_sigill_handler(&master_sigill);
@@ -250,7 +250,7 @@ int apprentice(void)
 #endif
         close(apprentice_fd);
         fprintf(stderr, "finished early after %zd checkpoints\n", signal_count);
-        return report_match_status();
+        return report_match_status(1);
     }
     set_sigill_handler(&apprentice_sigill);
     fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
diff --git a/risu.h b/risu.h
index 9f15662..1c8ecee 100644
--- a/risu.h
+++ b/risu.h
@@ -91,7 +91,7 @@ int recv_and_compare_register_info(read_fn read_fn,
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(void);
+int report_match_status(int trace);
 
 /* Interface provided by CPU-specific code: */
 
-- 
2.13.0
