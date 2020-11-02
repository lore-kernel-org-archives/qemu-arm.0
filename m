Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3821163lfa;
        Mon, 2 Nov 2020 02:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznM2EEvaNNzV6IVcCVWr4ipDUoWRJgTctIiHI+rP7oIwjM59btzzY2BTNC/uZ6LY857Grs
X-Received: by 2002:ae9:e907:: with SMTP id x7mr14654274qkf.38.1604314710533;
        Mon, 02 Nov 2020 02:58:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604314710; cv=none;
        d=google.com; s=arc-20160816;
        b=B4UAMO0N+U5RA8XQ9yvEbaaxN6UfY/aydwa5HCdXi+Jai6aU4Iyq/b3gYDP9qa3PWQ
         YSKJHmm6ezKuWuyRm5Kgg0mZz7mojgkYMkejPzB8QPFzMBylkcJRXl2ceZhGKWW0y6VB
         quvZuHvD9lpa5VXol7W5jTV6eIzkdYFfmoFeLpDJNC9PMgQRdQGzVS143snAh6MRLyrW
         hrhIgWiprRbHywc8GX/g2FT3/AX2rASWnyTCQ666LcSm1flrG+1E2rrWT7BVBxndz1Gx
         uiduAGiU05CMV5P4OBj1KfvMsQPiCVNAAERnBYOVBsetL5/NLQyCLgXhuN/lIsih4u0L
         6k/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rWBtvFVcRAJUSqtfSC6hgshOPutax3KK3AWZxRyOv9Q=;
        b=TKu58lAOnzAE2BVBNt5EA9xj9j5QSnHJCRTOQVoeo7PD8LUKYEJetspmG5iJ1NvQHQ
         bJ2qlJmkJOnYO5JXPWsWnOHNRWpXVPUGDC98ucO1phZ1ElPkJX9sYtmvq/1ApC3GGPJ9
         F0Rh3n09FZ9WDa+yCfmZSSEPFBtBK1FZeLWEW5OwxDfweuKlKb6KPq6+xhZDjuuLdcit
         BZkZGaBWR7mwrTXXZmKzW2iEpDB25VD+twBkKv3Y3v8kEJYvV1Nto4cedByMZP7DUQdq
         UmlshEv9hgMbiUU3Y4XZrPC8UMSDTw7O/ufYRmyCMasiexFZ/QQCfEfrwFtyM8QK4u5N
         dSmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9si3716579qtv.6.2020.11.02.02.58.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 02:58:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXXh-0007vp-Vf
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 05:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXXN-0007QR-QC; Mon, 02 Nov 2020 05:58:09 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39544
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXXL-0006iy-TC; Mon, 02 Nov 2020 05:58:09 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 36FA76002D;
 Mon,  2 Nov 2020 11:58:03 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 04/14] target/arm: factor MDCR_EL2 common handling
Date: Mon,  2 Nov 2020 12:57:52 +0200
Message-Id: <20201102105802.39332-4-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <2172054.ElGaqSPkdT@basile.remlab.net>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
X-TUID: JgBbYVktQH6g

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds a common helper to compute the effective value of MDCR_EL2.
That is the actual value if EL2 is enabled in the current security
context, or 0 elsewise.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f4822fab0c..d0ee9ff3fc 100644
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
@@ -1348,12 +1353,12 @@ static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1432,7 +1437,8 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     bool enabled, prohibited, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
-    uint8_t hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    uint8_t hpmn = mdcr_el2 & MDCR_HPMN;
 
     if (!arm_feature(env, ARM_FEATURE_PMU)) {
         return false;
@@ -1442,13 +1448,13 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
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
2.29.1

