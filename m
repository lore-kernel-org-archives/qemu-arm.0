Received: by 10.25.77.65 with SMTP id a62csp1918369lfb;
        Tue, 24 Jan 2017 11:16:32 -0800 (PST)
X-Received: by 10.99.66.198 with SMTP id p189mr41787037pga.30.1485285392510;
        Tue, 24 Jan 2017 11:16:32 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id a204si20326667pfa.101.2017.01.24.11.16.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:16:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cW6Zq-0000OZ-WE; Tue, 24 Jan 2017 19:16:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 04/10] armv7m: implement CCR, CFSR, HFSR, DFSR, BFAR, and MMFAR
Date: Tue, 24 Jan 2017 19:16:14 +0000
Message-Id: <1485285380-10565-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
X-TUID: ooehHUAvQ86s

From: Michael Davidsaver <mdavidsaver@gmail.com>

Implement the v7M system registers CCR, CFSR, HFSR, DFSR, BFAR and
MMFAR.  For the moment these simply read as written (with some basic
handling of RAZ/WI bits and W1C semantics).

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: drop warning about setting unimplemented CCR bits;
 tweak commit message; add DFSR]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 42 ++++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 81dcb83..60e72d7 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -228,8 +228,7 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
         /* TODO: Implement SLEEPONEXIT.  */
         return 0;
     case 0xd14: /* Configuration Control.  */
-        /* TODO: Implement Configuration Control bits.  */
-        return 0;
+        return cpu->env.v7m.ccr;
     case 0xd24: /* System Handler Status.  */
         val = 0;
         if (s->gic.irq_state[ARMV7M_EXCP_MEM].active) val |= (1 << 0);
@@ -248,16 +247,19 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
         if (s->gic.irq_state[ARMV7M_EXCP_USAGE].enabled) val |= (1 << 18);
         return val;
     case 0xd28: /* Configurable Fault Status.  */
-        /* TODO: Implement Fault Status.  */
-        qemu_log_mask(LOG_UNIMP, "Configurable Fault Status unimplemented\n");
-        return 0;
+        return cpu->env.v7m.cfsr;
     case 0xd2c: /* Hard Fault Status.  */
+        return cpu->env.v7m.hfsr;
     case 0xd30: /* Debug Fault Status.  */
-    case 0xd34: /* Mem Manage Address.  */
+        return cpu->env.v7m.dfsr;
+    case 0xd34: /* MMFAR MemManage Fault Address */
+        return cpu->env.v7m.mmfar;
     case 0xd38: /* Bus Fault Address.  */
+        return cpu->env.v7m.bfar;
     case 0xd3c: /* Aux Fault Status.  */
         /* TODO: Implement fault status registers.  */
-        qemu_log_mask(LOG_UNIMP, "Fault status registers unimplemented\n");
+        qemu_log_mask(LOG_UNIMP,
+                      "Aux Fault status registers unimplemented\n");
         return 0;
     case 0xd40: /* PFR0.  */
         return 0x00000030;
@@ -366,9 +368,19 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
         }
         break;
     case 0xd10: /* System Control.  */
-    case 0xd14: /* Configuration Control.  */
         /* TODO: Implement control registers.  */
-        qemu_log_mask(LOG_UNIMP, "NVIC: SCR and CCR unimplemented\n");
+        qemu_log_mask(LOG_UNIMP, "NVIC: SCR unimplemented\n");
+        break;
+    case 0xd14: /* Configuration Control.  */
+        /* Enforce RAZ/WI on reserved and must-RAZ/WI bits */
+        value &= (R_V7M_CCR_STKALIGN_MASK |
+                  R_V7M_CCR_BFHFNMIGN_MASK |
+                  R_V7M_CCR_DIV_0_TRP_MASK |
+                  R_V7M_CCR_UNALIGN_TRP_MASK |
+                  R_V7M_CCR_USERSETMPEND_MASK |
+                  R_V7M_CCR_NONBASETHRDENA_MASK);
+
+        cpu->env.v7m.ccr = value;
         break;
     case 0xd24: /* System Handler Control.  */
         /* TODO: Real hardware allows you to set/clear the active bits
@@ -378,13 +390,23 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
         s->gic.irq_state[ARMV7M_EXCP_USAGE].enabled = (value & (1 << 18)) != 0;
         break;
     case 0xd28: /* Configurable Fault Status.  */
+        cpu->env.v7m.cfsr &= ~value; /* W1C */
+        break;
     case 0xd2c: /* Hard Fault Status.  */
+        cpu->env.v7m.hfsr &= ~value; /* W1C */
+        break;
     case 0xd30: /* Debug Fault Status.  */
+        cpu->env.v7m.dfsr &= ~value; /* W1C */
+        break;
     case 0xd34: /* Mem Manage Address.  */
+        cpu->env.v7m.mmfar = value;
+        return;
     case 0xd38: /* Bus Fault Address.  */
+        cpu->env.v7m.bfar = value;
+        return;
     case 0xd3c: /* Aux Fault Status.  */
         qemu_log_mask(LOG_UNIMP,
-                      "NVIC: fault status registers unimplemented\n");
+                      "NVIC: Aux fault status registers unimplemented\n");
         break;
     case 0xf00: /* Software Triggered Interrupt Register */
         if ((value & 0x1ff) < s->num_irq) {
-- 
2.7.4
