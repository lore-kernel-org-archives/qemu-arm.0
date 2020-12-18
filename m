Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2164966lfq;
        Fri, 18 Dec 2020 02:43:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyETwD550IoW892NwRZVYd0KmdfTdwE2Qe0RMHnxpC1OrSGUylrDfauR6TtM6TlJSuDGf/O
X-Received: by 2002:a25:9887:: with SMTP id l7mr5187280ybo.319.1608288202878;
        Fri, 18 Dec 2020 02:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288202; cv=none;
        d=google.com; s=arc-20160816;
        b=W5PAj9dQB/rbHl5e0xzI/978O2TRNRTLBc5CqYZlCXrrJqSDOg+z2hJp7toKjwndCF
         TKXMm3rfuGe1A1xDTAMj/OPFGQCCTyAYpYKvUDXb+a1TyCPnM94AlhwkPb8UKCaFv8m4
         F3IaK6gBqUVd4hZoY6tsre20vt6tXweetaY3VJuRCDzzDVBc/OFLP/F16NJLNaF9dh5u
         uSNL2FiBpxy7dMc0zeNatzbh5whk4unLRgfNwio350kR2baJleKUOQigkc8AReOhg3AO
         /8fIfPWFZLv+KnNxlkaelmrcRbZtqKSISTyB8xeV3LB5FQlPWx7CvzkEdLuQBSr1Xkiz
         CUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=lUUfKH0TVB36D5jCor6CU4U2/QSG6y7bmbfVUTsV0Q8=;
        b=YCsxoV6SmMgXl7uIViFQLoCxcxSrLTi4Um8y7RS8fDILwLk0i0dEqWomWfH+rV8K0Z
         G+UESo0DSn1DThEEEhyqO6/QSGKk6vQT/DR3rr85UW24NduuMjmQ7iDmqZUp56IM13H6
         jQtbPyoVlQSrGaCKmCSDrYhA4ppNBPGrVl0Ckzpo2xSRkE+YOYzADKJtf4Y2WFpDLDNf
         Cz/6rcoqX46WZUqJW6uXjqz9fkao+GHcieicJjrgTYe0yXwGdpV1ihvI99kGRI8UKWBt
         ETQCQXU8UfusFTgIsnzGfI5t1Vwc+UA4/6xN1Mw+96zqPkq9KUqMC4SVaH8175+XPeEH
         oU9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h64si7433008yba.361.2020.12.18.02.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:43:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDEI-0003mK-7P
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9B-000665-NL; Fri, 18 Dec 2020 05:38:05 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55280
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD97-0003Il-KB; Fri, 18 Dec 2020 05:38:05 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 627885FFBB;
 Fri, 18 Dec 2020 11:38:00 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 03/18] target/arm: use arm_is_el2_enabled() where applicable
Date: Fri, 18 Dec 2020 12:37:44 +0200
Message-Id: <20201218103759.19929-3-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 575dJC67f+7O

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Do not assume that EL2 is available in non-secure context.
That equivalence is broken by ARMv8.4-SEL2.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h        |  4 ++--
 target/arm/helper-a64.c |  8 +-------
 target/arm/helper.c     | 33 +++++++++++++--------------------
 3 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a37ae8eac6..c4e370df06 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2134,7 +2134,7 @@ static inline bool arm_el_is_aa64(CPUARMState *env, int el)
         return aa64;
     }
 
-    if (arm_feature(env, ARM_FEATURE_EL2) && !arm_is_secure_below_el3(env)) {
+    if (arm_is_el2_enabled(env)) {
         aa64 = aa64 && (env->cp15.hcr_el2 & HCR_RW);
     }
 
@@ -3078,7 +3078,7 @@ static inline int arm_debug_target_el(CPUARMState *env)
     bool secure = arm_is_secure(env);
     bool route_to_el2 = false;
 
-    if (arm_feature(env, ARM_FEATURE_EL2) && !secure) {
+    if (arm_is_el2_enabled(env)) {
         route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
                        env->cp15.mdcr_el2 & MDCR_TDE;
     }
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 30b2ad119f..c426c23d2c 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -972,8 +972,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
     if (new_el == -1) {
         goto illegal_return;
     }
-    if (new_el > cur_el
-        || (new_el == 2 && !arm_feature(env, ARM_FEATURE_EL2))) {
+    if (new_el > cur_el || (new_el == 2 && !arm_is_el2_enabled(env))) {
         /* Disallow return to an EL which is unimplemented or higher
          * than the current one.
          */
@@ -985,11 +984,6 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         goto illegal_return;
     }
 
-    if (new_el == 2 && arm_is_secure_below_el3(env)) {
-        /* Return to the non-existent secure-EL2 */
-        goto illegal_return;
-    }
-
     if (new_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
         goto illegal_return;
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 786950cfba..9b82bcf5f9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1048,8 +1048,8 @@ static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     if (arm_feature(env, ARM_FEATURE_V8)) {
         /* Check if CPACR accesses are to be trapped to EL2 */
-        if (arm_current_el(env) == 1 &&
-            (env->cp15.cptr_el[2] & CPTR_TCPAC) && !arm_is_secure(env)) {
+        if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
+            (env->cp15.cptr_el[2] & CPTR_TCPAC)) {
             return CP_ACCESS_TRAP_EL2;
         /* Check if CPACR accesses are to be trapped to EL3 */
         } else if (arm_current_el(env) < 3 &&
@@ -2519,7 +2519,7 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
                                         bool isread)
 {
     unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
+    bool has_el2 = arm_is_el2_enabled(env);
     uint64_t hcr = arm_hcr_el2_eff(env);
 
     switch (cur_el) {
@@ -2543,8 +2543,7 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
             }
         } else {
             /* If HCR_EL2.<E2H> == 0: check CNTHCTL_EL2.EL1PCEN. */
-            if (arm_feature(env, ARM_FEATURE_EL2) &&
-                timeridx == GTIMER_PHYS && !secure &&
+            if (has_el2 && timeridx == GTIMER_PHYS &&
                 !extract32(env->cp15.cnthctl_el2, 1, 1)) {
                 return CP_ACCESS_TRAP_EL2;
             }
@@ -2553,8 +2552,7 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
 
     case 1:
         /* Check CNTHCTL_EL2.EL1PCTEN, which changes location based on E2H. */
-        if (arm_feature(env, ARM_FEATURE_EL2) &&
-            timeridx == GTIMER_PHYS && !secure &&
+        if (has_el2 && timeridx == GTIMER_PHYS &&
             (hcr & HCR_E2H
              ? !extract32(env->cp15.cnthctl_el2, 10, 1)
              : !extract32(env->cp15.cnthctl_el2, 0, 1))) {
@@ -2569,7 +2567,7 @@ static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx,
                                       bool isread)
 {
     unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
+    bool has_el2 = arm_is_el2_enabled(env);
     uint64_t hcr = arm_hcr_el2_eff(env);
 
     switch (cur_el) {
@@ -2590,8 +2588,7 @@ static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx,
         /* fall through */
 
     case 1:
-        if (arm_feature(env, ARM_FEATURE_EL2) &&
-            timeridx == GTIMER_PHYS && !secure) {
+        if (has_el2 && timeridx == GTIMER_PHYS) {
             if (hcr & HCR_E2H) {
                 /* If HCR_EL2.<E2H,TGE> == '10': check CNTHCTL_EL2.EL1PTEN. */
                 if (!extract32(env->cp15.cnthctl_el2, 11, 1)) {
@@ -4247,11 +4244,9 @@ static const ARMCPRegInfo strongarm_cp_reginfo[] = {
 
 static uint64_t midr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    ARMCPU *cpu = env_archcpu(env);
     unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_EL2) && !secure && cur_el == 1) {
+    if (arm_is_el2_enabled(env) && cur_el == 1) {
         return env->cp15.vpidr_el2;
     }
     return raw_read(env, ri);
@@ -4278,9 +4273,8 @@ static uint64_t mpidr_read_val(CPUARMState *env)
 static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
 
-    if (arm_feature(env, ARM_FEATURE_EL2) && !secure && cur_el == 1) {
+    if (arm_is_el2_enabled(env) && cur_el == 1) {
         return env->cp15.vmpidr_el2;
     }
     return mpidr_read_val(env);
@@ -5347,7 +5341,7 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
 {
     uint64_t ret = env->cp15.hcr_el2;
 
-    if (arm_is_secure_below_el3(env)) {
+    if (!arm_is_el2_enabled(env)) {
         /*
          * "This register has no effect if EL2 is not enabled in the
          * current Security state".  This is ARMv8.4-SecEL2 speak for
@@ -6144,7 +6138,7 @@ int sve_exception_el(CPUARMState *env, int el)
     /* CPTR_EL2.  Since TZ and TFP are positive,
      * they will be zero when EL2 is not present.
      */
-    if (el <= 2 && !arm_is_secure_below_el3(env)) {
+    if (el <= 2 && arm_is_el2_enabled(env)) {
         if (env->cp15.cptr_el[2] & CPTR_TZ) {
             return 2;
         }
@@ -8723,8 +8717,7 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
         }
         return 0;
     case ARM_CPU_MODE_HYP:
-        return !arm_feature(env, ARM_FEATURE_EL2)
-            || arm_current_el(env) < 2 || arm_is_secure_below_el3(env);
+        return !arm_is_el2_enabled(env) || arm_current_el(env) < 2;
     case ARM_CPU_MODE_MON:
         return arm_current_el(env) < 3;
     default:
@@ -12639,7 +12632,7 @@ int fp_exception_el(CPUARMState *env, int cur_el)
 
     /* CPTR_EL2 : present in v7VE or v8 */
     if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
-        && !arm_is_secure_below_el3(env)) {
+        && arm_is_el2_enabled(env)) {
         /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
         return 2;
     }
-- 
2.29.2

