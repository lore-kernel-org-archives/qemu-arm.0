Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c4fc600b003cfa26c410asm2232016wmq.20.2022.11.09.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:46:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EFD541FFB7;
	Wed,  9 Nov 2022 14:46:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores)
Subject: [RFC PATCH] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Wed,  9 Nov 2022 14:46:08 +0000
Message-Id: <20221109144608.2567252-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SIfyFvZhj5fh

a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
this for the CPU interface register. The fact we don't implement it
shows up when running Xen with -d guest_error which is definitely
wrong because the guest is perfectly entitled to read it.

Lightly re-factor this region of registers and also add a comment to
the function in case anyway was under the illusion we only return
bytes from a function called readb.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gic.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..515923416c 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -941,6 +941,10 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     gic_update(s);
 }
 
+/*
+ * Although this is named a byte read we don't always return bytes and
+ * rely on the calling function oring bits together.
+ */
 static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
@@ -954,23 +958,34 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     cpu = gic_get_current_cpu(s);
     cm = 1 << cpu;
     if (offset < 0x100) {
-        if (offset == 0) {      /* GICD_CTLR */
-            if (s->security_extn && !attrs.secure) {
-                /* The NS bank of this register is just an alias of the
-                 * EnableGrp1 bit in the S bank version.
-                 */
-                return extract32(s->ctlr, 1, 1);
-            } else {
-                return s->ctlr;
+        if (offset < 0xc ) {
+            switch(offset) {
+            case 0: /* GICD_CTLR[7:0] */
+            {
+                if (s->security_extn && !attrs.secure) {
+                    /* The NS bank of this register is just an alias of the
+                     * EnableGrp1 bit in the S bank version.
+                     */
+                    return extract32(s->ctlr, 1, 1);
+                } else {
+                    return s->ctlr;
+                }
             }
-        }
-        if (offset == 4)
-            /* Interrupt Controller Type Register */
-            return ((s->num_irq / 32) - 1)
+            case 4: /* GIC_TYPER - Interrupt Controller Type Register */
+            {
+                return ((s->num_irq / 32) - 1)
                     | ((s->num_cpu - 1) << 5)
                     | (s->security_extn << 10);
-        if (offset < 0x08)
-            return 0;
+            }
+            case 8: /* GICD_IIDR - Implementer ID Register */
+            {
+                return 0x43b; /* Arm JEP106 identity */
+            }
+            default:
+                /* return 0 for high bits of above */
+                return 0;
+            }
+        }
         if (offset >= 0x80) {
             /* Interrupt Group Registers: these RAZ/WI if this is an NS
              * access to a GIC with the security extensions, or if the GIC
-- 
2.34.1
