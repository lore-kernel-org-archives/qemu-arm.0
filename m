Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id q13-20020adfea0d000000b0023677fd2657sm12650100wrm.52.2022.11.15.08.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 08:17:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EA5F31FFB8;
	Tue, 15 Nov 2022 16:17:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH  v2 1/2] hw/intc: clean-up access to GIC multi-byte registers
Date: Tue, 15 Nov 2022 16:17:35 +0000
Message-Id: <20221115161736.2425584-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115161736.2425584-1-alex.bennee@linaro.org>
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z4h/hSge/n9c

gic_dist_readb was returning a word value which just happened to work
as a result of the way we OR the data together. Lets fix it so only
the explicit byte is returned for each part of GICD_TYPER. I've
changed the return type to uint8_t although the overflow is only
detected with an explicit -Wconversion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/arm_gic.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..1a04144c38 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -941,7 +941,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     gic_update(s);
 }
 
-static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
+static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
     uint32_t res;
@@ -955,6 +955,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     cm = 1 << cpu;
     if (offset < 0x100) {
         if (offset == 0) {      /* GICD_CTLR */
+            /* We rely here on the only non-zero bits being in byte 0 */
             if (s->security_extn && !attrs.secure) {
                 /* The NS bank of this register is just an alias of the
                  * EnableGrp1 bit in the S bank version.
@@ -964,11 +965,14 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
                 return s->ctlr;
             }
         }
-        if (offset == 4)
-            /* Interrupt Controller Type Register */
-            return ((s->num_irq / 32) - 1)
-                    | ((s->num_cpu - 1) << 5)
-                    | (s->security_extn << 10);
+        if (offset == 4) {
+            /* GICD_TYPER byte 0 */
+            return ((s->num_irq / 32) - 1) | ((s->num_cpu - 1) << 5);
+        }
+        if (offset == 5) {
+            /* GICD_TYPER byte 1 */
+            return (s->security_extn << 2);
+        }
         if (offset < 0x08)
             return 0;
         if (offset >= 0x80) {
-- 
2.34.1
