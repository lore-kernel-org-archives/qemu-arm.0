Received: by 10.182.158.201 with SMTP id ww9csp3415574obb;
        Wed, 2 Dec 2015 16:28:00 -0800 (PST)
X-Received: by 10.140.251.215 with SMTP id w206mr7776118qhc.73.1449102480462;
        Wed, 02 Dec 2015 16:28:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a141si2759252qkb.16.2015.12.02.16.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hke-0003ce-14
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:28:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc6-0004Im-HS
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc5-000215-Dt
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:10 -0500
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232]:34695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc5-00020r-9m; Wed, 02 Dec 2015 19:19:09 -0500
Received: by qkfo3 with SMTP id o3so23826967qkf.1;
	Wed, 02 Dec 2015 16:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vFS5v9QEndoQT/vcLp3eEGYOgg4f/OjcriTkmShYymY=;
	b=bIpetRVezsNX5hUAThqGO2l/BZtQXkLBWk813xCYbQa8jdBsXGsTF6WzL4obB7bv5T
	5tzhza5SsOxIYLNMyvYKzHi0Pz6vosPXYtNB4jaUNVzYSXrPuZxYewReOvggJz05PHzf
	keeNQj+WN4lx4Md9LaoGWsCwALtsK501fskCRK/5zwHCGrkhAAvzzVMJcb+MIIsH26lz
	3QAXBtp3V/vJIqCB8+UB+wlxat/C0SQEiFLbKHfAJ0LjJIpC8FcO3+SG97Dbo01xV8wJ
	nE+SMRPHPh5VZXFmH9WA97qKCMemdcTgYSkI7oZQOn3iFTl2GwR9RGKdU5NhZz2kheZj
	CNMg==
X-Received: by 10.55.81.132 with SMTP id f126mr7450255qkb.88.1449101948904;
	Wed, 02 Dec 2015 16:19:08 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:08 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:40 -0500
Message-Id: <1449101933-24928-14-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 13/26] armv7m: implement CCR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GwUJOqYi4vSz

Implement Configuration and Control register.
Handle STACKALIGN and USERSETMPEND bits.
---
 hw/intc/armv7m_nvic.c | 15 +++++++++++----
 target-arm/cpu.h      |  1 +
 target-arm/helper.c   |  8 +++-----
 target-arm/machine.c  |  1 +
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 7d261ae..0f9ca6a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -534,8 +534,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
         /* TODO: Implement SLEEPONEXIT.  */
         return 0;
     case 0xd14: /* Configuration Control.  */
-        /* TODO: Implement Configuration Control bits.  */
-        return 0;
+        return cpu->env.v7m.ccr;
     case 0xd24: /* System Handler Status.  */
         val = 0;
         if (s->vectors[ARMV7M_EXCP_MEM].active) val |= (1 << 0);
@@ -685,9 +684,17 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
         }
         break;
     case 0xd10: /* System Control.  */
-    case 0xd14: /* Configuration Control.  */
         /* TODO: Implement control registers.  */
-        qemu_log_mask(LOG_UNIMP, "NVIC: SCR and CCR unimplemented\n");
+        qemu_log_mask(LOG_UNIMP, "NVIC: SCR unimplemented\n");
+        break;
+    case 0xd14: /* Configuration Control.  */
+        value &= 0x31b;
+        if (value & 0x118) {
+            qemu_log_mask(LOG_UNIMP, "CCR unimplemented bits"
+                                     " BFHFNMIGN, DIV_0_TRP, UNALIGN_TRP");
+            value &= ~0x118;
+        }
+        cpu->env.v7m.ccr = value;
         break;
     case 0xd24: /* System Handler Control.  */
         /* TODO: Real hardware allows you to set/clear the active bits
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index b98ef89..4e1b8cf 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -396,6 +396,7 @@ typedef struct CPUARMState {
         uint32_t vecbase;
         uint32_t basepri;
         uint32_t control;
+        uint32_t ccr; /* Configuration and Control */
         uint32_t cfsr; /* Configurable Fault Status */
         uint32_t hfsr; /* HardFault Status */
         uint32_t mmfar; /* MemManage Fault Address */
diff --git a/target-arm/helper.c b/target-arm/helper.c
index f7e496d..17d1ca0 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5412,7 +5412,7 @@ static void do_v7m_exception_exit(CPUARMState *env)
         break;
     case 0x9: /* Return to Thread mode w/ Main stack */
     case 0xd: /* Return to Thread mode w/ Process stack */
-        if (env->v7m.exception_prio != 0x100) {
+        if ((env->v7m.exception_prio != 0x100) && !(env->v7m.ccr & 1)) {
             /* Attempt to return to Thread mode
              * from nested handler while NONBASETHRDENA not set.
              */
@@ -5582,10 +5582,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
 
-    /* Align stack pointer.  */
-    /* ??? Should only do this if Configuration Control Register
-       STACKALIGN bit is set.  */
-    if (env->regs[13] & 4) {
+    /* Align stack pointer (STACKALIGN)  */
+    if ((env->regs[13] & 4) && (env->v7m.ccr & (1<<9))) {
         env->regs[13] -= 4;
         xpsr |= 0x200;
     }
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 14a4882..7aee41e 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -100,6 +100,7 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
         VMSTATE_UINT32(env.v7m.control, ARMCPU),
+        VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
         VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),
-- 
2.1.4

