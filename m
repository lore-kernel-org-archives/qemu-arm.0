Received: by 10.182.105.169 with SMTP id gn9csp903000obb;
        Sun, 8 Nov 2015 17:21:47 -0800 (PST)
X-Received: by 10.55.51.200 with SMTP id z191mr27024442qkz.21.1447032107351;
        Sun, 08 Nov 2015 17:21:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o81si9310885qhb.80.2015.11.08.17.21.47
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb9X-0007yw-2J
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:21:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1U-0001TE-EW
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1S-00081y-Ri
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:28 -0500
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:36432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1S-00081d-Mv; Sun, 08 Nov 2015 20:13:26 -0500
Received: by qgad10 with SMTP id d10so132320471qga.3;
	Sun, 08 Nov 2015 17:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vTpC6U7Xs7k0W+/j7y66fbstsiPl2oJWOCFEI65OUXA=;
	b=EnK/8Fm2Ppk+FVNRFVTFvKTsz7eNrSKwU2Mv2snrCywPAf3Z5xLMnBt757glfuSce8
	LHTDlupP1l7MbfN+65S2ftDfgzAREfHqBJkdzWy3gXKl6VWOGD7T313ul6IfY5x1gv8V
	cr1LAU+cuza8QJDQyIvaGyKMfAfuCZkdHCSSQBjQwEIwKv+ztD0MTBJiUpeUfYkNGV0c
	Bzd25AzIdlHlaNtKPg8W0kBgWQkY0KjxL7Csn/gcVCmXAmLh1RGN4skdMrkJyVH6rkCg
	/XEviXiGeVIXpy+HkZne4L9vOgKW9roCjHkK0K0QwmXtwhXxXMlZ5G9i99l6gA7vNyBY
	90Jg==
X-Received: by 10.140.97.34 with SMTP id l31mr9784791qge.30.1447031606392;
	Sun, 08 Nov 2015 17:13:26 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:26 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:44 -0500
Message-Id: <1447031505-12477-18-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 17/18] armv7m: implement CCR
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
X-TUID: ZcyO61enovTm

Implement Configuration and Control register.
Handle STACKALIGN and USERSETMPEND bits.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 15 +++++++++++----
 target-arm/cpu.h      |  1 +
 target-arm/helper.c   |  8 +++-----
 target-arm/machine.c  |  1 +
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a75dd3c..ca8c93c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -474,8 +474,7 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
         /* TODO: Implement SLEEPONEXIT.  */
         return 0;
     case 0xd14: /* Configuration Control.  */
-        /* TODO: Implement Configuration Control bits.  */
-        return 0;
+        return cpu->env.v7m.ccr;
     case 0xd24: /* System Handler Status.  */
         val = 0;
         if (s->vectors[ARMV7M_EXCP_MEM].active) val |= (1 << 0);
@@ -619,9 +618,17 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
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
+        if (value&0x118) {
+            qemu_log_mask(LOG_UNIMP, "CCR unimplemented bits"
+                                     " BFHFNMIGN, DIV_0_TRP, UNALIGN_TRP");
+            value &= ~0x118;
+        }
+        cpu->env.v7m.ccr = value;
         break;
     case 0xd24: /* System Handler Control.  */
         /* TODO: Real hardware allows you to set/clear the active bits
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 72b0b32..90ccdcd 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -396,6 +396,7 @@ typedef struct CPUARMState {
         uint32_t vecbase;
         uint32_t basepri;
         uint32_t control;
+        uint32_t ccr; /* Configuration and Control */
         uint32_t cfsr; /* Configurable Fault Status */
         uint32_t hfsr; /* HardFault Status */
         int current_sp;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 3993f77..402bfc5 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5412,7 +5412,7 @@ static void do_v7m_exception_exit(CPUARMState *env)
         break;
     case 0x9: /* Return to Thread mode w/ Main stack */
     case 0xd: /* Return to Thread mode w/ Process stack */
-        if (env->v7m.exception != 0) {
+        if ((env->v7m.exception != 0) && !(env->v7m.ccr&1)) {
             /* Attempt to return to Thread mode
              * from nested handler while NONBASETHRDENA not set.
              */
@@ -5564,10 +5564,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
 
-    /* Align stack pointer.  */
-    /* ??? Should only do this if Configuration Control Register
-       STACKALIGN bit is set.  */
-    if (env->regs[13] & 4) {
+    /* Align stack pointer (STACKALIGN)  */
+    if (env->v7m.ccr&(1<<9)) {
         env->regs[13] -= 4;
         xpsr |= 0x200;
     }
diff --git a/target-arm/machine.c b/target-arm/machine.c
index d7c2034..e8b710d 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -100,6 +100,7 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
         VMSTATE_UINT32(env.v7m.control, ARMCPU),
+        VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
         VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
         VMSTATE_INT32(env.v7m.current_sp, ARMCPU),
-- 
2.1.4

