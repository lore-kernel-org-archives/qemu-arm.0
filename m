Received: by 10.28.71.27 with SMTP id u27csp2341887wma;
        Mon, 5 Feb 2018 02:57:55 -0800 (PST)
X-Google-Smtp-Source: AH8x22568ehc6IOE59mEchFxYpJIVs91zNwC4+3q7fexB88I/OdSBbC5syQ0wAyWqcgKmzu1B0nK
X-Received: by 10.37.79.130 with SMTP id d124mr10545460ybb.200.1517828275295;
        Mon, 05 Feb 2018 02:57:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828275; cv=none;
        d=google.com; s=arc-20160816;
        b=p4UVpTlzmMdJp1E+YVbZgg5NkfHwO6ex/ype3c1ieFUczZGEG8wOqzXOcJpoY7FtWu
         yzW/fVOD1k2+C+wy2kP6AwaOCcXaMwLE5z0Sra6lWYQBKPE/rmBgM7qH/n/fHljVx3Im
         O0peXfGqhOGILDrIa4yK9lTHTv/ly7B5mhzHuhsP6umY/FJkUiM/xm74/vbPMtpbf7VG
         U9GQTfgwBoc6eY/bwzdOCxyqDvSkruKbjCnJsjUnkjoQXShZC/qDBYb4CxwVGryhLUKK
         hFJRblcKovx4FZ1EjqR59QViAsZiNy2dlv1YTdS/ArLOD4atYJXryIuISIiVCriJs13d
         q3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=w/88HULu3jD9mk+fsAawZ6HrRSOc15zb7A5aUkdsCew=;
        b=VoZLt5IUBSnuZmhFjmABdjCv9Jg/YqiHFzPSUJ93ELc7qq2MKyKm/Nz0k40UDMP8JK
         QHNdpsBRqR+uNIgx27U/9ba8su9QqoRsejnLR23IGfVvNBSOEL78z7fKDFz0mdjg7Rld
         E4pkLo6UhvUT2RkkDVj3ee5QmW/q/fMMdgWy5s0XoMG7Fonkgrq1oDLCh4rp9mKkXN+h
         uyBhoEwwMeaMyI/sztGWTZimvTk66SbFb6ak9AAXTwON6VaWVqPq/jZ/RBrLvWjIb9Sn
         ORu/EuNShxrn+cKHD+to3/t4l//v9AFZ7NaxCtj9EoUdyS3N5pgw0Ch34LrzKUHHw9+Y
         t63w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si1393873ywf.683.2018.02.05.02.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 02:57:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieTC-00065F-Of
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 05:57:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSs-000630-P8
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSr-0007C8-Ph
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:34 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSr-00076t-IL; Mon, 05 Feb 2018 05:57:33 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSk-0004Fe-JY; Mon, 05 Feb 2018 10:57:26 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:18 +0000
Message-Id: <20180205105720.14620-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205105720.14620-1-peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/8] hw/intc/armv7m_nvic: Implement SCR
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
X-TUID: vbYOtypTlfII

We were previously making the system control register (SCR)
just RAZ/WI. Although we don't implement the functionality
this register controls, we should at least provide the state,
including the banked state for v8M.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  7 +++++++
 hw/intc/armv7m_nvic.c | 12 ++++++++----
 target/arm/machine.c  | 12 ++++++++++++
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 99c7cb996f..46dae607e8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -454,6 +454,7 @@ typedef struct CPUARMState {
         uint32_t aircr; /* only holds r/w state if security extn implemented */
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
         uint32_t csselr[M_REG_NUM_BANKS];
+        uint32_t scr[M_REG_NUM_BANKS];
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -1220,6 +1221,12 @@ FIELD(V7M_CCR, STKALIGN, 9, 1)
 FIELD(V7M_CCR, DC, 16, 1)
 FIELD(V7M_CCR, IC, 17, 1)
 
+/* V7M SCR bits */
+FIELD(V7M_SCR, SLEEPONEXIT, 1, 1)
+FIELD(V7M_SCR, SLEEPDEEP, 2, 1)
+FIELD(V7M_SCR, SLEEPDEEPS, 3, 1)
+FIELD(V7M_SCR, SEVONPEND, 4, 1)
+
 /* V7M AIRCR bits */
 FIELD(V7M_AIRCR, VECTRESET, 0, 1)
 FIELD(V7M_AIRCR, VECTCLRACTIVE, 1, 1)
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index cc83c9e553..8726be796e 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -863,8 +863,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         }
         return val;
     case 0xd10: /* System Control.  */
-        /* TODO: Implement SLEEPONEXIT.  */
-        return 0;
+        return cpu->env.v7m.scr[attrs.secure];
     case 0xd14: /* Configuration Control.  */
         /* The BFHFNMIGN bit is the only non-banked bit; we
          * keep it in the non-secure copy of the register.
@@ -1282,8 +1281,13 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         }
         break;
     case 0xd10: /* System Control.  */
-        /* TODO: Implement control registers.  */
-        qemu_log_mask(LOG_UNIMP, "NVIC: SCR unimplemented\n");
+        /* We don't implement deep-sleep so these bits are RAZ/WI.
+         * The other bits in the register are banked.
+         * QEMU's implementation ignores SEVONPEND and SLEEPONEXIT, which
+         * is architecturally permitted.
+         */
+        value &= ~(R_V7M_SCR_SLEEPDEEP_MASK | R_V7M_SCR_SLEEPDEEPS_MASK);
+        cpu->env.v7m.scr[attrs.secure] = value;
         break;
     case 0xd14: /* Configuration Control.  */
         /* Enforce RAZ/WI on reserved and must-RAZ/WI bits */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 968ec30b4a..a5feaa9604 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -143,6 +143,16 @@ static const VMStateDescription vmstate_m_csselr = {
     }
 };
 
+static const VMStateDescription vmstate_m_scr = {
+    .name = "cpu/m/scr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.v7m.scr[M_REG_NS], ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 4,
@@ -165,6 +175,7 @@ static const VMStateDescription vmstate_m = {
     .subsections = (const VMStateDescription*[]) {
         &vmstate_m_faultmask_primask,
         &vmstate_m_csselr,
+        &vmstate_m_scr,
         NULL
     }
 };
@@ -328,6 +339,7 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.sau.rnr, ARMCPU),
         VMSTATE_VALIDATE("SAU_RNR is valid", sau_rnr_vmstate_validate),
         VMSTATE_UINT32(env.sau.ctrl, ARMCPU),
+        VMSTATE_UINT32(env.v7m.scr[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.16.1

