Received: by 10.25.77.65 with SMTP id a62csp303150lfb;
        Thu, 2 Feb 2017 12:02:26 -0800 (PST)
X-Received: by 10.46.77.17 with SMTP id a17mr4399460ljb.2.1486065746681;
        Thu, 02 Feb 2017 12:02:26 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id a26si10837340lfg.393.2017.02.02.12.02.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2017 12:02:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZNaK-0001us-JG; Thu, 02 Feb 2017 20:02:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 2/9] armv7m: Implement reading and writing of PRIGROUP
Date: Thu,  2 Feb 2017 20:02:15 +0000
Message-Id: <1486065742-28639-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
X-TUID: fP3WnVKJl900

Add a state field for the v7M PRIGROUP register and implent
reading and writing it. The current NVIC doesn't honour
the values written, but the new version will.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 09975f3..ce22001 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -24,6 +24,9 @@
 typedef struct NVICState {
     GICState gic;
     ARMCPU *cpu;
+
+    uint32_t prigroup;
+
     struct {
         uint32_t control;
         uint32_t reload;
@@ -223,7 +226,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
     case 0xd08: /* Vector Table Offset.  */
         return cpu->env.v7m.vecbase;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
-        return 0xfa050000;
+        return 0xfa050000 | (s->prigroup << 8);
     case 0xd10: /* System Control.  */
         /* TODO: Implement SLEEPONEXIT.  */
         return 0;
@@ -362,9 +365,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
             if (value & 1) {
                 qemu_log_mask(LOG_UNIMP, "AIRCR system reset unimplemented\n");
             }
-            if (value & 0x700) {
-                qemu_log_mask(LOG_UNIMP, "PRIGROUP unimplemented\n");
-            }
+            s->prigroup = extract32(value, 8, 3);
         }
         break;
     case 0xd10: /* System Control.  */
@@ -483,13 +484,14 @@ static const MemoryRegionOps nvic_sysreg_ops = {
 
 static const VMStateDescription vmstate_nvic = {
     .name = "armv7m_nvic",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(systick.control, NVICState),
         VMSTATE_UINT32(systick.reload, NVICState),
         VMSTATE_INT64(systick.tick, NVICState),
         VMSTATE_TIMER_PTR(systick.timer, NVICState),
+        VMSTATE_UINT32(prigroup, NVICState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4
