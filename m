Received: by 10.182.105.169 with SMTP id gn9csp903019obb;
        Sun, 8 Nov 2015 17:21:51 -0800 (PST)
X-Received: by 10.140.101.168 with SMTP id u37mr26213927qge.103.1447032111901;
        Sun, 08 Nov 2015 17:21:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c63si9327195qkh.70.2015.11.08.17.21.51
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:21:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb9b-00085j-JR
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:21:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1S-0001Pt-T6
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1Q-0007zS-JH
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:26 -0500
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:34287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1Q-0007zD-D1; Sun, 08 Nov 2015 20:13:24 -0500
Received: by qkcn129 with SMTP id n129so65854937qkc.1;
	Sun, 08 Nov 2015 17:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6gvoton8i82HZ2Z3VgSKc7Z0USckAlOnaOe9L8BFlVQ=;
	b=gZCBZU5GBFQxJFX9WgggbU1jHm1UPbRQf0Gm7gjdyaivEqHTED5jRcO/D9uPOYYYlB
	CTkS81xrv2U1KThAkLLhJmYk/SQppY5Ud53mGdocRe+lsz0O2YWqZbGhfKL5yeLphksY
	S7YAvn/kYQusEwZ7knXhneDMj8bS1htqOtbEzsxYgldugqyR6KNVW0ge4eI/QtawSyop
	LCvm24EoJqMaf71V+SJrWe3mR6Own7PhyCgBv/l8sk9lsWFz7n56xrv5g+9yhsl11wLf
	VdtOdIfWny1eb8ioSFpLxiUIFA8qCj939uV6tkxmqRSksRBdGZ9mtiFbwSuWPrjx0qzc
	bhsQ==
X-Received: by 10.55.75.21 with SMTP id y21mr27136117qka.2.1447031603993;
	Sun, 08 Nov 2015 17:13:23 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:23 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:40 -0500
Message-Id: <1447031505-12477-14-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::230
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 13/18] armv7m: implement CFSR and HFSR
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
X-TUID: EtpM/+iW3b4l

Add the Configurable and Hard Fault Status registers.
Note undefined instructions and escalations

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 10 +++++++---
 target-arm/cpu.h      |  2 ++
 target-arm/helper.c   |  1 +
 target-arm/machine.c  |  6 ++++--
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 8eaf677..734f6f8 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -287,6 +287,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq)
             }
             I = &s->vectors[irq];
 
+            s->cpu->env.v7m.hfsr |= 1<<30; /* FORCED */
             DPRINTF(0, "Escalate %d to %d\n", oldirq, irq);
         }
     }
@@ -488,10 +489,9 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
         if (s->vectors[ARMV7M_EXCP_USAGE].enabled) val |= (1 << 18);
         return val;
     case 0xd28: /* Configurable Fault Status.  */
-        /* TODO: Implement Fault Status.  */
-        qemu_log_mask(LOG_UNIMP, "Configurable Fault Status unimplemented\n");
-        return 0;
+        return cpu->env.v7m.cfsr;
     case 0xd2c: /* Hard Fault Status.  */
+        return cpu->env.v7m.hfsr;
     case 0xd30: /* Debug Fault Status.  */
     case 0xd34: /* Mem Manage Address.  */
     case 0xd38: /* Bus Fault Address.  */
@@ -629,7 +629,11 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
          */
         break;
     case 0xd28: /* Configurable Fault Status.  */
+        cpu->env.v7m.cfsr &= ~value; /* W1C */
+        break;
     case 0xd2c: /* Hard Fault Status.  */
+        cpu->env.v7m.hfsr &= ~value; /* W1C */
+        break;
     case 0xd30: /* Debug Fault Status.  */
     case 0xd34: /* Mem Manage Address.  */
     case 0xd38: /* Bus Fault Address.  */
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 29d89ce..e98bca0 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -396,6 +396,8 @@ typedef struct CPUARMState {
         uint32_t vecbase;
         uint32_t basepri;
         uint32_t control;
+        uint32_t cfsr; /* Configurable Fault Status */
+        uint32_t hfsr; /* HardFault Status */
         int current_sp;
         int exception;
         int exception_prio;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 2541890..5be09b8 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5436,6 +5436,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     switch (cs->exception_index) {
     case EXCP_UDEF:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
+        env->v7m.cfsr |= 1<<16; /* UNDEFINSTR */
         break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 36a0d15..d7c2034 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -92,14 +92,16 @@ static bool m_needed(void *opaque)
 
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = m_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.other_sp, ARMCPU),
         VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
         VMSTATE_UINT32(env.v7m.control, ARMCPU),
+        VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
         VMSTATE_INT32(env.v7m.current_sp, ARMCPU),
         VMSTATE_INT32(env.v7m.exception, ARMCPU),
         VMSTATE_END_OF_LIST()
-- 
2.1.4

