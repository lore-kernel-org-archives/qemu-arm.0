Received: by 10.223.172.38 with SMTP id v35csp3209801wrc;
        Fri, 22 Sep 2017 08:00:16 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAWbmco3jcHw3cPv2JEnnK71//RvlR3ktIHcBsOvxVGZiGYrF7H1xoX4OcYmRZy01VoiqDA
X-Received: by 10.200.47.238 with SMTP id m43mr8318035qta.251.1506092416799;
        Fri, 22 Sep 2017 08:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092416; cv=none;
        d=google.com; s=arc-20160816;
        b=gNBIi95rqOxcXuWROhNGxmkRNxz4WMwaFhTHN5UHdnJfxgWNKUaFccmmPczn3BfIi7
         96/oCrgHKt9hMDysLfkIiEaQM7wR8u/3FthZIt8P4CAAlfCnaT7HC8F8wWiz1QYDzj4e
         /uAhBrtosU196UlRA8v6RSIf4VP0Ow8aPi1M+HYAhVY1P30TJrWIyliN7RSOUwAGA75w
         4tdLfnRMBf2ZQ0oeCo6RK5VWqqzet6JM+CTAYT5iurw/n5n3y8TNt7eqCwaztXK4U6ZE
         6wEjIxlJ9kPkLBfyH01tLaBdE9oB5VqyHx0qSstj38Q5ccEDHYyZPhYt7Xr83tDj2xOA
         UxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tv0vi7XK/sBxrkfE7IXmSnAisFluoy5I3Hs9Y7O6DXw=;
        b=U77spiSAlUMWr3/1Jl+464iLreNkIOmw4ZMogJDrBJLgAEb/b4V71BIwrBmDwXwWYO
         sFZhunv/O42Gd75N3v5GDygzogOszYqbL1SDQmzRS/2s2xAPovPt042oJDjz9G7LrcS+
         4Ia/isHOrqzL4T0NBE/hZjGQBLdsXN0+WfVo++b0NdbyDOwwvuM1uIT8wmrRDLSKmCGs
         yEeimPmy54oC7bmUjsLPHtTXDT9s/RNtW4LlnDxqUaaZPM3WSUwWiZTU6/ASFrISEBqQ
         irsqIqboTC4M+5wyhoIbJw9NtpVp9Ph80AVXs7GLf6yIoBEf57huEhasgeoT8Rx1TT+i
         gdCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t79si24542qka.93.2017.09.22.08.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPR8-0008Ly-Jt
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:00:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQZ-0007xc-Jy
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQY-00046N-G8
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:39 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQY-00043B-8m; Fri, 22 Sep 2017 10:59:38 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQV-0007Bi-WB; Fri, 22 Sep 2017 15:59:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:56 +0100
Message-Id: <1506092407-26985-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/20] target/arm: Add new-in-v8M SFSR and SFAR
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
X-TUID: pLoitQ0GRmvA

Add the new M profile Secure Fault Status Register
and Secure Fault Address Register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 12 ++++++++++++
 hw/intc/armv7m_nvic.c | 34 ++++++++++++++++++++++++++++++++++
 target/arm/machine.c  |  2 ++
 3 files changed, 48 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ad6eff4..9e3a16d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -443,8 +443,10 @@ typedef struct CPUARMState {
         uint32_t cfsr[M_REG_NUM_BANKS]; /* Configurable Fault Status */
         uint32_t hfsr; /* HardFault Status */
         uint32_t dfsr; /* Debug Fault Status Register */
+        uint32_t sfsr; /* Secure Fault Status Register */
         uint32_t mmfar[M_REG_NUM_BANKS]; /* MemManage Fault Address */
         uint32_t bfar; /* BusFault Address */
+        uint32_t sfar; /* Secure Fault Address Register */
         unsigned mpu_ctrl[M_REG_NUM_BANKS]; /* MPU_CTRL */
         int exception;
         uint32_t primask[M_REG_NUM_BANKS];
@@ -1260,6 +1262,16 @@ FIELD(V7M_DFSR, DWTTRAP, 2, 1)
 FIELD(V7M_DFSR, VCATCH, 3, 1)
 FIELD(V7M_DFSR, EXTERNAL, 4, 1)
 
+/* V7M SFSR bits */
+FIELD(V7M_SFSR, INVEP, 0, 1)
+FIELD(V7M_SFSR, INVIS, 1, 1)
+FIELD(V7M_SFSR, INVER, 2, 1)
+FIELD(V7M_SFSR, AUVIOL, 3, 1)
+FIELD(V7M_SFSR, INVTRAN, 4, 1)
+FIELD(V7M_SFSR, LSPERR, 5, 1)
+FIELD(V7M_SFSR, SFARVALID, 6, 1)
+FIELD(V7M_SFSR, LSERR, 7, 1)
+
 /* v7M MPU_CTRL bits */
 FIELD(V7M_MPU_CTRL, ENABLE, 0, 1)
 FIELD(V7M_MPU_CTRL, HFNMIENA, 1, 1)
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a1041c2..deea637 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1017,6 +1017,22 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             goto bad_offset;
         }
         return cpu->env.pmsav8.mair1[attrs.secure];
+    case 0xde4: /* SFSR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+            goto bad_offset;
+        }
+        if (!attrs.secure) {
+            return 0;
+        }
+        return cpu->env.v7m.sfsr;
+    case 0xde8: /* SFAR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+            goto bad_offset;
+        }
+        if (!attrs.secure) {
+            return 0;
+        }
+        return cpu->env.v7m.sfar;
     default:
     bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR, "NVIC: Bad read offset 0x%x\n", offset);
@@ -1368,6 +1384,24 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
          * only affect cacheability, and we don't implement caching.
          */
         break;
+    case 0xde4: /* SFSR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+            goto bad_offset;
+        }
+        if (!attrs.secure) {
+            return;
+        }
+        cpu->env.v7m.sfsr &= ~value; /* W1C */
+        break;
+    case 0xde8: /* SFAR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+            goto bad_offset;
+        }
+        if (!attrs.secure) {
+            return;
+        }
+        cpu->env.v7m.sfsr = value;
+        break;
     case 0xf00: /* Software Triggered Interrupt Register */
     {
         int excnum = (value & 0x1ff) + NVIC_FIRST_IRQ;
diff --git a/target/arm/machine.c b/target/arm/machine.c
index e5fe083..d4b3baf 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -276,6 +276,8 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.v7m.ccr[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.mmfar[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.cfsr[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.v7m.sfsr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.sfar, ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

