Received: by 10.28.71.27 with SMTP id u27csp2342015wma;
        Mon, 5 Feb 2018 02:58:08 -0800 (PST)
X-Google-Smtp-Source: AH8x227dOiKUUGfrhtG2Vxg8ae6XirlfmOxNviLvVnKH//uG1hDNH+3rsoC0ryRjFdJTFa9n12NY
X-Received: by 10.37.21.3 with SMTP id 3mr8037336ybv.491.1517828288422;
        Mon, 05 Feb 2018 02:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828288; cv=none;
        d=google.com; s=arc-20160816;
        b=GMSC4KwYYIQbMwVLF9ozc1ak7hWIlinSMIUVS5eXPgcQtuEPA/1nHRA9LSt8ypzRYw
         AACemMQdvPLWdGuT1gzPBbfaniSoa58eUU/o8t7su+STGtNXmOMRaFbHFIqjY28tMJVc
         wYvODks/RQGlPxLyU03FkrxWKmmiIfTtRLDPjdckhvOy7iMVz1Gz3aMhiIi/iJQEWMxP
         CbpDobVfLwUsUJQ5oriAsAfht7Sx7UWI2Ivzu5fOyuPS3rfPIebHqD8i3IBhx8SvBrfO
         7OlgVh2cC0RDY1CRXxg8n1LZTAoNTHzDIQthzHUWKVg+IXLuBjpJRSXGsVyxPVSUZRao
         gt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=cH8uO+0EaS3hhOSV5+2eW8ULYPvqqzi8KcjdHJmaFxQ=;
        b=EIRH25dZS81XDHBv+K26IgvU8CbaM4s1NLwx+272qQ6c5oKEp32U4XOu0gmPG2IpcE
         VHfMRp4yi2zWdl94loFAvMl8Fs9ihzF3//G7M4IJJlxWNO6KkBShbv/6PzpWy5uOzRkd
         1EtvQZTTsCal3j3wahob2DWXqZFuO9XE9WQyEXzgAnk1a1RzUx0yDW1f2eB6ErX4wm+T
         PUman4y56te2+LNqrsnbJm7OIxNwi4lpztVhlZ01nKCLztslAHLfUc51BULYaDATy9an
         Eyt8OUTW2Qe7Fi0xROnlfe3rkPRo19mXYt6dI+aYuXaeBHLNeKTDRfTyYtt0y3e4BGFb
         o/0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c65si1388328ywe.519.2018.02.05.02.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 02:58:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieTP-0006OH-Pl
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 05:58:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSt-00063i-QC
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSs-0007Cw-Pe
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:35 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSs-00076t-HM; Mon, 05 Feb 2018 05:57:34 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSj-0004FP-QT; Mon, 05 Feb 2018 10:57:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:17 +0000
Message-Id: <20180205105720.14620-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205105720.14620-1-peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/8] hw/intc/armv7m_nvic: Implement cache ID
 registers
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
X-TUID: nO+DvMixJV4P

M profile cores have a similar setup for cache ID registers
to A profile:
 * Cache Level ID Register (CLIDR) is a fixed value
 * Cache Type Register (CTR) is a fixed value
 * Cache Size ID Registers (CCSIDR) are a bank of registers;
   which one you see is selected by the Cache Size Selection
   Register (CSSELR)

The only difference is that they're in the NVIC memory mapped
register space rather than being coprocessor registers.
Implement the M profile view of them.

Since neither Cortex-M3 nor Cortex-M4 implement caches,
we don't need to update their init functions and can leave
the ctr/clidr/ccsidr[] fields in their ARMCPU structs at zero.
Newer cores (like the Cortex-M33) will want to be able to
set these ID registers to non-zero values, though.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The CSSELR/CCSIDR parts are a bit under-motivated, because
the Cortex-M33 doesn't implement caches either and so they
are RAZ/WI for that as well as M3/M4, though I'd written all
the code before I realized that. This will be helpful if
we ever need a Cortex-M7 model, though (which does have
a couple of CSSIDR array entries).
---
 target/arm/cpu.h      |  9 +++++++++
 hw/intc/armv7m_nvic.c | 13 +++++++++++++
 target/arm/machine.c  | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f21f68ec4a..99c7cb996f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -453,6 +453,7 @@ typedef struct CPUARMState {
         uint32_t faultmask[M_REG_NUM_BANKS];
         uint32_t aircr; /* only holds r/w state if security extn implemented */
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
+        uint32_t csselr[M_REG_NUM_BANKS];
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -2443,6 +2444,14 @@ static inline int arm_debug_target_el(CPUARMState *env)
     }
 }
 
+static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
+{
+    /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
+     * CSSELR is RAZ/WI.
+     */
+    return (cpu->clidr & 0x001fffff) != 0;
+}
+
 static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
 {
     if (arm_is_secure(env)) {
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index eb49fd77c7..cc83c9e553 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1025,6 +1025,14 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         return cpu->id_isar4;
     case 0xd74: /* ISAR5.  */
         return cpu->id_isar5;
+    case 0xd78: /* CLIDR */
+        return cpu->clidr;
+    case 0xd7c: /* CTR */
+        return cpu->ctr;
+    case 0xd80: /* CSSIDR */
+        return cpu->ccsidr[cpu->env.v7m.csselr[attrs.secure] & 0xf];
+    case 0xd84: /* CSSELR */
+        return cpu->env.v7m.csselr[attrs.secure];
     /* TODO: Implement debug registers.  */
     case 0xd90: /* MPU_TYPE */
         /* Unified MPU; if the MPU is not present this value is zero */
@@ -1385,6 +1393,11 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         qemu_log_mask(LOG_UNIMP,
                       "NVIC: Aux fault status registers unimplemented\n");
         break;
+    case 0xd84: /* CSSELR */
+        if (!arm_v7m_csselr_razwi(cpu)) {
+            cpu->env.v7m.csselr[attrs.secure] = value & 0xf;
+        }
+        break;
     case 0xd90: /* MPU_TYPE */
         return; /* RO */
     case 0xd94: /* MPU_CTRL */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index a85c2430d3..968ec30b4a 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -108,6 +108,41 @@ static const VMStateDescription vmstate_m_faultmask_primask = {
     }
 };
 
+/* CSSELR is in a subsection because we didn't implement it previously.
+ * Migration from an old implementation will leave it at zero, which
+ * is OK since the only CPUs in the old implementation make the
+ * register RAZ/WI.
+ * Since there was no version of QEMU which implemented the CSSELR for
+ * just non-secure, we transfer both banks here rather than putting
+ * the secure banked version in the m-security subsection.
+ */
+static bool csselr_vmstate_validate(void *opaque, int version_id)
+{
+    ARMCPU *cpu = opaque;
+
+    return cpu->env.v7m.csselr[M_REG_NS] < sizeof(cpu->ccsidr)
+        && cpu->env.v7m.csselr[M_REG_S] < sizeof(cpu->ccsidr);
+}
+
+static bool m_csselr_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    return !arm_v7m_csselr_razwi(cpu);
+}
+
+static const VMStateDescription vmstate_m_csselr = {
+    .name = "cpu/m/csselr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m_csselr_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(env.v7m.csselr, ARMCPU, M_REG_NUM_BANKS),
+        VMSTATE_VALIDATE("CSSELR is valid", csselr_vmstate_validate),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 4,
@@ -129,6 +164,7 @@ static const VMStateDescription vmstate_m = {
     },
     .subsections = (const VMStateDescription*[]) {
         &vmstate_m_faultmask_primask,
+        &vmstate_m_csselr,
         NULL
     }
 };
-- 
2.16.1

