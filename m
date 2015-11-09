Received: by 10.182.105.169 with SMTP id gn9csp902214obb;
        Sun, 8 Nov 2015 17:19:12 -0800 (PST)
X-Received: by 10.55.40.211 with SMTP id o80mr26199066qko.93.1447031950803;
        Sun, 08 Nov 2015 17:19:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b79si4832604qga.92.2015.11.08.17.19.10
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:19:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb70-0003N9-FE
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:19:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1Q-0001Lk-JV
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1M-0007wA-Of
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:24 -0500
Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e]:36417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1M-0007w6-JZ; Sun, 08 Nov 2015 20:13:20 -0500
Received: by qgad10 with SMTP id d10so132319180qga.3;
	Sun, 08 Nov 2015 17:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KQwlNkxxBhDb8JUsSENi2LbEebdy9ZMRgNbAHQsaFbk=;
	b=J2baHiy4l8Rf6mOcE9quTRS5o88V0KTLM5Vf6JoYWkarlJtjyJ09lwh3tkVHDZVhmP
	H31W6/2XQPtBLGYcKeKIrRs3mzvqtPdfyXAg27ua7aUkPtPzPYcV+DGTDSMh34WrfUC0
	UB6CiXzZW7Vsq1kX4XWBk4vrUPyH7WGZAc1grXNZXxq7LZ+7EjbJ6Zxz5V2aq6A96OnB
	/9rcM/wWyDPgWo2pdxjX4UyDCRVZFzBW+PxdX4hLh3Cw/8Bk6vqlOixIfasUSjgXi/Ow
	Z75C//xKyVrOanf0E2EptEHPTrYQb6Kz8pfqSkrZ1QV8pHdUpKfgzBPY8ZBRnguz1ydL
	Pxbg==
X-Received: by 10.140.152.82 with SMTP id 79mr27945979qhy.5.1447031600198;
	Sun, 08 Nov 2015 17:13:20 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:19 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:34 -0500
Message-Id: <1447031505-12477-8-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 07/18] armv7m: Update NVIC registers
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
X-TUID: NR/17BALd3Os

Replace use of GIC state/functions with new NVIC.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 233 ++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 168 insertions(+), 65 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index ebb4d4e..30e349e 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -394,13 +394,13 @@ void set_irq_level(void *opaque, int n, int level)
 
 static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
 {
-    ARMCPU *cpu;
+    ARMCPU *cpu = s->cpu;
     uint32_t val;
     int irq;
 
     switch (offset) {
     case 4: /* Interrupt Control Type.  */
-        return (s->num_irq / 32) - 1;
+        return ((s->num_irq - 16) / 32) - 1;
     case 0x10: /* SysTick Control and Status.  */
         val = s->systick.control;
         s->systick.control &= ~SYSTICK_COUNTFLAG;
@@ -426,45 +426,39 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
     case 0x1c: /* SysTick Calibration Value.  */
         return 10000;
     case 0xd00: /* CPUID Base.  */
-        cpu = ARM_CPU(current_cpu);
         return cpu->midr;
     case 0xd04: /* Interrupt Control State.  */
         /* VECTACTIVE */
-        cpu = ARM_CPU(current_cpu);
         val = cpu->env.v7m.exception;
-        if (val == 1023) {
-            val = 0;
-        } else if (val >= 32) {
-            val -= 16;
-        }
         /* VECTPENDING */
-        if (s->gic.current_pending[0] != 1023)
-            val |= (s->gic.current_pending[0] << 12);
+        val |= (cpu->env.v7m.pending << 12)&0x1ff;
         /* ISRPENDING and RETTOBASE */
-        for (irq = 32; irq < s->num_irq; irq++) {
-            if (s->gic.irq_state[irq].pending) {
+        for (irq = 16; irq < s->num_irq; irq++) {
+            if (s->vectors[irq].pending) {
                 val |= (1 << 22);
                 break;
             }
-            if (irq != cpu->env.v7m.exception && s->gic.irq_state[irq].active) {
+            if (irq != cpu->env.v7m.exception && s->vectors[irq].active) {
                 val |= (1 << 11);
             }
         }
         /* PENDSTSET */
-        if (s->gic.irq_state[ARMV7M_EXCP_SYSTICK].pending)
+        if (s->vectors[ARMV7M_EXCP_SYSTICK].pending) {
             val |= (1 << 26);
+        }
         /* PENDSVSET */
-        if (s->gic.irq_state[ARMV7M_EXCP_PENDSV].pending)
+        if (s->vectors[ARMV7M_EXCP_PENDSV].pending) {
             val |= (1 << 28);
+        }
         /* NMIPENDSET */
-        if (s->gic.irq_state[ARMV7M_EXCP_NMI].pending)
+        if (s->vectors[ARMV7M_EXCP_NMI].pending) {
             val |= (1 << 31);
+        }
         return val;
     case 0xd08: /* Vector Table Offset.  */
-        cpu = ARM_CPU(current_cpu);
         return cpu->env.v7m.vecbase;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
-        return 0xfa050000;
+        return 0xfa050000 | (s->prigroup<<8);
     case 0xd10: /* System Control.  */
         /* TODO: Implement SLEEPONEXIT.  */
         return 0;
@@ -473,20 +467,20 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
         return 0;
     case 0xd24: /* System Handler Status.  */
         val = 0;
-        if (s->gic.irq_state[ARMV7M_EXCP_MEM].active) val |= (1 << 0);
-        if (s->gic.irq_state[ARMV7M_EXCP_BUS].active) val |= (1 << 1);
-        if (s->gic.irq_state[ARMV7M_EXCP_USAGE].active) val |= (1 << 3);
-        if (s->gic.irq_state[ARMV7M_EXCP_SVC].active) val |= (1 << 7);
-        if (s->gic.irq_state[ARMV7M_EXCP_DEBUG].active) val |= (1 << 8);
-        if (s->gic.irq_state[ARMV7M_EXCP_PENDSV].active) val |= (1 << 10);
-        if (s->gic.irq_state[ARMV7M_EXCP_SYSTICK].active) val |= (1 << 11);
-        if (s->gic.irq_state[ARMV7M_EXCP_USAGE].pending) val |= (1 << 12);
-        if (s->gic.irq_state[ARMV7M_EXCP_MEM].pending) val |= (1 << 13);
-        if (s->gic.irq_state[ARMV7M_EXCP_BUS].pending) val |= (1 << 14);
-        if (s->gic.irq_state[ARMV7M_EXCP_SVC].pending) val |= (1 << 15);
-        if (s->gic.irq_state[ARMV7M_EXCP_MEM].enabled) val |= (1 << 16);
-        if (s->gic.irq_state[ARMV7M_EXCP_BUS].enabled) val |= (1 << 17);
-        if (s->gic.irq_state[ARMV7M_EXCP_USAGE].enabled) val |= (1 << 18);
+        if (s->vectors[ARMV7M_EXCP_MEM].active) val |= (1 << 0);
+        if (s->vectors[ARMV7M_EXCP_BUS].active) val |= (1 << 1);
+        if (s->vectors[ARMV7M_EXCP_USAGE].active) val |= (1 << 3);
+        if (s->vectors[ARMV7M_EXCP_SVC].active) val |= (1 << 7);
+        if (s->vectors[ARMV7M_EXCP_DEBUG].active) val |= (1 << 8);
+        if (s->vectors[ARMV7M_EXCP_PENDSV].active) val |= (1 << 10);
+        if (s->vectors[ARMV7M_EXCP_SYSTICK].active) val |= (1 << 11);
+        if (s->vectors[ARMV7M_EXCP_USAGE].pending) val |= (1 << 12);
+        if (s->vectors[ARMV7M_EXCP_MEM].pending) val |= (1 << 13);
+        if (s->vectors[ARMV7M_EXCP_BUS].pending) val |= (1 << 14);
+        if (s->vectors[ARMV7M_EXCP_SVC].pending) val |= (1 << 15);
+        if (s->vectors[ARMV7M_EXCP_MEM].enabled) val |= (1 << 16);
+        if (s->vectors[ARMV7M_EXCP_BUS].enabled) val |= (1 << 17);
+        if (s->vectors[ARMV7M_EXCP_USAGE].enabled) val |= (1 << 18);
         return val;
     case 0xd28: /* Configurable Fault Status.  */
         /* TODO: Implement Fault Status.  */
@@ -535,7 +529,7 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
 
 static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
 {
-    ARMCPU *cpu;
+    ARMCPU *cpu = s->cpu;
     uint32_t oldval;
     switch (offset) {
     case 0x10: /* SysTick Control and Status.  */
@@ -577,18 +571,15 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
         if (value & (1 << 28)) {
             armv7m_nvic_set_pending(s, ARMV7M_EXCP_PENDSV);
         } else if (value & (1 << 27)) {
-            s->gic.irq_state[ARMV7M_EXCP_PENDSV].pending = 0;
-            gic_update(&s->gic);
+            armv7m_nvic_clear_pending(s, ARMV7M_EXCP_PENDSV);
         }
         if (value & (1 << 26)) {
             armv7m_nvic_set_pending(s, ARMV7M_EXCP_SYSTICK);
         } else if (value & (1 << 25)) {
-            s->gic.irq_state[ARMV7M_EXCP_SYSTICK].pending = 0;
-            gic_update(&s->gic);
+            armv7m_nvic_clear_pending(s, ARMV7M_EXCP_SYSTICK);
         }
         break;
     case 0xd08: /* Vector Table Offset.  */
-        cpu = ARM_CPU(current_cpu);
         cpu->env.v7m.vecbase = value & 0xffffff80;
         break;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
@@ -603,7 +594,13 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
                 qemu_log_mask(LOG_UNIMP, "AIRCR system reset unimplemented\n");
             }
             if (value & 0x700) {
-                qemu_log_mask(LOG_UNIMP, "PRIGROUP unimplemented\n");
+                unsigned i;
+                s->prigroup = (value>>8)&0xf;
+                /* recalculate prio_ord for exceptions w/ configurable prio */
+                for (i = 4; i < s->num_irq; i++) {
+                    set_prio(s, i, s->vectors[i].raw_prio);
+                }
+                nvic_irq_update(s, 0);
             }
         }
         break;
@@ -615,9 +612,12 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
     case 0xd24: /* System Handler Control.  */
         /* TODO: Real hardware allows you to set/clear the active bits
            under some circumstances.  We don't implement this.  */
-        s->gic.irq_state[ARMV7M_EXCP_MEM].enabled = (value & (1 << 16)) != 0;
-        s->gic.irq_state[ARMV7M_EXCP_BUS].enabled = (value & (1 << 17)) != 0;
-        s->gic.irq_state[ARMV7M_EXCP_USAGE].enabled = (value & (1 << 18)) != 0;
+        s->vectors[ARMV7M_EXCP_MEM].enabled = (value & (1 << 16)) != 0;
+        s->vectors[ARMV7M_EXCP_BUS].enabled = (value & (1 << 17)) != 0;
+        s->vectors[ARMV7M_EXCP_USAGE].enabled = (value & (1 << 18)) != 0;
+        /* no need to call nvic_irq_update() since any pending while
+         * disabled would have been escalated to HardFault
+         */
         break;
     case 0xd28: /* Configurable Fault Status.  */
     case 0xd2c: /* Hard Fault Status.  */
@@ -629,8 +629,8 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
                       "NVIC: fault status registers unimplemented\n");
         break;
     case 0xf00: /* Software Triggered Interrupt Register */
-        if ((value & 0x1ff) < s->num_irq) {
-            gic_set_pending_private(&s->gic, 0, value & 0x1ff);
+        if ((value & 0x1ff) < NVIC_MAX_IRQ) {
+            armv7m_nvic_set_pending(s, (value&0x1ff)+16);
         }
         break;
     default:
@@ -644,28 +644,81 @@ static uint64_t nvic_sysreg_read(void *opaque, hwaddr addr,
 {
     nvic_state *s = (nvic_state *)opaque;
     uint32_t offset = addr;
-    int i;
+    unsigned i, end;
     uint32_t val;
 
     switch (offset) {
+    /* reads of set and clear both return the status */
+    case 0x100 ... 0x13c: /* NVIC Set enable */
+        offset += 0x80;
+        /* fall through */
+    case 0x180 ... 0x1bc: /* NVIC Clear enable */
+        val = 0;
+        offset = offset-0x180+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (s->vectors[offset+i].enabled) {
+                val |= (1<<i);
+            }
+        }
+        break;
+    case 0x200 ... 0x23c: /* NVIC Set pend */
+        offset += 0x80;
+        /* fall through */
+    case 0x280 ... 0x2bc: /* NVIC Clear pend */
+        val = 0;
+        offset = offset-0x280+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (s->vectors[offset+i].pending) {
+                val |= (1<<i);
+            }
+        }
+        break;
+    case 0x300 ... 0x37c: /* NVIC Active */
+        val = 0;
+        offset = offset-0x300+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (s->vectors[offset+i].active) {
+                val |= (1<<i);
+            }
+        }
+        break;
+    case 0x400 ... 0x7ec: /* NVIC Priority */
+        val = 0;
+        offset = offset-0x400+16; /* vector # */
+
+        for (i = 0; i < size && offset+i < s->num_irq; i++) {
+            val |= s->vectors[offset+i].raw_prio<<(8*i);
+        }
+        break;
     case 0xd18 ... 0xd23: /* System Handler Priority.  */
         val = 0;
         for (i = 0; i < size; i++) {
-            val |= s->gic.priority1[(offset - 0xd14) + i][0] << (i * 8);
+            val |= s->vectors[(offset - 0xd14) + i].raw_prio << (i * 8);
         }
-        return val;
+        break;
     case 0xfe0 ... 0xfff: /* ID.  */
         if (offset & 3) {
             return 0;
         }
-        return nvic_id[(offset - 0xfe0) >> 2];
-    }
-    if (size == 4) {
-        return nvic_readl(s, offset);
+        val = nvic_id[(offset - 0xfe0) >> 2];
+        break;
+    default:
+        if (size == 4) {
+            val = nvic_readl(s, offset);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "NVIC: Bad read of size %d at offset 0x%x\n",
+                          size, offset);
+            val = 0;
+        }
     }
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "NVIC: Bad read of size %d at offset 0x%x\n", size, offset);
-    return 0;
+
+    DPRINTF(0, "sysreg read%u "TARGET_FMT_plx" -> %08x\n",
+            size*8, addr, (unsigned)val);
+    return val;
 }
 
 static void nvic_sysreg_write(void *opaque, hwaddr addr,
@@ -673,23 +726,73 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
 {
     nvic_state *s = (nvic_state *)opaque;
     uint32_t offset = addr;
-    int i;
+    unsigned i, end;
+    unsigned setval = 0;
+
+    DPRINTF(0, "sysreg write%u "TARGET_FMT_plx" <- %08x\n",
+            size*8, addr, (unsigned)value);
 
     switch (offset) {
-    case 0xd18 ... 0xd23: /* System Handler Priority.  */
+    case 0x100 ... 0x13c: /* NVIC Set enable */
+        offset += 0x80;
+        setval = 1;
+        /* fall through */
+    case 0x180 ... 0x1bc: /* NVIC Clear enable */
+        offset = offset-0x180+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (value&(1<<i)) {
+                s->vectors[offset+i].enabled = setval;
+            }
+        }
+        nvic_irq_update(s, 0);
+        return;
+    case 0x200 ... 0x23c: /* NVIC Set pend */
+        /* the special logic in armv7m_nvic_set_pending()
+         * is not needed since IRQs are never escalated
+         */
+        offset += 0x80;
+        setval = 1;
+        /* fall through */
+    case 0x280 ... 0x2bc: /* NVIC Clear pend */
+        offset = offset-0x280+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (value&(1<<i)) {
+                s->vectors[offset+i].pending = setval;
+            }
+        }
+        nvic_irq_update(s, 0);
+        return;
+    case 0x300 ... 0x37c: /* NVIC Active */
+        return; /* R/O */
+    case 0x400 ... 0x7ec: /* NVIC Priority */
+        offset = offset-0x400+16; /* vector # */
+
         for (i = 0; i < size; i++) {
-            s->gic.priority1[(offset - 0xd14) + i][0] =
-                (value >> (i * 8)) & 0xff;
+            set_prio(s, offset+i, (value>>(i*8))&0xff);
         }
-        gic_update(&s->gic);
+        nvic_irq_update(s, 0);
         return;
-    }
-    if (size == 4) {
-        nvic_writel(s, offset, value);
+    case 0xd18 ... 0xd23: /* System Handler Priority.  */
+        for (i = 0; i < size; i++) {
+            unsigned hdlidx = (offset - 0xd14) + i;
+            set_prio(s, hdlidx, (value >> (i * 8)) & 0xff);
+            DPRINTF(0, "Set Handler prio %u = %u\n",
+                    (unsigned)hdlidx,
+                    (unsigned)s->vectors[hdlidx].raw_prio);
+        }
+        nvic_irq_update(s, 0);
         return;
+    default:
+        if (size == 4) {
+            nvic_writel(s, offset, value);
+            return;
+        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "NVIC: Bad write of size %d at offset 0x%x\n",
+                      size, offset);
     }
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "NVIC: Bad write of size %d at offset 0x%x\n", size, offset);
 }
 
 static const MemoryRegionOps nvic_sysreg_ops = {
-- 
2.1.4

