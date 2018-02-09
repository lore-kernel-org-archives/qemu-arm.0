Received: by 10.28.71.27 with SMTP id u27csp1166160wma;
        Fri, 9 Feb 2018 09:04:19 -0800 (PST)
X-Google-Smtp-Source: AH8x225DbAjgeMBZBO7mCbXny/qThjL7nJyeZmVieN28EyRHeGw7nOexTVj06Nxg10aodwW38n6X
X-Received: by 10.37.36.81 with SMTP id k78mr2321721ybk.296.1518195859674;
        Fri, 09 Feb 2018 09:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195859; cv=none;
        d=google.com; s=arc-20160816;
        b=T5slTfGfyl2ouX9TeYoixwmpdejY1SBit1tetKEEKqaZRmKizeY9pc21Gs/Ph3cCs8
         C+BGcKWJ7dW8Zbpp8lkQI7RYc9P8dvpcVpdQDVhSQLkHJPFIAiuT1nwsLUzPQjtZ8B/p
         n0gvnRhWsu0KBr3thIM7kcB2KfS61xIj8QlKec6mfY9B8r3AJ7I5mA1bNM0TAgsYXwLN
         c6boXFz+rc8Ksm+cPnHjSOWB0aCQSMpy7FPPBavM8D0Czjnn/klh5JvCatAtNkoPu5zm
         rXjMzmQwUfMxvpm/n3tj83u8woasBTqhq4XH9vfWEHo6ZlKlF8uFCbaxljvffzioIlHo
         QbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ofq501XGiylDEfPk4Zaxl5D/ygK0M/Fl/ptWLJTDpBY=;
        b=Hh4pxj7FnG4ssf9hpQ20OzWX3rJJeCMVCmds1aPY8QmmPrLGD4yVplwaeFcUALTfz8
         9zvcfdfNN7ZT4iXIUqz59IwsWWeJ96tTIJsx0rNq3EF6DVfZAvrWgJ7vVPReOIxyjLxG
         v6faJ0DNzRTzy4EpJiqzZG1+HA8A6n86ueUxQT1xNWBmoOZhHRg7gg0tFbFW5L96AUw/
         Fg6prhaianHrCAdtAokmPiFnJBoML8QHnQ/wKDy2SouW0RggMUpasYvNbKMHXoR2m7B+
         Hzb7BO32SykRg4NWUhuLEyFz81QXeg6wV45vz+Cj8Y9OuQwFCK7TRx1YG9j9DfY0Q8dM
         tzMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x3si470468ybb.136.2018.02.09.09.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:04:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC5z-0008M0-3P
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:04:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0D-0003yP-El
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0B-0007oS-Rs
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:21 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC0B-0007fy-Jr; Fri, 09 Feb 2018 11:58:19 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC09-00030g-Bi; Fri, 09 Feb 2018 16:58:17 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:05 +0000
Message-Id: <20180209165810.6668-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 06/11] hw/intc/armv7m_nvic: Implement SCR
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
X-TUID: SXNkDEBaSBBl

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
index 4c1b9e9814..cfa92c477b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -497,6 +497,7 @@ typedef struct CPUARMState {
         uint32_t aircr; /* only holds r/w state if security extn implemented */
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
         uint32_t csselr[M_REG_NUM_BANKS];
+        uint32_t scr[M_REG_NUM_BANKS];
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -1258,6 +1259,12 @@ FIELD(V7M_CCR, STKALIGN, 9, 1)
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
index 040f3380ec..ea3b7cce14 100644
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
@@ -1285,8 +1284,13 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
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
index cae63c2f98..30fb1454a6 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -226,6 +226,16 @@ static const VMStateDescription vmstate_m_csselr = {
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
@@ -248,6 +258,7 @@ static const VMStateDescription vmstate_m = {
     .subsections = (const VMStateDescription*[]) {
         &vmstate_m_faultmask_primask,
         &vmstate_m_csselr,
+        &vmstate_m_scr,
         NULL
     }
 };
@@ -411,6 +422,7 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.sau.rnr, ARMCPU),
         VMSTATE_VALIDATE("SAU_RNR is valid", sau_rnr_vmstate_validate),
         VMSTATE_UINT32(env.sau.ctrl, ARMCPU),
+        VMSTATE_UINT32(env.v7m.scr[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.16.1

