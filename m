Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id ce6sm27962028wjc.27.2016.09.05.07.10.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Sep 2016 07:10:01 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 590983E0648;
	Mon,  5 Sep 2016 15:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores)
Subject: [RFC PATCH] hw/intc/arm_gic: handle Set-Active/Clear-Active registers
Date: Mon,  5 Sep 2016 15:09:44 +0100
Message-Id: <20160905140944.5379-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I4SMGd6aPLSm

I noticed while testing with modern kernels and -d guest_errors warnings
about invalid writes to the GIC. For GICv2 these registers certainly
should work so I've implemented both. As the code is common between all
the various GICs writes to GICD_ISACTIVERn is checked to ensure it is
not a RO register for v1 GICs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gic.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b30cc91..423a4ae 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -972,9 +972,38 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
                 GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
             }
         }
+    } else if (offset < 0x380) {
+        /* Interrupt Set-Active */
+        irq = (offset - 0x300) * 8 + GIC_BASE_IRQ;
+        if (irq >= s->num_irq || s->revision < 2)
+            goto bad_reg;
+
+        for (i = 0; i < 8; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
+            if (value & (1 << i)) {
+                GIC_SET_ACTIVE(irq + i, 1 << cpu);
+            }
+        }
     } else if (offset < 0x400) {
-        /* Interrupt Active.  */
-        goto bad_reg;
+        /* Interrupt Clear-Active  */
+        irq = (offset - 0x380) * 8 + GIC_BASE_IRQ;
+        if (irq >= s->num_irq)
+            goto bad_reg;
+
+        for (i = 0; i < 8; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
+            if (value & (1 << i)) {
+                GIC_CLEAR_ACTIVE(irq + i, 1 << cpu);
+            }
+        }
     } else if (offset < 0x800) {
         /* Interrupt Priority.  */
         irq = (offset - 0x400) + GIC_BASE_IRQ;
-- 
2.9.3
