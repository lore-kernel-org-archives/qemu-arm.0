Received: by 10.28.71.27 with SMTP id u27csp1159248wma;
        Fri, 9 Feb 2018 08:59:12 -0800 (PST)
X-Google-Smtp-Source: AH8x226SQm0b/BWIPC4VrffBP4Ovg5T95A9e8Cy3zufYkM7yK5Pii2Yj0JVHeHoJjqWZGlLFrXjV
X-Received: by 10.37.187.67 with SMTP id b3mr2262080ybk.161.1518195552617;
        Fri, 09 Feb 2018 08:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195552; cv=none;
        d=google.com; s=arc-20160816;
        b=zzhS+UGDS3z2h4jViDDgF2lwwdLu9kXxNIvCobDDhGpdajf85h2Dx9HrGMSMRam3R1
         S9852oksUEt/NBd9Giczw+eiafqNr/iF87wTcrI40NQWzc6ZOshYzaM+YguN4EzcwI38
         rRX/2jkrXx4MLM4Nf/5YHrEN/07NbmVnXsLl9phS3e5/2rPVQOHwKt82QCyAU3/itnld
         XgAvMRZgLoyq3psSZpWvjJY4bJ2wsUGkSpAjSTlV+5pYdVpiCZGDbjSeTNz4TMagaRmm
         TfjmuIp9a+pUpUFzdV0gZ+wwbGXvmACL7FFWCISVRpCCxOTAsYHvXjoV3DZP49RW9FNY
         DUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=oilZFdbngdoZgrErTwbIFe/9tviyhfuHlkhAqjSzA50=;
        b=gh+Z5pjPws4gCJp9cNKv2LEW8PKx2wBvXQLJraX5Xn7GsaPvI33SEUJ3NhbMdW9NR3
         JbzfibGGNRR0wCz66JnxHRAvMD4NsvtL6NFGC4NsCGu0Y5d1gNLtxh76nfdOS3rE0cYQ
         L+4Lfz1cGn1ZhDz0DoUfdrqWXltOqa7GA52YO/NlpHyPg2JiJ88DCCEOcbJ8sTHKH/ui
         HSHuS3sBvKbuBX3BUAZRco8rIEwxHjT4pAPAMmg99woTBMzE136mb+8e6Dd1WXXpp/Og
         4i5ol3kfS5JI3MFt0IvDbV9A1a2KjPhFPwXLJfj0ThrjVVY3PTy/og0AE+3hX1JwKLyi
         TAag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t184si474423ywb.736.2018.02.09.08.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 08:59:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC12-0004Y1-0K
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 11:59:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0B-0003wR-V0
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC09-0007kw-WF
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:20 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC09-0007jY-OD; Fri, 09 Feb 2018 11:58:17 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC08-00030O-K7; Fri, 09 Feb 2018 16:58:16 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:04 +0000
Message-Id: <20180209165810.6668-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 05/11] hw/intc/armv7m_nvic: Implement cache ID
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
X-TUID: OrNlCyOYHkbs

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
v1->v2 changes: use FIELD() to define some constants;
add compile-time assert that we won't index outside cssidr[]
---
 target/arm/cpu.h      | 26 ++++++++++++++++++++++++++
 hw/intc/armv7m_nvic.c | 16 ++++++++++++++++
 target/arm/machine.c  | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 521444a5a1..4c1b9e9814 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -496,6 +496,7 @@ typedef struct CPUARMState {
         uint32_t faultmask[M_REG_NUM_BANKS];
         uint32_t aircr; /* only holds r/w state if security extn implemented */
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
+        uint32_t csselr[M_REG_NUM_BANKS];
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -1325,6 +1326,23 @@ FIELD(V7M_MPU_CTRL, ENABLE, 0, 1)
 FIELD(V7M_MPU_CTRL, HFNMIENA, 1, 1)
 FIELD(V7M_MPU_CTRL, PRIVDEFENA, 2, 1)
 
+/* v7M CLIDR bits */
+FIELD(V7M_CLIDR, CTYPE_ALL, 0, 21)
+FIELD(V7M_CLIDR, LOUIS, 21, 3)
+FIELD(V7M_CLIDR, LOC, 24, 3)
+FIELD(V7M_CLIDR, LOUU, 27, 3)
+FIELD(V7M_CLIDR, ICB, 30, 2)
+
+FIELD(V7M_CSSELR, IND, 0, 1)
+FIELD(V7M_CSSELR, LEVEL, 1, 3)
+/* We use the combination of InD and Level to index into cpu->ccsidr[];
+ * define a mask for this and check that it doesn't permit running off
+ * the end of the array.
+ */
+FIELD(V7M_CSSELR, INDEX, 0, 4)
+
+QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
+
 /* If adding a feature bit which corresponds to a Linux ELF
  * HWCAP bit, remember to update the feature-bit-to-hwcap
  * mapping in linux-user/elfload.c:get_elf_hwcap().
@@ -2485,6 +2503,14 @@ static inline int arm_debug_target_el(CPUARMState *env)
     }
 }
 
+static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
+{
+    /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
+     * CSSELR is RAZ/WI.
+     */
+    return (cpu->clidr & R_V7M_CLIDR_CTYPE_ALL_MASK) != 0;
+}
+
 static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
 {
     if (arm_is_secure(env)) {
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index eb49fd77c7..040f3380ec 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1025,6 +1025,17 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         return cpu->id_isar4;
     case 0xd74: /* ISAR5.  */
         return cpu->id_isar5;
+    case 0xd78: /* CLIDR */
+        return cpu->clidr;
+    case 0xd7c: /* CTR */
+        return cpu->ctr;
+    case 0xd80: /* CSSIDR */
+    {
+        int idx = cpu->env.v7m.csselr[attrs.secure] & R_V7M_CSSELR_INDEX_MASK;
+        return cpu->ccsidr[idx];
+    }
+    case 0xd84: /* CSSELR */
+        return cpu->env.v7m.csselr[attrs.secure];
     /* TODO: Implement debug registers.  */
     case 0xd90: /* MPU_TYPE */
         /* Unified MPU; if the MPU is not present this value is zero */
@@ -1385,6 +1396,11 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         qemu_log_mask(LOG_UNIMP,
                       "NVIC: Aux fault status registers unimplemented\n");
         break;
+    case 0xd84: /* CSSELR */
+        if (!arm_v7m_csselr_razwi(cpu)) {
+            cpu->env.v7m.csselr[attrs.secure] = value & R_V7M_CSSELR_INDEX_MASK;
+        }
+        break;
     case 0xd90: /* MPU_TYPE */
         return; /* RO */
     case 0xd94: /* MPU_CTRL */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 2c8b43062f..cae63c2f98 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -191,6 +191,41 @@ static const VMStateDescription vmstate_m_faultmask_primask = {
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
+    return cpu->env.v7m.csselr[M_REG_NS] <= R_V7M_CSSELR_INDEX_MASK
+        && cpu->env.v7m.csselr[M_REG_S] <= R_V7M_CSSELR_INDEX_MASK;
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
@@ -212,6 +247,7 @@ static const VMStateDescription vmstate_m = {
     },
     .subsections = (const VMStateDescription*[]) {
         &vmstate_m_faultmask_primask,
+        &vmstate_m_csselr,
         NULL
     }
 };
-- 
2.16.1

