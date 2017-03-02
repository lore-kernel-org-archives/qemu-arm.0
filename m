Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t194sm24255300wmd.13.2017.03.02.11.53.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Mar 2017 11:53:43 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id D84C83E0BD2;
	Thu,  2 Mar 2017 19:53:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH v2 11/11] hw/intc/arm_gic: modernise the DPRINTF
Date: Thu,  2 Mar 2017 19:53:37 +0000
Message-Id: <20170302195337.31558-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170302195337.31558-1-alex.bennee@linaro.org>
References: <20170302195337.31558-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mg4E79KqmLea

While I was debugging the icount issues I realised a bunch of the
messages look quite similar. I've fixed this by including __func__ in
the debug print. At the same time I move the a modern if (GATE) style
printf which ensures the compiler can check for format string errors
even if the code gets optimised away in the non-DEBUG_GIC case.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gic.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 8e5a9d8a3e..b305d9032a 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -26,15 +26,20 @@
 #include "qemu/log.h"
 #include "trace.h"
 
-//#define DEBUG_GIC
+/* #define DEBUG_GIC */
 
 #ifdef DEBUG_GIC
-#define DPRINTF(fmt, ...) \
-do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS__); } while (0)
+#define DEBUG_GIC_GATE 1
 #else
-#define DPRINTF(fmt, ...) do {} while(0)
+#define DEBUG_GIC_GATE 0
 #endif
 
+#define DPRINTF(fmt, ...) do {                                          \
+        if (DEBUG_GIC_GATE) {                                           \
+            fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__);      \
+        }                                                               \
+    } while (0)
+
 static const uint8_t gic_id_11mpcore[] = {
     0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
-- 
2.11.0
