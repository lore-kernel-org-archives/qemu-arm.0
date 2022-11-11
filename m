Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c3b9300b003b4c979e6bcsm9831705wms.10.2022.11.11.06.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 06:55:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 26F421FFC4;
	Fri, 11 Nov 2022 14:55:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH  v2 12/12] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Fri, 11 Nov 2022 14:55:29 +0000
Message-Id: <20221111145529.4020801-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eE6Cmrfd3Kh6

a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
this for the CPU interface register. The fact we don't implement it
shows up when running Xen with -d guest_error which is definitely
wrong because the guest is perfectly entitled to read it.

Lightly re-factor this region of registers and also add a comment to
the function in case anyway was under the illusion we only return
bytes from a function called readb.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - checkpatch fixes.
---
 hw/intc/arm_gic.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..65b1ef7151 100644
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
@@ -954,23 +958,35 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
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
+        if (offset < 0xc) {
+            switch (offset) {
+            case 0: /* GICD_CTLR[7:0] */
+            {
+                if (s->security_extn && !attrs.secure) {
+                    /*
+                     * The NS bank of this register is just an alias of the
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
