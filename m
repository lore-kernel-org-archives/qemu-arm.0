Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r1sm22988584wrx.11.2020.02.25.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 04:55:37 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 049FF1FFAA;
	Tue, 25 Feb 2020 12:47:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	aaron@os.amperecomputing.com,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	kuhn.chenqun@huawei.com,
	robhenry@microsoft.com,
	fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	richard.henderson@linaro.org,
	balrogg@gmail.com,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	stefanb@linux.vnet.ibm.com,
	marcandre.lureau@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v3 19/19] tests/tcg: take into account expected clashes pauth-4
Date: Tue, 25 Feb 2020 12:47:10 +0000
Message-Id: <20200225124710.14152-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225124710.14152-1-alex.bennee@linaro.org>
References: <20200225124710.14152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dgrgPwCaSamc

Pointer authentication isn't perfect so measure the percentage of
failed checks. As we want to vary the pointer we work through a bunch
of different addresses.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/pauth-4.c | 54 +++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/tests/tcg/aarch64/pauth-4.c b/tests/tcg/aarch64/pauth-4.c
index 1040e92aec3..24a639e36ca 100644
--- a/tests/tcg/aarch64/pauth-4.c
+++ b/tests/tcg/aarch64/pauth-4.c
@@ -1,25 +1,45 @@
 #include <stdint.h>
 #include <assert.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#define TESTS 1000
 
 int main()
 {
-  uintptr_t x, y;
+    int i, count = 0;
+    float perc;
+    void *base = malloc(TESTS);
+
+    for (i = 0; i < TESTS; i++) {
+        uintptr_t in, x, y;
+
+        in = i + (uintptr_t) base;
+
+        asm("mov %0, %[in]\n\t"
+            "pacia %0, sp\n\t"        /* sigill if pauth not supported */
+            "eor %0, %0, #4\n\t"      /* corrupt single bit */
+            "mov %1, %0\n\t"
+            "autia %1, sp\n\t"        /* validate corrupted pointer */
+            "xpaci %0\n\t"            /* strip pac from corrupted pointer */
+            : /* out */ "=r"(x), "=r"(y)
+            : /* in */ [in] "r" (in)
+            : /* clobbers */);
 
-  asm("mov %0, lr\n\t"
-      "pacia %0, sp\n\t"        /* sigill if pauth not supported */
-      "eor %0, %0, #4\n\t"      /* corrupt single bit */
-      "mov %1, %0\n\t"
-      "autia %1, sp\n\t"        /* validate corrupted pointer */
-      "xpaci %0\n\t"            /* strip pac from corrupted pointer */
-      : "=r"(x), "=r"(y));
+        /*
+         * Once stripped, the corrupted pointer is of the form 0x0000...wxyz.
+         * We expect the autia to indicate failure, producing a pointer of the
+         * form 0x000e....wxyz.  Use xpaci and != for the test, rather than
+         * extracting explicit bits from the top, because the location of the
+         * error code "e" depends on the configuration of virtual memory.
+         */
+        if (x != y) {
+            count++;
+        }
 
-  /*
-   * Once stripped, the corrupted pointer is of the form 0x0000...wxyz.
-   * We expect the autia to indicate failure, producing a pointer of the
-   * form 0x000e....wxyz.  Use xpaci and != for the test, rather than
-   * extracting explicit bits from the top, because the location of the
-   * error code "e" depends on the configuration of virtual memory.
-   */
-  assert(x != y);
-  return 0;
+    }
+    perc = (float) count / (float) TESTS;
+    printf("Checks Passed: %0.2f%%", perc * 100.0);
+    assert(perc > 0.95);
+    return 0;
 }
-- 
2.20.1
