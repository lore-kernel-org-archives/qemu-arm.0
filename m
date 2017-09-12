Received: by 10.223.172.38 with SMTP id v35csp7464433wrc;
        Tue, 12 Sep 2017 11:14:30 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDLk3JtwzI7JIJrXJA3WVJ/Sbyl1AQkgXMxOrzHaWEd46wO01DBUg0S+NmQOH59MUkAyMbG
X-Received: by 10.55.104.138 with SMTP id d132mr22358811qkc.151.1505240070571;
        Tue, 12 Sep 2017 11:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240070; cv=none;
        d=google.com; s=arc-20160816;
        b=rV7dWPKovyfAwlxPGAvxWj840Gll0WdyVXDOwdSnYhoPRZa1Kyzhk1JEOLZR6QkUvO
         9i3Ja/0hD5dbeehedEb4Ag7T5Eq/Zr9NAmhDNiSNy5JQ7Af2h7MT5PyEgh1i6Bp02F1l
         mIineqsznVFI8mHNDJGMJo4YCfiWxVdP8cLsPlU8TlFPTB4Ng8igm6Cnwc7mIJ9Llxal
         N0mapIkPVr0tJnuFVOJfpx7hBJE0Lmus8fSTtus4e7g9Pw7g4QfBkuR3O72EbZgRHlo9
         LE3Ize0KjjuAnO6rjzv4fL2/g1UBbE05s+X14iVRtNCiwYCVnUUhw7uMwTiGAp1zVKS5
         p28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=S4xRoR+aki4pDlDeeX3neR3B7CUCg/JnQcDHI9nYI54=;
        b=EJkAkHZWFEfbBeDC2ZwqkK2gH3V3duziJ4oC+dy5V5KgOrVr/YJDtGNhM3lux6vIz+
         YjsAF5LeFOLKMXVvj1iMSO2ZJA8wJhUqjS0ykss0EBlbIDQV7Gf07HM/qBirSiOBNT71
         LYoR1HOwIhduMhIOBQOGSO0f/f9vzVS5CDqGAiPEq5Z77p+1rLUXYCTMhfqqoqnO9X5l
         zH7fFd3bI6vtGAwIkyCs+U4e2eOZRgbkmU53+TEwuJdQ1S50zDibAvrzvlOnZq6BDW+9
         V8NJ4ENH4cFSywP3Kzq3w89hxlS/vuWlw0ET60v3hRkSEBhUpl9Z1CYiAOkZevXtE3Qu
         BSpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17si12660760qkc.490.2017.09.12.11.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drphc-0003u6-9R
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:14:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgx-0003Lw-0f
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgv-0006Mv-K7
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37292)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgv-0006Ln-BH; Tue, 12 Sep 2017 14:13:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgs-00014J-RH; Tue, 12 Sep 2017 19:13:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:52 +0100
Message-Id: <1505240046-11454-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 05/19] nvic: Implement AIRCR changes for v8M
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
X-TUID: Hts06V9Rj1nE

The Application Interrupt and Reset Control Register has some changes
for v8M:
 * new bits SYSRESETREQS, BFHFNMINS and PRIS: these all have
   real state if the security extension is implemented and otherwise
   are constant
 * the PRIGROUP field is banked between security states
 * non-secure code can be blocked from using the SYSRESET bit
   to reset the system if SYSRESETREQS is set

Implement the new state and the changes to register read and write.
For the moment we ignore the effects of the secure PRIGROUP.
We will implement the effects of PRIS and BFHFNMIS later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h |  3 ++-
 target/arm/cpu.h              | 12 +++++++++++
 hw/intc/armv7m_nvic.c         | 49 +++++++++++++++++++++++++++++++++----------
 target/arm/cpu.c              |  7 +++++++
 4 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 329774e..e96e488 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -55,7 +55,8 @@ typedef struct NVICState {
      * Entries in sec_vectors[] for non-banked exception numbers are unused.
      */
     VecInfo sec_vectors[NVIC_INTERNAL_VECTORS];
-    uint32_t prigroup;
+    /* The PRIGROUP field in AIRCR is banked */
+    uint32_t prigroup[M_REG_NUM_BANKS];
 
     /* The following fields are all cached state that can be recalculated
      * from the vectors[] and sec_vectors[] arrays and the prigroup field:
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5a1f957..7e661c8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -449,6 +449,7 @@ typedef struct CPUARMState {
         int exception;
         uint32_t primask[M_REG_NUM_BANKS];
         uint32_t faultmask[M_REG_NUM_BANKS];
+        uint32_t aircr; /* only holds r/w state if security extn implemented */
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
     } v7m;
 
@@ -1200,6 +1201,17 @@ FIELD(V7M_CCR, STKALIGN, 9, 1)
 FIELD(V7M_CCR, DC, 16, 1)
 FIELD(V7M_CCR, IC, 17, 1)
 
+/* V7M AIRCR bits */
+FIELD(V7M_AIRCR, VECTRESET, 0, 1)
+FIELD(V7M_AIRCR, VECTCLRACTIVE, 1, 1)
+FIELD(V7M_AIRCR, SYSRESETREQ, 2, 1)
+FIELD(V7M_AIRCR, SYSRESETREQS, 3, 1)
+FIELD(V7M_AIRCR, PRIGROUP, 8, 3)
+FIELD(V7M_AIRCR, BFHFNMINS, 13, 1)
+FIELD(V7M_AIRCR, PRIS, 14, 1)
+FIELD(V7M_AIRCR, ENDIANNESS, 15, 1)
+FIELD(V7M_AIRCR, VECTKEY, 16, 16)
+
 /* V7M CFSR bits for MMFSR */
 FIELD(V7M_CFSR, IACCVIOL, 0, 1)
 FIELD(V7M_CFSR, DACCVIOL, 1, 1)
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 8388d64..585b1a7 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -129,7 +129,7 @@ static bool nvic_isrpending(NVICState *s)
  */
 static inline uint32_t nvic_gprio_mask(NVICState *s)
 {
-    return ~0U << (s->prigroup + 1);
+    return ~0U << (s->prigroup[M_REG_NS] + 1);
 }
 
 /* Recompute vectpending and exception_prio */
@@ -451,8 +451,21 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         return val;
     case 0xd08: /* Vector Table Offset.  */
         return cpu->env.v7m.vecbase[attrs.secure];
-    case 0xd0c: /* Application Interrupt/Reset Control.  */
-        return 0xfa050000 | (s->prigroup << 8);
+    case 0xd0c: /* Application Interrupt/Reset Control (AIRCR) */
+        val = 0xfa050000 | (s->prigroup[attrs.secure] << 8);
+        if (attrs.secure) {
+            /* s->aircr stores PRIS, BFHFNMINS, SYSRESETREQS */
+            val |= cpu->env.v7m.aircr;
+        } else {
+            if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+                /* BFHFNMINS is R/O from NS; other bits are RAZ/WI. If
+                 * security isn't supported then BFHFNMINS is RAO (and
+                 * the bit in env.v7m.aircr is always set).
+                 */
+                val |= cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK;
+            }
+        }
+        return val;
     case 0xd10: /* System Control.  */
         /* TODO: Implement SLEEPONEXIT.  */
         return 0;
@@ -660,22 +673,35 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
     case 0xd08: /* Vector Table Offset.  */
         cpu->env.v7m.vecbase[attrs.secure] = value & 0xffffff80;
         break;
-    case 0xd0c: /* Application Interrupt/Reset Control.  */
-        if ((value >> 16) == 0x05fa) {
-            if (value & 4) {
-                qemu_irq_pulse(s->sysresetreq);
+    case 0xd0c: /* Application Interrupt/Reset Control (AIRCR) */
+        if ((value >> R_V7M_AIRCR_VECTKEY_SHIFT) == 0x05fa) {
+            if (value & R_V7M_AIRCR_SYSRESETREQ_MASK) {
+                if (attrs.secure ||
+                    !(cpu->env.v7m.aircr & R_V7M_AIRCR_SYSRESETREQS_MASK)) {
+                    qemu_irq_pulse(s->sysresetreq);
+                }
             }
-            if (value & 2) {
+            if (value & R_V7M_AIRCR_VECTCLRACTIVE_MASK) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "Setting VECTCLRACTIVE when not in DEBUG mode "
                               "is UNPREDICTABLE\n");
             }
-            if (value & 1) {
+            if (value & R_V7M_AIRCR_VECTRESET_MASK) {
+                /* NB: this bit is RES0 in v8M */
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "Setting VECTRESET when not in DEBUG mode "
                               "is UNPREDICTABLE\n");
             }
-            s->prigroup = extract32(value, 8, 3);
+            s->prigroup[attrs.secure] = extract32(value,
+                                                  R_V7M_AIRCR_PRIGROUP_SHIFT,
+                                                  R_V7M_AIRCR_PRIGROUP_LENGTH);
+            if (attrs.secure) {
+                /* These bits are only writable by secure */
+                cpu->env.v7m.aircr = value &
+                    (R_V7M_AIRCR_SYSRESETREQS_MASK |
+                     R_V7M_AIRCR_BFHFNMINS_MASK |
+                     R_V7M_AIRCR_PRIS_MASK);
+            }
             nvic_irq_update(s);
         }
         break;
@@ -1193,6 +1219,7 @@ static const VMStateDescription vmstate_nvic_security = {
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT_ARRAY(sec_vectors, NVICState, NVIC_INTERNAL_VECTORS, 1,
                              vmstate_VecInfo, VecInfo),
+        VMSTATE_UINT32(prigroup[M_REG_S], NVICState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1205,7 +1232,7 @@ static const VMStateDescription vmstate_nvic = {
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT_ARRAY(vectors, NVICState, NVIC_MAX_VECTORS, 1,
                              vmstate_VecInfo, VecInfo),
-        VMSTATE_UINT32(prigroup, NVICState),
+        VMSTATE_UINT32(prigroup[M_REG_NS], NVICState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 412e94c..6ee169d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -187,6 +187,13 @@ static void arm_cpu_reset(CPUState *s)
 
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             env->v7m.secure = true;
+        } else {
+            /* This bit resets to 0 if security is supported, but 1 if
+             * it is not. The bit is not present in v7M, but we set it
+             * here so we can avoid having to make checks on it conditional
+             * on ARM_FEATURE_V8 (we don't let the guest see the bit).
+             */
+            env->v7m.aircr = R_V7M_AIRCR_BFHFNMINS_MASK;
         }
 
         /* In v7M the reset value of this bit is IMPDEF, but ARM recommends
-- 
2.7.4

