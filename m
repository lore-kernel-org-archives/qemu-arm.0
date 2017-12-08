Received: by 10.223.159.74 with SMTP id f10csp660026wrg;
        Fri, 8 Dec 2017 06:13:14 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYmK4Gjx0vYrSHLquZqWYceka2txQEMAbhAFSLloVF5cc2He+10s8qjCPSOJV1Pe3+6Luzj
X-Received: by 10.37.219.136 with SMTP id g130mr20487113ybf.13.1512742394665;
        Fri, 08 Dec 2017 06:13:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512742394; cv=none;
        d=google.com; s=arc-20160816;
        b=HPurJ8elUE6FrxTDD7Ck7FcG/NODZvEz61NtKdsMxsnMw7S3KuXMtu8kRJTlC3wct8
         U7PK19+7WccBUtl9wss2bLtAKSRcfFi//bJETz/pUNYb2NRntWEm38MI7eiOO3Ouifye
         D8ZNow1TCKceXAS3UTErfJgVSJ8VfFtF49FdoaiUWm9gxcXgIgdX06ALcmRTMe/kCPPt
         NN7Yea0n/Rmys/uF2OwsxtWRIR0THFTUszfTkbsU8IkWFu9M6Q8e0FyEoX+x163tNBQR
         Nf/VlZvlW4GaFBJMpNNNEyp1Mx3NXhlUMadES5+KFTGVoNTiOedW6uQTd9nNj6wbJaNF
         Hf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Tnbwyn7qHGnZb4tlcKgpSTQulMsKFEXIg1BOnQVyWRU=;
        b=xh5nvancueVJ90nGcPkjlCNSnZIPX2/R7wlexE8y/fsQLM3YFGmOD6ilidyOgGTaXn
         dgxtHFRzvDEcLtWKiA+c8mHA1LPC7yjhN4mt6Bf839lFfb8O+lgEr+8RBIxNkOqI9zGI
         LOgOnNbpa3ubVI3ycDpg+6BuyHG7Ov77zhslaslIWNnGfIi2lDHtObpLZ0dDnupLhSpH
         UyaJa+uflkMZN99t9fQt7uovviQckgoXuFIwab078Ghixqc1V0f5V7HYzAb/4M6IkGYK
         fLMgpGfD9LG2+AVzbhRgx2XhS5hyEp/dNxEYyU4TApIgOiUk3p7edOcqOBkxlZRmEUiD
         54AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14si1644710ybg.629.2017.12.08.06.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 06:13:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNJOs-0004iS-2J
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 09:13:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNJOi-0004h8-Lb
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 09:13:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNJOh-0001Qz-FW
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 09:13:04 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eNJOh-0001Lv-7f; Fri, 08 Dec 2017 09:13:03 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eNJOX-0000pn-UE; Fri, 08 Dec 2017 14:12:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  8 Dec 2017 14:12:52 +0000
Message-Id: <1512742372-31517-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] hw/intc/armv7m: Support byte and halfword
 accesses to CFSR
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
Cc: Andy Gross <andy.gross@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PDw2argP8/xV

The Configurable Fault Status Register for ARMv7M and v8M is
supposed to be byte and halfword accessible, but we were only
implementing word accesses. Add support for the other access
sizes, which are used by the Zephyr RTOS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Andy Gross <andy.gross@linaro.org>
---
 hw/intc/armv7m_nvic.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 5d9c883..dc8e2f1 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -896,13 +896,6 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             val |= (1 << 8);
         }
         return val;
-    case 0xd28: /* Configurable Fault Status.  */
-        /* The BFSR bits [15:8] are shared between security states
-         * and we store them in the NS copy
-         */
-        val = cpu->env.v7m.cfsr[attrs.secure];
-        val |= cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK;
-        return val;
     case 0xd2c: /* Hard Fault Status.  */
         return cpu->env.v7m.hfsr;
     case 0xd30: /* Debug Fault Status.  */
@@ -1280,15 +1273,6 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         s->vectors[ARMV7M_EXCP_DEBUG].active = (value & (1 << 8)) != 0;
         nvic_irq_update(s);
         break;
-    case 0xd28: /* Configurable Fault Status.  */
-        cpu->env.v7m.cfsr[attrs.secure] &= ~value; /* W1C */
-        if (attrs.secure) {
-            /* The BFSR bits [15:8] are shared between security states
-             * and we store them in the NS copy.
-             */
-            cpu->env.v7m.cfsr[M_REG_NS] &= ~(value & R_V7M_CFSR_BFSR_MASK);
-        }
-        break;
     case 0xd2c: /* Hard Fault Status.  */
         cpu->env.v7m.hfsr &= ~value; /* W1C */
         break;
@@ -1667,6 +1651,14 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
             val = deposit32(val, i * 8, 8, get_prio(s, hdlidx, sbank));
         }
         break;
+    case 0xd28 ... 0xd2b: /* Configurable Fault Status (CFSR) */
+        /* The BFSR bits [15:8] are shared between security states
+         * and we store them in the NS copy
+         */
+        val = s->cpu->env.v7m.cfsr[attrs.secure];
+        val |= s->cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK;
+        val = extract32(val, (offset - 0xd28) * 8, size * 8);
+        break;
     case 0xfe0 ... 0xfff: /* ID.  */
         if (offset & 3) {
             val = 0;
@@ -1765,6 +1757,20 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
         }
         nvic_irq_update(s);
         return MEMTX_OK;
+    case 0xd28 ... 0xd2b: /* Configurable Fault Status (CFSR) */
+        /* All bits are W1C, so construct 32 bit value with 0s in
+         * the parts not written by the access size
+         */
+        value <<= ((offset - 0xd28) * 8);
+
+        s->cpu->env.v7m.cfsr[attrs.secure] &= ~value;
+        if (attrs.secure) {
+            /* The BFSR bits [15:8] are shared between security states
+             * and we store them in the NS copy.
+             */
+            s->cpu->env.v7m.cfsr[M_REG_NS] &= ~(value & R_V7M_CFSR_BFSR_MASK);
+        }
+        return MEMTX_OK;
     }
     if (size == 4) {
         nvic_writel(s, offset, value, attrs);
-- 
2.7.4

