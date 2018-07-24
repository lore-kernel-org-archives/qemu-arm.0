Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6729080wru;
        Tue, 24 Jul 2018 05:00:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfsvwwxer+LutfjigDKpDzwfIYXDui0rhFA1Uf6C/EjikPFe9y/16NA/vItjn1kP29FrRP6
X-Received: by 2002:ac8:2cd1:: with SMTP id 17-v6mr15930588qtx.360.1532433628603;
        Tue, 24 Jul 2018 05:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532433628; cv=none;
        d=google.com; s=arc-20160816;
        b=L+xe0Qa2joOCWPlbHwN86eyreqvp9Q0853xcWdeCiWm9hdk6mV2+GS71Q3PBsmB9OV
         vH0h4Ok9jBzPN9uxaNlbAUfd6Q/Xu4iZNpFCqAGCd20MGtXzEJ30OW7pckbkBsDHs9co
         Gt2pIYGy5OV7/l/5MdM8+wiaTidwgUyrEIIkKX/pc8xo6pzzCSfdU9C4tje7JG6hlR6N
         1KOpxcrRFetCNy6CDqh6Penrsd5uvHLGxK40OljWeQgZoOxc4dd6mK0Fpvj2yNuz0U9O
         MoBh9g5uuDzcJH+TGZb2SX1QrkWz/SLOy+/DseXl/k/oRqAh6HBqY8NUw7z2sSK8ohvl
         nX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ITkBEWnn2LPs9Gxh4vj3qXkgVJZEw18MyxQmYdwH76o=;
        b=inBhqkrMSrJLjMI4v7eNJUFffk3qPe2+xgGfxaflnrM7Hl+OtFtxoF36BHEojbewN0
         jTuAvImMheidhWJ7cfA6KPi3aoSYKc74wLR8rWOYS1Vz0CiFbcTG/KhcQFHrstmkUeqh
         ArU68YzU3yZ7ovburMuwAwgOUm8UWdvcs0kWP8bG6Zkkd8BTRIkJWFG4+bOTj86pOxsv
         l3R25H7R+VTsyv1cZmI7+SCt8Znk6b2/cgX31rO9oE7dATuoxHF9/CAuYdDtZrkOdj78
         OAAkKPek28Kak3S72cB+R+gsI90W8kdL+qnTbYYVulRSubJZq+RMeXKl4YKrsT37M2ic
         ujng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m4-v6si6425061qta.149.2018.07.24.05.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 05:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhvzQ-00008q-3s
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 08:00:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyv-00089b-Hj
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyt-00036B-VI
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fhvyt-00035b-KV; Tue, 24 Jul 2018 07:59:55 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fhvys-0008QE-F9; Tue, 24 Jul 2018 12:59:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 24 Jul 2018 12:59:49 +0100
Message-Id: <20180724115950.17316-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724115950.17316-1-peter.maydell@linaro.org>
References: <20180724115950.17316-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/5] target/arm: Provide accessor functions for
 HCR_EL2.{IMO, FMO, AMO}
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
X-TUID: InGCIeSx0ukM

The IMO, FMO and AMO bits in HCR_EL2 are defined to "behave as
1 for all purposes other than direct reads" if HCR_EL2.TGE
is set and HCR_EL2.E2H is 0, and to "behave as 0 for all
purposes other than direct reads" if HCR_EL2.TGE is set
and HRC_EL2.E2H is 1.

To avoid having to check E2H and TGE everywhere where we test IMO and
FMO, provide accessors arm_hcr_el2_imo(), arm_hcr_el2_fmo()and
arm_hcr_el2_amo().  We don't implement ARMv8.1-VHE yet, so the E2H
case will never be true, but we include the logic to save effort when
we eventually do get to that.

(Note that in several of these callsites the change doesn't
actually make a difference as either the callsite is handling
TGE specially anyway, or the CPU can't get into that situation
with TGE set; we change everywhere for consistency.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          | 64 +++++++++++++++++++++++++++++++++++----
 hw/intc/arm_gicv3_cpuif.c | 19 ++++++------
 target/arm/helper.c       |  6 ++--
 3 files changed, 71 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index efb2a8d3f3d..4289c33ef4c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1229,6 +1229,12 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_RW        (1ULL << 31)
 #define HCR_CD        (1ULL << 32)
 #define HCR_ID        (1ULL << 33)
+#define HCR_E2H       (1ULL << 34)
+/*
+ * When we actually implement ARMv8.1-VHE we should add HCR_E2H to
+ * HCR_MASK and then clear it again if the feature bit is not set in
+ * hcr_write().
+ */
 #define HCR_MASK      ((1ULL << 34) - 1)
 
 #define SCR_NS                (1U << 0)
@@ -2234,6 +2240,54 @@ bool write_cpustate_to_list(ARMCPU *cpu);
 #  define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 
+/**
+ * arm_hcr_el2_imo(): Return the effective value of HCR_EL2.IMO.
+ * Depending on the values of HCR_EL2.E2H and TGE, this may be
+ * "behaves as 1 for all purposes other than direct read/write" or
+ * "behaves as 0 for all purposes other than direct read/write"
+ */
+static inline bool arm_hcr_el2_imo(CPUARMState *env)
+{
+    switch (env->cp15.hcr_el2 & (HCR_TGE | HCR_E2H)) {
+    case HCR_TGE:
+        return true;
+    case HCR_TGE | HCR_E2H:
+        return false;
+    default:
+        return env->cp15.hcr_el2 & HCR_IMO;
+    }
+}
+
+/**
+ * arm_hcr_el2_fmo(): Return the effective value of HCR_EL2.FMO.
+ */
+static inline bool arm_hcr_el2_fmo(CPUARMState *env)
+{
+    switch (env->cp15.hcr_el2 & (HCR_TGE | HCR_E2H)) {
+    case HCR_TGE:
+        return true;
+    case HCR_TGE | HCR_E2H:
+        return false;
+    default:
+        return env->cp15.hcr_el2 & HCR_FMO;
+    }
+}
+
+/**
+ * arm_hcr_el2_amo(): Return the effective value of HCR_EL2.AMO.
+ */
+static inline bool arm_hcr_el2_amo(CPUARMState *env)
+{
+    switch (env->cp15.hcr_el2 & (HCR_TGE | HCR_E2H)) {
+    case HCR_TGE:
+        return true;
+    case HCR_TGE | HCR_E2H:
+        return false;
+    default:
+        return env->cp15.hcr_el2 & HCR_AMO;
+    }
+}
+
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el)
 {
@@ -2261,15 +2315,13 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
         break;
 
     case EXCP_VFIQ:
-        if (secure || !(env->cp15.hcr_el2 & HCR_FMO)
-            || (env->cp15.hcr_el2 & HCR_TGE)) {
+        if (secure || !arm_hcr_el2_fmo(env) || (env->cp15.hcr_el2 & HCR_TGE)) {
             /* VFIQs are only taken when hypervized and non-secure.  */
             return false;
         }
         return !(env->daif & PSTATE_F);
     case EXCP_VIRQ:
-        if (secure || !(env->cp15.hcr_el2 & HCR_IMO)
-            || (env->cp15.hcr_el2 & HCR_TGE)) {
+        if (secure || !arm_hcr_el2_imo(env) || (env->cp15.hcr_el2 & HCR_TGE)) {
             /* VIRQs are only taken when hypervized and non-secure.  */
             return false;
         }
@@ -2308,7 +2360,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                  * to the CPSR.F setting otherwise we further assess the state
                  * below.
                  */
-                hcr = (env->cp15.hcr_el2 & HCR_FMO);
+                hcr = arm_hcr_el2_fmo(env);
                 scr = (env->cp15.scr_el3 & SCR_FIQ);
 
                 /* When EL3 is 32-bit, the SCR.FW bit controls whether the
@@ -2325,7 +2377,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                  * when setting the target EL, so it does not have a further
                  * affect here.
                  */
-                hcr = (env->cp15.hcr_el2 & HCR_IMO);
+                hcr = arm_hcr_el2_imo(env);
                 scr = false;
                 break;
             default:
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 2a60568d82c..068a8e8e9b9 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -85,7 +85,10 @@ static bool icv_access(CPUARMState *env, int hcr_flags)
      *  * access if NS EL1 and either IMO or FMO == 1:
      *    CTLR, DIR, PMR, RPR
      */
-    return (env->cp15.hcr_el2 & hcr_flags) && arm_current_el(env) == 1
+    bool flagmatch = ((hcr_flags & HCR_IMO) && arm_hcr_el2_imo(env)) ||
+        ((hcr_flags & HCR_FMO) && arm_hcr_el2_fmo(env));
+
+    return flagmatch && arm_current_el(env) == 1
         && !arm_is_secure_below_el3(env);
 }
 
@@ -1549,8 +1552,8 @@ static void icc_dir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* No need to include !IsSecure in route_*_to_el2 as it's only
      * tested in cases where we know !IsSecure is true.
      */
-    route_fiq_to_el2 = env->cp15.hcr_el2 & HCR_FMO;
-    route_irq_to_el2 = env->cp15.hcr_el2 & HCR_IMO;
+    route_fiq_to_el2 = arm_hcr_el2_fmo(env);
+    route_irq_to_el2 = arm_hcr_el2_imo(env);
 
     switch (arm_current_el(env)) {
     case 3:
@@ -1893,7 +1896,7 @@ static CPAccessResult gicv3_irqfiq_access(CPUARMState *env,
         switch (el) {
         case 1:
             if (arm_is_secure_below_el3(env) ||
-                ((env->cp15.hcr_el2 & (HCR_IMO | HCR_FMO)) == 0)) {
+                (arm_hcr_el2_imo(env) == 0 && arm_hcr_el2_fmo(env) == 0)) {
                 r = CP_ACCESS_TRAP_EL3;
             }
             break;
@@ -1933,7 +1936,7 @@ static CPAccessResult gicv3_dir_access(CPUARMState *env,
 static CPAccessResult gicv3_sgi_access(CPUARMState *env,
                                        const ARMCPRegInfo *ri, bool isread)
 {
-    if ((env->cp15.hcr_el2 & (HCR_IMO | HCR_FMO)) &&
+    if ((arm_hcr_el2_imo(env) || arm_hcr_el2_fmo(env)) &&
         arm_current_el(env) == 1 && !arm_is_secure_below_el3(env)) {
         /* Takes priority over a possible EL3 trap */
         return CP_ACCESS_TRAP_EL2;
@@ -1958,8 +1961,7 @@ static CPAccessResult gicv3_fiq_access(CPUARMState *env,
     if (env->cp15.scr_el3 & SCR_FIQ) {
         switch (el) {
         case 1:
-            if (arm_is_secure_below_el3(env) ||
-                ((env->cp15.hcr_el2 & HCR_FMO) == 0)) {
+            if (arm_is_secure_below_el3(env) || !arm_hcr_el2_fmo(env)) {
                 r = CP_ACCESS_TRAP_EL3;
             }
             break;
@@ -1998,8 +2000,7 @@ static CPAccessResult gicv3_irq_access(CPUARMState *env,
     if (env->cp15.scr_el3 & SCR_IRQ) {
         switch (el) {
         case 1:
-            if (arm_is_secure_below_el3(env) ||
-                ((env->cp15.hcr_el2 & HCR_IMO) == 0)) {
+            if (arm_is_secure_below_el3(env) || !arm_hcr_el2_imo(env)) {
                 r = CP_ACCESS_TRAP_EL3;
             }
             break;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e2930e99388..699189ebd7b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6342,15 +6342,15 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     switch (excp_idx) {
     case EXCP_IRQ:
         scr = ((env->cp15.scr_el3 & SCR_IRQ) == SCR_IRQ);
-        hcr = ((env->cp15.hcr_el2 & HCR_IMO) == HCR_IMO);
+        hcr = arm_hcr_el2_imo(env);
         break;
     case EXCP_FIQ:
         scr = ((env->cp15.scr_el3 & SCR_FIQ) == SCR_FIQ);
-        hcr = ((env->cp15.hcr_el2 & HCR_FMO) == HCR_FMO);
+        hcr = arm_hcr_el2_fmo(env);
         break;
     default:
         scr = ((env->cp15.scr_el3 & SCR_EA) == SCR_EA);
-        hcr = ((env->cp15.hcr_el2 & HCR_AMO) == HCR_AMO);
+        hcr = arm_hcr_el2_amo(env);
         break;
     };
 
-- 
2.17.1

