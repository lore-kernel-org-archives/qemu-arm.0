Received: by 10.28.4.212 with SMTP id 203csp4254868wme;
        Tue, 17 Apr 2018 13:45:10 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/dNBYnLFsW4ppa5FTv7iMOFoM8RurIXGS562DXcqsyS0zguH6+LByxs9cxyTUy+ubOGlYo
X-Received: by 10.129.226.65 with SMTP id z1mr2651062ywl.333.1523997910461;
        Tue, 17 Apr 2018 13:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997910; cv=none;
        d=google.com; s=arc-20160816;
        b=abjVb3G2ORoLqB43sWeezB9Ii9+3hxTugIc9N91enI+pATyF/3j7A+1oXt5rGWsxur
         8eTyD5YQkwIZJXYAsqH/eLyq2qwOYZE0ensZ+Uy5Vn+uOOdVrbmje68QotaFGHa4iyHb
         XWA9q/m9G0RO64++3Bg7mGYvgDQJAM/WlLN43bBYxeFHgOc9wktKdv+z73IT39EfV8H9
         /WjPLyIerzB5yDOLWa2YlCr2lB2a+3moNI9pyvTgNSipGZXmMQxMiD6ZNTwyMS9i5Z8V
         w/1tQxWXTOcvyNa72yMQpyJtRVjlA/+p7CXmjjn+BbyM1LyRp9g2XbaA0mGBKmDsCFu+
         FFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=XNkcPUMjLg28x/Rfqr2uRTAKQts6bRoSA0cU/KDh5B4=;
        b=U2D08bAcuJ/uk/7IXaW2RkclMExpwpLC5uQT+cCrWrAal+KjUYYR+Wux0nNlFJ2uGd
         5dflw1FZ9X68bmzKWtt8P2J/Zcf6d3CcG/TgW6ENetL8cYTRaPe7+3rvs+hGpOixEXpS
         EgOfML2MinGD/tCX+BtOdhjv+aYo8TG37TipMYuUkdbo2vbdgwidQ5wD95dRdIhxph/A
         gg1o85FT0AYI2J+2Wq8rqbXLXv7TIkiq1UBKTEF/NFTgovARuo29ghP+yWtsYoT+ZgPh
         bTKLNGfMfFuGseTpU+dwlydyDp90IuxtgaTSSMjl/BrQkuVAFB3pVRJ8DcQhrU9s5DZW
         JR0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HEjn5U2K;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HqROVR3d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188si8581157qkh.200.2018.04.17.13.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HEjn5U2K;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HqROVR3d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XTR-00082l-Ri
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:45:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNn-0003An-Di
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNh-00074B-V5
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNh-0006vV-D0; Tue, 17 Apr 2018 16:39:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 240A86090E; Tue, 17 Apr 2018 20:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997552;
	bh=Q1A/ih0Kl0ID/FFsOydAQ0A1r3V6rdg4viSEkHoqP3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HEjn5U2KhsTp21a2qoxC6rLjdc6GDemMgPaKGHWZZm9DN04L8513TyZNN45aIg5f5
	d10pLH+ZSwP/54Wej/Hjgr0Ou4gNk8k5O2/QLmBYAQajlkT0Jk8/X+MuzHUo4Qz32E
	6RUmWlOzgWdOPBFJWkz7jgxfmENdoBW8jCBgGWew=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D19160FEB;
	Tue, 17 Apr 2018 20:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997545;
	bh=Q1A/ih0Kl0ID/FFsOydAQ0A1r3V6rdg4viSEkHoqP3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HqROVR3ddZclJLGAqz/6lIAYP0BSG5983KVnq53fZIdJHUnSo6uOtzSnYpEhxVRvg
	xcin6Trkut4Rv7KNSWcpONbd0FonAC5x9DjTPkV2iAxEXSJrpnzcqQDWHCc1TjkwCW
	gwB50CCvCihIZedPH2z9pBJ6NVl74LYs8fJiui6U=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D19160FEB
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:38:00 -0400
Message-Id: <1523997485-1905-17-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 16/21] target/arm: Finish implementation of
 PM[X]EVCNTR and PM[X]EVTYPER
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dr4lhd34hvF/

Add arrays to hold the registers, the definitions themselves, access
functions, and logic to reset counters when PMCR.P is set. Update
filtering code to support counters other than PMCCNTR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.h    |   3 +
 target/arm/helper.c | 238 ++++++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 216 insertions(+), 25 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f058f5c..2f07196 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -468,6 +468,9 @@ typedef struct CPUARMState {
          * pmccntr_op_finish.
          */
         uint64_t c15_ccnt_delta;
+        uint64_t c14_pmevcntr[31];
+        uint64_t c14_pmevcntr_delta[31];
+        uint64_t c14_pmevtyper[31];
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7a715a6..b36630f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -907,6 +907,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMCRDP  0x10
 #define PMCRD   0x8
 #define PMCRC   0x4
+#define PMCRP   0x2
 #define PMCRE   0x1
 
 #define PMXEVTYPER_P          0x80000000
@@ -1089,9 +1090,11 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
         prohibited = env->cp15.c9_pmcr & PMCRDP;
     }
 
-    /* TODO Remove assert, set filter to correct PMEVTYPER */
-    assert(counter == 31);
-    filter = env->cp15.pmccfiltr_el0;
+    if (counter == 31) {
+        filter = env->cp15.pmccfiltr_el0;
+    } else {
+        filter = env->cp15.c14_pmevtyper[counter];
+    }
 
     p   = filter & PMXEVTYPER_P;
     u   = filter & PMXEVTYPER_U;
@@ -1111,6 +1114,21 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
         filtered = m != p;
     }
 
+    if (counter != 31) {
+        /* If not checking PMCCNTR, ensure the counter is setup to an event we
+         * support */
+        uint16_t event = filter & PMXEVTYPER_EVTCOUNT;
+        if (event > 0x3f) {
+            return false; /* We only support common architectural and
+                             microarchitectural events */
+        }
+
+        uint16_t event_idx = supported_event_map[event];
+        if (event_idx == SUPPORTED_EVENT_SENTINEL) {
+            return false;
+        }
+    }
+
     return enabled && !prohibited && !filtered;
 }
 
@@ -1157,14 +1175,44 @@ void pmccntr_op_finish(CPUARMState *env)
     }
 }
 
+static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
+{
+
+    uint16_t event = env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCOUNT;
+    uint16_t event_idx = supported_event_map[event];
+    uint64_t count = pm_events[event_idx].get_count(env);
+
+    if (pmu_counter_enabled(env, counter)) {
+        env->cp15.c14_pmevcntr[counter] =
+            count - env->cp15.c14_pmevcntr_delta[counter];
+    }
+    env->cp15.c14_pmevcntr_delta[counter] = count;
+}
+
+static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
+{
+    if (pmu_counter_enabled(env, counter)) {
+        env->cp15.c14_pmevcntr_delta[counter] -=
+            env->cp15.c14_pmevcntr[counter];
+    }
+}
+
 void pmu_op_start(CPUARMState *env)
 {
+    unsigned int i;
     pmccntr_op_start(env);
+    for (i = 0; i < pmu_num_counters(env); i++) {
+        pmevcntr_op_start(env, i);
+    }
 }
 
 void pmu_op_finish(CPUARMState *env)
 {
+    unsigned int i;
     pmccntr_op_finish(env);
+    for (i = 0; i < pmu_num_counters(env); i++) {
+        pmevcntr_op_finish(env, i);
+    }
 }
 
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
@@ -1187,6 +1235,13 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         env->cp15.c15_ccnt = 0;
     }
 
+    if (value & PMCRP) {
+        unsigned int i;
+        for (i = 0; i < pmu_num_counters(env); i++) {
+            env->cp15.c14_pmevcntr[i] = 0;
+        }
+    }
+
     /* only the DP, X, D and E bits are writable */
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
@@ -1240,6 +1295,14 @@ void pmccntr_op_finish(CPUARMState *env)
 {
 }
 
+void pmevcntr_op_start(CPUARMState *env, uint8_t i)
+{
+}
+
+void pmevcntr_op_finish(CPUARMState *env, uint8_t i)
+{
+}
+
 void pmu_op_start(CPUARMState *env)
 {
 }
@@ -1269,11 +1332,11 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmccfiltr_write_a32(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    uint64_t saved_cycles = pmccntr_op_start(env);
+    pmccntr_op_start(env);
     /* M is not accessible from AArch32 */
     env->cp15.pmccfiltr_el0 = (env->cp15.pmccfiltr_el0 & PMCCFILTR_M) |
         (value & PMCCFILTR);
-    pmccntr_op_finish(env, saved_cycles);
+    pmccntr_op_finish(env);
 }
 
 static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -1299,41 +1362,124 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
-    value &= PMU_COUNTER_MASK(env);
+    value &= pmu_counter_mask(env);
     env->cp15.c9_pmovsr &= ~value;
 }
 
 static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
-    value &= PMU_COUNTER_MASK(env);
+    value &= pmu_counter_mask(env);
     env->cp15.c9_pmovsr |= value;
 }
 
+static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value, const uint8_t counter)
+{
+    if (counter == 0x1f) {
+        pmccfiltr_write(env, ri, value);
+    } else if (counter < pmu_num_counters(env)) {
+        pmevcntr_op_start(env, counter);
+        env->cp15.c14_pmevtyper[counter] = value & 0xfe0003ff;
+        pmevcntr_op_finish(env, counter);
+    }
+    /* Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
+     * PMSELR value is equal to or greater than the number of implemented
+     * counters, but not equal to 0x1f. We opt to behave as a RAZ/WI.
+     */
+}
+
+static uint64_t pmevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri,
+                               const uint8_t counter)
+{
+    if (counter == 0x1f) {
+        return env->cp15.pmccfiltr_el0;
+    } else if (counter < pmu_num_counters(env)) {
+        return env->cp15.c14_pmevtyper[counter];
+    } else {
+      /* We opt to behave as a RAZ/WI when attempts to access PMXEVTYPER
+       * are CONSTRAINED UNPREDICTABLE. See comments in pmevtyper_write().
+       */
+        return 0;
+    }
+}
+
+static void pmevtyper_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    pmevtyper_write(env, ri, value, counter);
+}
+
+static uint64_t pmevtyper_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    return pmevtyper_read(env, ri, counter);
+}
+
 static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    /* Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
-     * PMSELR value is equal to or greater than the number of implemented
-     * counters, but not equal to 0x1f. We opt to behave as a RAZ/WI.
-     */
-    if (env->cp15.c9_pmselr == 0x1f) {
-        pmccfiltr_write(env, ri, value);
-    }
+    pmevtyper_write(env, ri, value, env->cp15.c9_pmselr & 31);
 }
 
 static uint64_t pmxevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    /* We opt to behave as a RAZ/WI when attempts to access PMXEVTYPER
-     * are CONSTRAINED UNPREDICTABLE. See comments in pmxevtyper_write().
-     */
-    if (env->cp15.c9_pmselr == 0x1f) {
-        return env->cp15.pmccfiltr_el0;
+    return pmevtyper_read(env, ri, env->cp15.c9_pmselr & 31);
+}
+
+static void pmevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value, uint8_t counter)
+{
+    if (counter < pmu_num_counters(env)) {
+        pmevcntr_op_start(env, counter);
+        env->cp15.c14_pmevcntr[counter] = value;
+        pmevcntr_op_finish(env, counter);
+    }
+    /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+     * are CONSTRAINED UNPREDICTABLE. */
+}
+
+static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint8_t counter)
+{
+    if (counter < pmu_num_counters(env)) {
+        uint64_t ret;
+        pmevcntr_op_start(env, counter);
+        ret = env->cp15.c14_pmevcntr[counter];
+        pmevcntr_op_finish(env, counter);
+        return ret;
     } else {
+      /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+       * are CONSTRAINED UNPREDICTABLE. */
         return 0;
     }
 }
 
+static void pmevcntr_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    pmevcntr_write(env, ri, value, counter);
+}
+
+static uint64_t pmevcntr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    return pmevcntr_read(env, ri, counter);
+}
+
+static void pmxevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    pmevcntr_write(env, ri, value, env->cp15.c9_pmselr & 31);
+}
+
+static uint64_t pmxevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return pmevcntr_read(env, ri, env->cp15.c9_pmselr & 31);
+}
+
 static void pmuserenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1521,16 +1667,23 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
       .resetvalue = 0, },
     { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access,
       .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
     { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access,
       .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
-    /* Unimplemented, RAZ/WI. */
     { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
-      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
-      .accessfn = pmreg_access_xevcntr },
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access_xevcntr,
+      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
+    { .name = "PMXEVCNTR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access_xevcntr,
+      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
     { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
       .access = PL0_R | PL1_RW, .accessfn = access_tpm,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmuserenr),
@@ -4221,7 +4374,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
 #endif
     /* The only field of MDCR_EL2 that has a defined architectural reset value
      * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; but we
-     * don't impelment any PMU event counters, so using zero as a reset
+     * don't implement any PMU event counters, so using zero as a reset
      * value for MDCR_EL2 is okay
      */
     { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
@@ -5033,6 +5186,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, v7ve_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
+        unsigned int i;
         /* v7 performance monitor control register: same implementor
          * field as main ID register, and we implement only the cycle
          * count register.
@@ -5057,6 +5211,40 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         };
         define_one_arm_cp_reg(cpu, &pmcr);
         define_one_arm_cp_reg(cpu, &pmcr64);
+        for (i = 0; i < 31; i++) {
+            char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
+            char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
+            char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
+            char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
+            ARMCPRegInfo pmev_regs[] = {
+                { .name = pmevcntr_name, .cp = 15, .crn = 15,
+                  .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
+                  .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
+                  .accessfn = pmreg_access },
+                { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
+                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 8 | (3 & (i >> 3)),
+                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+                  .type = ARM_CP_NO_RAW | ARM_CP_IO,
+                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn },
+                { .name = pmevtyper_name, .cp = 15, .crn = 15,
+                  .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
+                  .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
+                  .accessfn = pmreg_access },
+                { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
+                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 12 | (3 & (i >> 3)),
+                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+                  .type = ARM_CP_NO_RAW | ARM_CP_IO,
+                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn },
+                REGINFO_SENTINEL
+            };
+            define_arm_cp_regs(cpu, pmev_regs);
+            g_free(pmevcntr_name);
+            g_free(pmevcntr_el0_name);
+            g_free(pmevtyper_name);
+            g_free(pmevtyper_el0_name);
+        }
 #endif
         ARMCPRegInfo clidr = {
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

