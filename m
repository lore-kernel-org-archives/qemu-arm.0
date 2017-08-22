Received: by 10.223.188.70 with SMTP id a6csp5082375wrh;
        Tue, 22 Aug 2017 08:25:54 -0700 (PDT)
X-Received: by 10.55.52.213 with SMTP id b204mr1441686qka.120.1503415554165;
        Tue, 22 Aug 2017 08:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415554; cv=none;
        d=google.com; s=arc-20160816;
        b=q3z6jAvQBsc8IM5o8iVIAj/T70mTo1s7L11Vuhbs7DsvfFrge/izm6tl0CnqxGKCv0
         jw1J1bheah3FBFcXgP04ZjUmw3ZajkeqfpdL+QH7LhAVp/MnOrOwo2BRT0CJ1/TSQAYY
         dWXJSP51BWCw0q0bfbqYYfkyqPKX9bKDXZig1R9nLcB4xnEBSu1xS7RXF6FzdTDL5uoY
         H3bSFXWbGbcYTlJcxmC7mjcFazjYgr7D6lgdOkh6v1iTHP/+Po12J/bg+bO1yUcMGBoY
         5AQuNwouU0KOE+P6tEvL0pI8GYLcNJYE+mnUmbGGRhCRDH+TFXS6BaQuqixrAHxNsjT6
         F6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=VnE4ZWZJUHQ3b/HKyV0FCKWJeqQj1GV90M8zC48TM6U=;
        b=rCcQtFtgBQuj98fZUk8gHiLZvH84lvRLGayJNOrGUkLb1YNtX7tf2F6SFlRgwjNETF
         mUM/kHgEJ1Di19K4oxtGZP+kaKJwVTZrGWqh+6rx8fwnMt2obELY/cy6OZ07K+ZiWRco
         L11WsbW1XgSm7dr8O//l4XMXoKrgyLiXSyssQ5Z5DjlIrZPnaYlx/LnSAMxcOuAjsqJ5
         uFoUafrJkj0sWyxCDCjmXA3iWx2CBVTVmnyc+IiOCNc1/2vbmm7LohP1PlBm4PDtaajC
         c2uxNCc6GAQXpxTOzsFGrprQCDID8d7HBfCZaE6+utVJauk8bYaX6TPg4Bv/mKkhKCBw
         g1IA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w67si13712869qkc.114.2017.08.22.08.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkB3v-0003dK-Qs
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:25:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnv-0006cy-Pi
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAns-0003J4-CI
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAni-00037y-Gd; Tue, 22 Aug 2017 11:09:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnh-0004i6-H2; Tue, 22 Aug 2017 16:09:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:50 +0100
Message-Id: <1503414539-28762-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 11/20] target/arm: Make VTOR register banked
 for v8M
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VK0zeyiqc2q8

Make the VTOR register banked if v8M security extensions are enabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  2 +-
 hw/intc/armv7m_nvic.c | 13 +++++++------
 target/arm/helper.c   |  2 +-
 target/arm/machine.c  |  3 ++-
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e922d1f..d0b0936 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -420,7 +420,7 @@ typedef struct CPUARMState {
 
     struct {
         uint32_t other_sp;
-        uint32_t vecbase;
+        uint32_t vecbase[2];
         uint32_t basepri[2];
         uint32_t control[2];
         uint32_t ccr; /* Configuration and Control */
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 2b0b328..3a1f02d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -403,7 +403,7 @@ static void set_irq_level(void *opaque, int n, int level)
     }
 }
 
-static uint32_t nvic_readl(NVICState *s, uint32_t offset)
+static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
 {
     ARMCPU *cpu = s->cpu;
     uint32_t val;
@@ -441,7 +441,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
         /* ISRPREEMPT not implemented */
         return val;
     case 0xd08: /* Vector Table Offset.  */
-        return cpu->env.v7m.vecbase;
+        return cpu->env.v7m.vecbase[attrs.secure];
     case 0xd0c: /* Application Interrupt/Reset Control.  */
         return 0xfa050000 | (s->prigroup << 8);
     case 0xd10: /* System Control.  */
@@ -617,7 +617,8 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
     }
 }
 
-static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
+static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
+                        MemTxAttrs attrs)
 {
     ARMCPU *cpu = s->cpu;
 
@@ -638,7 +639,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
         }
         break;
     case 0xd08: /* Vector Table Offset.  */
-        cpu->env.v7m.vecbase = value & 0xffffff80;
+        cpu->env.v7m.vecbase[attrs.secure] = value & 0xffffff80;
         break;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
         if ((value >> 16) == 0x05fa) {
@@ -944,7 +945,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
         break;
     default:
         if (size == 4) {
-            val = nvic_readl(s, offset);
+            val = nvic_readl(s, offset, attrs);
         } else {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "NVIC: Bad read of size %d at offset 0x%x\n",
@@ -1025,7 +1026,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
         return MEMTX_OK;
     }
     if (size == 4) {
-        nvic_writel(s, offset, value);
+        nvic_writel(s, offset, value, attrs);
         return MEMTX_OK;
     }
     qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8e74b10..b1bb507 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6072,7 +6072,7 @@ static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult result;
-    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
+    hwaddr vec = env->v7m.vecbase[env->v7m.secure] + env->v7m.exception * 4;
     uint32_t addr;
 
     addr = address_space_ldl(cs->as, vec,
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 2cd64c5..cd6b6af 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -114,7 +114,7 @@ static const VMStateDescription vmstate_m = {
     .minimum_version_id = 4,
     .needed = m_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
+        VMSTATE_UINT32(env.v7m.vecbase[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.control[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
@@ -254,6 +254,7 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.v7m.primask[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.faultmask[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.control[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.v7m.vecbase[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

