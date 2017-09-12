Received: by 10.223.172.38 with SMTP id v35csp7480120wrc;
        Tue, 12 Sep 2017 11:26:03 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCOfiiBXX/+eznxNQRUAOYYjTjXF2C1KlT4cRNMD5uDG0UxBuXEC0wjLafSc4hfAgCjIV4u
X-Received: by 10.55.12.133 with SMTP id 127mr20217932qkm.251.1505240763419;
        Tue, 12 Sep 2017 11:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240763; cv=none;
        d=google.com; s=arc-20160816;
        b=Ya9O3YKFIvGZ2fQpmTdQA3/8GDtI3SRR3g3NJLOSyCQixtZUYPfm66g+flr3djhtGL
         laZhQpUzS7XkEJ+tpl4gSe4kyIT81pWHJHEUS7EEn8IGSuihZ+93MvxupMP2VZVLF6U0
         ALuuMBtWwqBsPaGHh1dCKvfS/Y26T3l4aL7CQP4LPrbZTA7FoWEX56zler6BJyPieC/W
         XxG1MamCqyYF1GfGIL/LepBgbq+frB2mUCpx7Cy7Tvv2/jLGPGjoK5H202Y1JJp0v5bb
         Jmg7N8rPRrYX6hH2UDIAmEo/fKV+Bd1Xqwdm6+5OFvMdcp+YB8vpZ57UBdZj5vKB67OE
         ra4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=01dh5BWCFYErQ39khmrp+Y96B3+LsFoIqLF8Q0CFSD0=;
        b=XECOh/Y3B9lNl4Gzy+V9PxNZfrVzMZJa8+KKbOmBul5awnC2AA5FffT11DPjmtOOro
         R0E2Dfwq31UJMvtIVpf2dgpx+mtht9JK2jyk1W+pvbYu3c3v+8areyPPXE5xmGNwRDLU
         7XzL8MPz7/+rZqQCyYZ51qCS4uNVx7OlpXP5RXZXb9HCTZZy5UHbuycFhWPffzb4ZMvI
         O7oH4s150g53xZuC+6uRmJ/ieTnqj5WhuUsDELReMVyxB2Golowitkne6TZAjvwkJH8b
         t7THsdVfmuqyvSM9y+fghktA+a3agDXXkDKJfFkbB0Xi6E4SKdG4VrMy2Y7VPMFmJPIR
         AEPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4si12147073qkd.431.2017.09.12.11.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpsn-0006xK-4p
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:26:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph5-0003V9-1b
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph3-0006TO-Fe
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drph3-0006QF-7O; Tue, 12 Sep 2017 14:13:53 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drph1-0001AY-7j; Tue, 12 Sep 2017 19:13:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:14:04 +0100
Message-Id: <1505240046-11454-18-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 17/19] nvic: Make ICSR banked for v8M
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zf2QTodAWDKb

The ICSR NVIC register is banked for v8M. This doesn't
require any new state, but it does mean that some bits
are controlled by BFHNFNMINS and some bits must work
with the correct banked exception. There is also a new
in v8M PENDNMICLR bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 5e5aecd..21fd199 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -703,7 +703,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
     }
     case 0xd00: /* CPUID Base.  */
         return cpu->midr;
-    case 0xd04: /* Interrupt Control State.  */
+    case 0xd04: /* Interrupt Control State (ICSR) */
         /* VECTACTIVE */
         val = cpu->env.v7m.exception;
         /* VECTPENDING */
@@ -716,19 +716,32 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         if (nvic_rettobase(s)) {
             val |= (1 << 11);
         }
-        /* PENDSTSET */
-        if (s->vectors[ARMV7M_EXCP_SYSTICK].pending) {
-            val |= (1 << 26);
-        }
-        /* PENDSVSET */
-        if (s->vectors[ARMV7M_EXCP_PENDSV].pending) {
-            val |= (1 << 28);
+        if (attrs.secure) {
+            /* PENDSTSET */
+            if (s->sec_vectors[ARMV7M_EXCP_SYSTICK].pending) {
+                val |= (1 << 26);
+            }
+            /* PENDSVSET */
+            if (s->sec_vectors[ARMV7M_EXCP_PENDSV].pending) {
+                val |= (1 << 28);
+            }
+        } else {
+            /* PENDSTSET */
+            if (s->vectors[ARMV7M_EXCP_SYSTICK].pending) {
+                val |= (1 << 26);
+            }
+            /* PENDSVSET */
+            if (s->vectors[ARMV7M_EXCP_PENDSV].pending) {
+                val |= (1 << 28);
+            }
         }
         /* NMIPENDSET */
-        if (s->vectors[ARMV7M_EXCP_NMI].pending) {
+        if ((cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) &&
+            s->vectors[ARMV7M_EXCP_NMI].pending) {
             val |= (1 << 31);
         }
-        /* ISRPREEMPT not implemented */
+        /* ISRPREEMPT: RES0 when halting debug not implemented */
+        /* STTNS: RES0 for the Main Extension */
         return val;
     case 0xd08: /* Vector Table Offset.  */
         return cpu->env.v7m.vecbase[attrs.secure];
@@ -953,9 +966,15 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         nvic_irq_update(s);
         break;
     }
-    case 0xd04: /* Interrupt Control State.  */
-        if (value & (1 << 31)) {
-            armv7m_nvic_set_pending(s, ARMV7M_EXCP_NMI, false);
+    case 0xd04: /* Interrupt Control State (ICSR) */
+        if (cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) {
+            if (value & (1 << 31)) {
+                armv7m_nvic_set_pending(s, ARMV7M_EXCP_NMI, false);
+            } else if (value & (1 << 30) &&
+                       arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+                /* PENDNMICLR didn't exist in v7M */
+                armv7m_nvic_clear_pending(s, ARMV7M_EXCP_NMI, false);
+            }
         }
         if (value & (1 << 28)) {
             armv7m_nvic_set_pending(s, ARMV7M_EXCP_PENDSV, attrs.secure);
-- 
2.7.4

