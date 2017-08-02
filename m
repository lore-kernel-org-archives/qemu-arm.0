Received: by 10.25.44.15 with SMTP id s15csp6354083lfs;
        Wed, 2 Aug 2017 09:44:45 -0700 (PDT)
X-Received: by 10.55.126.69 with SMTP id z66mr32838123qkc.48.1501692285011;
        Wed, 02 Aug 2017 09:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692285; cv=none;
        d=google.com; s=arc-20160816;
        b=P1Qv4+ZWy1DBxSNsMLNjJmMnaQxD1Knli8gKNjlnVXA4xANqnqK0aKG8IphUIzxx9B
         hTBm1NQiSKLiwV+dekU/wBtBf7WO96tl7zEmNiDYvWRCCeLevan17R8UjhfiH9gu7mZJ
         LWGZJB2tXauihFpZ+UYvnIKzwHEenn1MrkpRtKFT2TPpNyn4O87y7k/HJA6VIAcHMSkB
         CR+/kK5ybK5gGoNm6RiHJfAPH/Bdvo2hpRU4zbTmc6ID2N6ZzU+y7+M3kKkGUqACcJqJ
         9bPY/FvZDVuVZNV445pv8FDdYVDN3XdqYtojkWtQaTDoVpd1/n9mV4Q1YrTtyUCxWGAZ
         QS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qZSSs+hqqz022T2ZJ22GWesj3VpaTdtIyweROquVPrg=;
        b=YA5UoiXV9O8PBONiVNmSJsVnPQ2l4JW68q0gMKZBz64WMt8h87AQRJ3narIPnkSylG
         cv6so5hMWTyQlp5gEKG8lfBAAV4exp9HL+qmItKq9ZkQIh2LLApCxGriq0tEjzw7acrp
         naOtS4/NgBACQz81SBypF0FXdYssXngUKViBvIx8UoEmErcxARhCmRGg+AxGYTA+7cUR
         k4azej6Q6E9UzyqAU01Ls0CDGwcPcLEYFUkLUaE0+4wr2XgwCcpAa2VxOGz/Ev6YyrUh
         AIsxDVi5chOb1u7RzFuyc8p1gkw52zmETWEd66HkJfQpXWBnENZ2TPRk714o8DDKTcFG
         Pn9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si19691808qkf.46.2017.08.02.09.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwlG-0003Vg-29
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:44:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl3-0003Tc-DV
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl1-0004a4-UA
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl1-0003zA-LF; Wed, 02 Aug 2017 12:44:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkj-00041K-Op; Wed, 02 Aug 2017 17:44:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:44:01 +0100
Message-Id: <1501692241-23310-16-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 15/15] nvic: Implement "user accesses BusFault"
 SCS region behaviour
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
X-TUID: +rLNwziufN57

The ARMv7M architecture specifies that most of the addresses in the
PPB region (which includes the NVIC, systick and system registers)
are not accessible to unprivileged accesses, which should
BusFault with a few exceptions:
 * the STIR is configurably user-accessible
 * the ITM (which we don't implement at all) is always
   user-accessible

Implement this by switching the register access functions
to the _with_attrs scheme that lets us distinguish user
mode accesses.

This allows us to pull the handling of the CCR.USERSETMPEND
flag up to the level where we can make it generate a BusFault
as it should for non-permitted accesses.

Note that until the core ARM CPU code implements turning
MEMTX_ERROR into a BusFault the registers will continue to
act as RAZ/WI to user accesses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 58 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 5a18025..bbfe2d5 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -733,11 +733,8 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
     }
     case 0xf00: /* Software Triggered Interrupt Register */
     {
-        /* user mode can only write to STIR if CCR.USERSETMPEND permits it */
         int excnum = (value & 0x1ff) + NVIC_FIRST_IRQ;
-        if (excnum < s->num_irq &&
-            (arm_current_el(&cpu->env) ||
-             (cpu->env.v7m.ccr & R_V7M_CCR_USERSETMPEND_MASK))) {
+        if (excnum < s->num_irq) {
             armv7m_nvic_set_pending(s, excnum);
         }
         break;
@@ -748,14 +745,32 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
     }
 }
 
-static uint64_t nvic_sysreg_read(void *opaque, hwaddr addr,
-                                 unsigned size)
+static bool nvic_user_access_ok(NVICState *s, hwaddr offset)
+{
+    /* Return true if unprivileged access to this register is permitted. */
+    switch (offset) {
+    case 0xf00: /* STIR: accessible only if CCR.USERSETMPEND permits */
+        return s->cpu->env.v7m.ccr & R_V7M_CCR_USERSETMPEND_MASK;
+    default:
+        /* All other user accesses cause a BusFault unconditionally */
+        return false;
+    }
+}
+
+static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
+                                    uint64_t *data, unsigned size,
+                                    MemTxAttrs attrs)
 {
     NVICState *s = (NVICState *)opaque;
     uint32_t offset = addr;
     unsigned i, startvec, end;
     uint32_t val;
 
+    if (attrs.user && !nvic_user_access_ok(s, addr)) {
+        /* Generate BusFault for unprivileged accesses */
+        return MEMTX_ERROR;
+    }
+
     switch (offset) {
     /* reads of set and clear both return the status */
     case 0x100 ... 0x13f: /* NVIC Set enable */
@@ -826,11 +841,13 @@ static uint64_t nvic_sysreg_read(void *opaque, hwaddr addr,
     }
 
     trace_nvic_sysreg_read(addr, val, size);
-    return val;
+    *data = val;
+    return MEMTX_OK;
 }
 
-static void nvic_sysreg_write(void *opaque, hwaddr addr,
-                              uint64_t value, unsigned size)
+static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
 {
     NVICState *s = (NVICState *)opaque;
     uint32_t offset = addr;
@@ -839,6 +856,11 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
 
     trace_nvic_sysreg_write(addr, value, size);
 
+    if (attrs.user && !nvic_user_access_ok(s, addr)) {
+        /* Generate BusFault for unprivileged accesses */
+        return MEMTX_ERROR;
+    }
+
     switch (offset) {
     case 0x100 ... 0x13f: /* NVIC Set enable */
         offset += 0x80;
@@ -853,7 +875,7 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
             }
         }
         nvic_irq_update(s);
-        return;
+        return MEMTX_OK;
     case 0x200 ... 0x23f: /* NVIC Set pend */
         /* the special logic in armv7m_nvic_set_pending()
          * is not needed since IRQs are never escalated
@@ -870,9 +892,9 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
             }
         }
         nvic_irq_update(s);
-        return;
+        return MEMTX_OK;
     case 0x300 ... 0x33f: /* NVIC Active */
-        return; /* R/O */
+        return MEMTX_OK; /* R/O */
     case 0x400 ... 0x5ef: /* NVIC Priority */
         startvec = 8 * (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
 
@@ -880,26 +902,28 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
             set_prio(s, startvec + i, (value >> (i * 8)) & 0xff);
         }
         nvic_irq_update(s);
-        return;
+        return MEMTX_OK;
     case 0xd18 ... 0xd23: /* System Handler Priority.  */
         for (i = 0; i < size; i++) {
             unsigned hdlidx = (offset - 0xd14) + i;
             set_prio(s, hdlidx, (value >> (i * 8)) & 0xff);
         }
         nvic_irq_update(s);
-        return;
+        return MEMTX_OK;
     }
     if (size == 4) {
         nvic_writel(s, offset, value);
-        return;
+        return MEMTX_OK;
     }
     qemu_log_mask(LOG_GUEST_ERROR,
                   "NVIC: Bad write of size %d at offset 0x%x\n", size, offset);
+    /* This is UNPREDICTABLE; treat as RAZ/WI */
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps nvic_sysreg_ops = {
-    .read = nvic_sysreg_read,
-    .write = nvic_sysreg_write,
+    .read_with_attrs = nvic_sysreg_read,
+    .write_with_attrs = nvic_sysreg_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.7.4

