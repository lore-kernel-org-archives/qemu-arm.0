Received: by 10.223.188.70 with SMTP id a6csp5074420wrh;
        Tue, 22 Aug 2017 08:18:40 -0700 (PDT)
X-Received: by 10.200.1.84 with SMTP id f20mr1418445qtg.6.1503415120414;
        Tue, 22 Aug 2017 08:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415120; cv=none;
        d=google.com; s=arc-20160816;
        b=moeM1WiTLC2RSNGLfAe/gTIXgXlHo+aaYm8mn/w5Q0veIGLdi5lpRxcE0ObZ/IHS0G
         eSBMaUtBYEHtpgzJbC/gEEF5qMjj4qOwxeipg4FFpRDZhmqGrSQCa5Fwpa/AP6A9P0Dg
         qzUSCvkjiqwTaJnEx7HmJa/x53TVnopolAUysx4Vl7JGK8jTz0yTqtXZP+UCPN8C+u1u
         zmqyuRlIGdHfrQpBn0VYqBy6uqQFgbb0KQASWxeWqGRwEB37q8GhGZiHMjXpkEYqZWDK
         1F/So0ZrAjB+BlDxcQDsehRFkZ/YjkO+dD7TqmD7gMYBZlIz4kTvum6QW7j+N/Lm7ckE
         eW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=n2uaVqbqUq5OlMflr5hz4owWhpu67v/nqAMNitJz9KA=;
        b=VAb74WQlCdSlyo7R5rh7SOjVbF3C4BOAQUFMcYGexVm4eFYVzk1ZQ0itbDYYm/nYUr
         jdzsKIuOWw/T7RG51CxQUURuPZ9nToAo2uA1q7UpqM0lYjwD8SFTR2dvwTktxqFveGiM
         QsaJK9Y7lIxlWbjjOnDPduEwMtuvrqH9zWfyfLKTeQhlyJbU4T8j5lNaDnI332ysTamL
         wMlkMqW0ssPu66ZeB9tb2E0VZWfPavMY0rBXU/jO8c3WJFkOabV71SDnrxINYpCzPJoz
         cZR9aLcL+NK18Pvn5ZRUVH/oF0Aldxor7IA0gZOJ6sGbhQo4fW/XBE0zbNaK+qu61+p3
         TwjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l31si3640526qtl.22.2017.08.22.08.18.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkAwv-00065K-SC
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:18:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnp-0006Va-Qn
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAno-0003EK-A2
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnk-00037y-Hz; Tue, 22 Aug 2017 11:09:08 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAni-0004in-99; Tue, 22 Aug 2017 16:09:06 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:51 +0100
Message-Id: <1503414539-28762-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 12/20] target/arm: Make MPU_MAIR0,
 MPU_MAIR1 registers banked for v8M
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
X-TUID: OC1+6y61lPJQ

Make the MPU registers MPU_MAIR0 and MPU_MAIR1 banked if v8M security
extensions are enabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 4 ++--
 hw/intc/armv7m_nvic.c | 8 ++++----
 target/arm/cpu.c      | 4 ++--
 target/arm/machine.c  | 6 ++++--
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d0b0936..2f59828 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -545,8 +545,8 @@ typedef struct CPUARMState {
          */
         uint32_t *rbar;
         uint32_t *rlar;
-        uint32_t mair0;
-        uint32_t mair1;
+        uint32_t mair0[2];
+        uint32_t mair1[2];
     } pmsav8;
 
     void *nvic;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 3a1f02d..e98eb95 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -604,12 +604,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
             goto bad_offset;
         }
-        return cpu->env.pmsav8.mair0;
+        return cpu->env.pmsav8.mair0[attrs.secure];
     case 0xdc4: /* MPU_MAIR1 */
         if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
             goto bad_offset;
         }
-        return cpu->env.pmsav8.mair1;
+        return cpu->env.pmsav8.mair1[attrs.secure];
     default:
     bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR, "NVIC: Bad read offset 0x%x\n", offset);
@@ -826,7 +826,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         }
         if (cpu->pmsav7_dregion) {
             /* Register is RES0 if no MPU regions are implemented */
-            cpu->env.pmsav8.mair0 = value;
+            cpu->env.pmsav8.mair0[attrs.secure] = value;
         }
         /* We don't need to do anything else because memory attributes
          * only affect cacheability, and we don't implement caching.
@@ -838,7 +838,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         }
         if (cpu->pmsav7_dregion) {
             /* Register is RES0 if no MPU regions are implemented */
-            cpu->env.pmsav8.mair1 = value;
+            cpu->env.pmsav8.mair1[attrs.secure] = value;
         }
         /* We don't need to do anything else because memory attributes
          * only affect cacheability, and we don't implement caching.
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae866be..ae8af19 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -249,8 +249,8 @@ static void arm_cpu_reset(CPUState *s)
             }
         }
         env->pmsav7.rnr = 0;
-        env->pmsav8.mair0 = 0;
-        env->pmsav8.mair1 = 0;
+        memset(env->pmsav8.mair0, 0, sizeof(env->pmsav8.mair0));
+        memset(env->pmsav8.mair1, 0, sizeof(env->pmsav8.mair1));
     }
 
     set_flush_to_zero(1, &env->vfp.standard_fp_status);
diff --git a/target/arm/machine.c b/target/arm/machine.c
index cd6b6af..414a879 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -229,8 +229,8 @@ static const VMStateDescription vmstate_pmsav8 = {
                               vmstate_info_uint32, uint32_t),
         VMSTATE_VARRAY_UINT32(env.pmsav8.rlar, ARMCPU, pmsav7_dregion, 0,
                               vmstate_info_uint32, uint32_t),
-        VMSTATE_UINT32(env.pmsav8.mair0, ARMCPU),
-        VMSTATE_UINT32(env.pmsav8.mair1, ARMCPU),
+        VMSTATE_UINT32(env.pmsav8.mair0[M_REG_NS], ARMCPU),
+        VMSTATE_UINT32(env.pmsav8.mair1[M_REG_NS], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -255,6 +255,8 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.v7m.faultmask[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.control[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.vecbase[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.pmsav8.mair0[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.pmsav8.mair1[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

