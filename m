Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3388349lfb;
        Mon, 23 Nov 2020 00:05:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKPrw0TzZV2VIeu6kSONhAYRKnDcQuXMrcm2Zom4cgtg7r24NoyVr9nJPVLqVk7bImJ1ff
X-Received: by 2002:a25:11c2:: with SMTP id 185mr33433501ybr.410.1606118728106;
        Mon, 23 Nov 2020 00:05:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118728; cv=none;
        d=google.com; s=arc-20160816;
        b=G+u+gvmTpyxeDm3MN9+DKCYDwT9X3gFpTmZF44KkaWYOhKQ+/QCSeo1p5GnrJbRTsl
         VtSZbgfAKrRP2AylJxy1Niw+6yyKjhm3lHxnoL8zetbhM8qS035vrMrU6fau84X5NvIe
         pqDDEd6mUdPU8I0htJagD0fsUuH/jF1q4lN8h+UjvBIzZVp4UcryzQd9+sOo9tyuI0zU
         W2txciP7M2vHG9VYNCfVRTrsu4N5BPppDirgy4rLDv+YE5pXNZ30CTbrxDT+v1mWQmP7
         yOTjusDv9Z0YOVHyllgTzRvmkBzYdQokZlPC3S33xmmLsjqQDMZcfUrQ9XwhoHUgt2Iz
         4IEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=uRiXhr2k1pmtWBb3fPBpvJAhMWQWWRMngDl2o5+a+YA=;
        b=rrQGmRXXY5wx4nPc7byqRfNXXhhE/bE9bOWhCkabHJvVs3uaoz/1JzFtDlLWdA9Pt7
         nF9mGmmclqHCpuS9vulNwOlzRuaF2jymOMqeeAVnh3nKH9j+77G1dHv78PRaG1NtPAfj
         HKBvSpjwU4iJulKkTOT0RmeZJ8lJ9vAWXLbn64NpYJ/KVJv3RhSXCcXUg1pEIkhU+p8y
         ZhmEg4k7ZLmmRyj5tRdybcDvHCg1FLNQralLYQCs+WU83cv0f7leWT4I87BtDQrnnfuW
         /rud9OCaAUlcAAGtSOPW++UzS3mxv8Fp8ebekRpKfrvs3Us8vZ0msb2IoAlo5BcL3wsU
         kk9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o143si9886313yba.445.2020.11.23.00.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:05:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6ql-0007XV-G8
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6o5-0005kp-GD; Mon, 23 Nov 2020 03:02:41 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54626
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6o3-0004el-Ez; Mon, 23 Nov 2020 03:02:41 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 59DDB6035E;
 Mon, 23 Nov 2020 09:02:38 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 05/17] target/arm: factor MDCR_EL2 common handling
Date: Mon, 23 Nov 2020 10:02:25 +0200
Message-Id: <20201123080237.18465-5-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
X-TUID: w27RxvUCnelN

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds a common helper to compute the effective value of MDCR_EL2.
That is the actual value if EL2 is enabled in the current security
context, or 0 elsewise.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b972c9064d..e55059585b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -538,6 +538,11 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
     return CP_ACCESS_TRAP_UNCATEGORIZED;
 }
 
+static uint64_t arm_mdcr_el2_eff(CPUARMState *env)
+{
+    return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
+}
+
 /* Check for traps to "powerdown debug" registers, which are controlled
  * by MDCR.TDOSA
  */
@@ -545,11 +550,11 @@ static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tdosa = (env->cp15.mdcr_el2 & MDCR_TDOSA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tdosa = (mdcr_el2 & MDCR_TDOSA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tdosa && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tdosa) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDOSA)) {
@@ -565,11 +570,11 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tdra = (env->cp15.mdcr_el2 & MDCR_TDRA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tdra = (mdcr_el2 & MDCR_TDRA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tdra && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tdra) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
@@ -585,11 +590,11 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tda = (env->cp15.mdcr_el2 & MDCR_TDA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tda && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tda) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
@@ -605,9 +610,9 @@ static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
 
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && (mdcr_el2 & MDCR_TPM)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
@@ -1347,12 +1352,12 @@ static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
      * trapping to EL2 or EL3 for other accesses.
      */
     int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
 
     if (el == 0 && !(env->cp15.c9_pmuserenr & 1)) {
         return CP_ACCESS_TRAP;
     }
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && (mdcr_el2 & MDCR_TPM)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
@@ -1431,7 +1436,8 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     bool enabled, prohibited, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
-    uint8_t hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    uint8_t hpmn = mdcr_el2 & MDCR_HPMN;
 
     if (!arm_feature(env, ARM_FEATURE_PMU)) {
         return false;
@@ -1441,13 +1447,13 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
             (counter < hpmn || counter == 31)) {
         e = env->cp15.c9_pmcr & PMCRE;
     } else {
-        e = env->cp15.mdcr_el2 & MDCR_HPME;
+        e = mdcr_el2 & MDCR_HPME;
     }
     enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
 
     if (!secure) {
         if (el == 2 && (counter < hpmn || counter == 31)) {
-            prohibited = env->cp15.mdcr_el2 & MDCR_HPMD;
+            prohibited = mdcr_el2 & MDCR_HPMD;
         } else {
             prohibited = false;
         }
-- 
2.29.2

