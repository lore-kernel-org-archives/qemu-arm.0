Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3455748lfq;
        Tue, 12 Jan 2021 03:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdJWZVpnlj+067kpnL3xqm2wEXw6tYUMINa4YaDP0RtWTn4CPGvddnWkLXspWhYPpGaWGS
X-Received: by 2002:a25:4015:: with SMTP id n21mr5894811yba.192.1610450224326;
        Tue, 12 Jan 2021 03:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610450224; cv=none;
        d=google.com; s=arc-20160816;
        b=c/5yFWvuz/0oeWhOmJYX4nWXqvARcJa93CxBrJ+Kb5Cy+2GytisUtnrIOa53orERrk
         84P53nN8ZSdia7tm+IH5M/G9MicoidZ0jyg9IPWnoaw95fumIgkF15Fqoga4EtPpkQ8I
         bYWKJu6yauibZ7Iy/CAynAf14UgKsRu6wo7RgceRxqCvhjfpvDT2SknUOEYMyG1NvzQC
         LEww/cDlahzS3zkaIIWBeAmZ4h6CQEcgp5owSFPDosomsXZSMDnjZZ5UO/QsaxiseDYF
         l/51+1hvMPPb/jaXG4NEj6a6ub0NTNlctZk8h+RNxVw/CmzTbX15mwl+fueVluvASgNq
         bbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ulISHjl9yReAkgqU5DN0yA9fiV90B4FDCu5CPIIXxUo=;
        b=uKYqY74SSmojjLgGBouTILuhQet3LbTGscEego+2MmUhnB6Gz25IeFb72VajMo0uxq
         qfbZwO8HaVULoZMFDohFDEcPkY7NVary2D0S4XJeVqeUV9f97LgkS0jga+iq+WCCUL1l
         xVr/8UKemPUtj+YuR3P76J+7RkUmqX9SnI5DF/RKGwrYqhWpSXFD+DdDANBoAGqRhlg3
         BuN/UoCklQajIfDgA+UAov3XtFDiMHhKt8N1YH1OhUdVXyPcglGzN8DpGGKAg7OL3lcr
         EoNvOSKQPlG3eGZRQ6aSw5WeqWiKLQyWCKcn24rLdAHArB0tzh14Wim4srXJlgE/+on9
         eiTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30si2691450ybh.196.2021.01.12.03.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:17:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHfb-0004XU-Lm
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHAy-0003bD-FA; Tue, 12 Jan 2021 05:45:27 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56704
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHAq-0003LS-IM; Tue, 12 Jan 2021 05:45:21 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 87D665FCEF;
 Tue, 12 Jan 2021 11:45:11 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 01/19] target/arm: remove redundant tests
Date: Tue, 12 Jan 2021 12:44:53 +0200
Message-Id: <20210112104511.36576-1-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
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
X-TUID: 6HbxR5sfnNCZ

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

In this context, the HCR value is the effective value, and thus is
zero in secure mode. The tests for HCR.{F,I}MO are sufficient.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c    |  8 ++++----
 target/arm/helper.c | 10 ++++------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8387e94b94..5530874686 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -451,14 +451,14 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
         break;
 
     case EXCP_VFIQ:
-        if (secure || !(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
-            /* VFIQs are only taken when hypervized and non-secure.  */
+        if (!(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
+            /* VFIQs are only taken when hypervized.  */
             return false;
         }
         return !(env->daif & PSTATE_F);
     case EXCP_VIRQ:
-        if (secure || !(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
-            /* VIRQs are only taken when hypervized and non-secure.  */
+        if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
+            /* VIRQs are only taken when hypervized.  */
             return false;
         }
         return !(env->daif & PSTATE_I);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5ab3f5ace3..dabe1b32bb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2083,13 +2083,11 @@ static void csselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     CPUState *cs = env_cpu(env);
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    bool el1 = arm_current_el(env) == 1;
+    uint64_t hcr_el2 = el1 ? arm_hcr_el2_eff(env) : 0;
     uint64_t ret = 0;
-    bool allow_virt = (arm_current_el(env) == 1 &&
-                       (!arm_is_secure_below_el3(env) ||
-                        (env->cp15.scr_el3 & SCR_EEL2)));
 
-    if (allow_virt && (hcr_el2 & HCR_IMO)) {
+    if (hcr_el2 & HCR_IMO) {
         if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
             ret |= CPSR_I;
         }
@@ -2099,7 +2097,7 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         }
     }
 
-    if (allow_virt && (hcr_el2 & HCR_FMO)) {
+    if (hcr_el2 & HCR_FMO) {
         if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
             ret |= CPSR_F;
         }
-- 
2.30.0

