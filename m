Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3661787lfb;
        Mon, 9 Nov 2020 06:10:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB/zKHtsyf9O8BcgD0D1/y89GVj8AUu5X4zivPGl8ix8Cplf9OFbCFdTLNgUWAWGBWCS8Y
X-Received: by 2002:a05:6102:2439:: with SMTP id l25mr8209702vsi.44.1604931056598;
        Mon, 09 Nov 2020 06:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931056; cv=none;
        d=google.com; s=arc-20160816;
        b=tYbI/3kLotVlhS5ptSxEWQ2Q5uR3djPrd2zEShvZKJWSEekEIvrl8pxyRce83+rcK2
         O7hjk/FGpFXhu9UtY1Xk2G9oAb5uTPz/WCe/+YGWCsqjHMwN3UhiQvSO2HBmX9ZVaWCV
         wfB7pVo5KxzBGEdgY6pSkPE0nI+I9ARIrNUXueTIC4qONapRBB01cjUuJwhCYftwiVBh
         +CatoJX3lAoeCfH6h0jwWcR6VmIQ3fIcM3Zcvz8DFItPmksTMSfTyZ5OBqTePXSmmDMu
         43V5R/JUvp9T5bdyzrX3o+MNgnPBhxNsSuSgcv5U/xyJ1lRzaddbUz7kKXSZV8wHmLeR
         rkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ycShxSEHakAqYhjNyN4v7KBy97aPC7VfFWQiorhjcxc=;
        b=WFwfizHO+D8JagbY78GPvjpJZzkf8ztZEfNsLVidgUkb6fIS4PqjnrMSY84j4FbHas
         WFS5wxFbH7RuF8DrxInEAcuF4gflj3kqS26KJDUHE3CGBSdDJwqilMffEz9oB2etmUdt
         kuQ40T8dyByIAChkPzELFrDvHMkQ45uk+C/o+vRQSfsC3dE6lA2AFoNkMfnWaOV2xgkr
         ML5OAoT+yY6AF+d5qffs0EQegk+VRNsjeaAgcCg554RtiKKX1LQ2Ga78vYVCBerXTosn
         Os6gbLSONZCTHjODXz1k59N8SG7Z+m7Yb8PoQIQNfDaj6aedgCG3fi8WtlZJxMJviGmA
         MZGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r81si804877vkd.55.2020.11.09.06.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc7sl-00032l-S3
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sJ-000313-Db; Mon, 09 Nov 2020 09:10:27 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60178
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sG-0002kn-6U; Mon, 09 Nov 2020 09:10:27 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 194005FFC9;
 Mon,  9 Nov 2020 15:10:22 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 05/17] target/arm: factor MDCR_EL2 common handling
Date: Mon,  9 Nov 2020 16:10:08 +0200
Message-Id: <20201109141020.27234-5-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hdoomxfbXUwR

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
index b5d6dc7daa..7c6795a04c 100644
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

