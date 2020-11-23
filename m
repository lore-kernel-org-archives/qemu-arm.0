Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3388035lfb;
        Mon, 23 Nov 2020 00:04:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxAgtYR7wKz/OnwPsLDZEYWdN4UoPicTNV9Kige9Ch6PIzreH2WWrNT7CFe8y5ZqBlPjfK
X-Received: by 2002:a25:e758:: with SMTP id e85mr33430333ybh.51.1606118698168;
        Mon, 23 Nov 2020 00:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118698; cv=none;
        d=google.com; s=arc-20160816;
        b=rIUrlVun9Bf/PwBXQMHeewCsj/Bl33G0pfbuR5tMf/HXUae7LaXXghrT66ggzo63Wr
         raN3aelUCj+mDQyV/0ceEEjeyVgn/7ZBMKpqV9IEsTeN8eKIOXyKLqTvMmYWiONNSTOK
         5bXVeyEZqURbxKZaFH9nMyFJRl0Zw4H3z9HDko5McTHzxLDm/iqq5gk24XLxQcBtXkSE
         t4U8UgGMzaMnfE/VvcUOoV9V2uA6dwQNSlm51JYaOQ8r9mdZeYm5wb6mqyu5WREdfwgt
         MwZy8zdFNa4azWJ1Jngrv8lsrcfxxpkw1zOXJWgsj0XCJBFBvnm3YOVgr+NSVTiAlhXh
         Dlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ShzSaBizMYg0Os9E6cHsKjrCJMx2fC+714rumBLyt18=;
        b=pwPuz0wRghPwPiEN1uEW20mcU/rlpOf0iEKIGKw8+6lddXo0bhJ19ftUjmVE3DMJip
         g4mbXCuD0LN9I55nZGJonUQbRwqqbqZdHJpmDVKcahc7PIBQe3O89IiJJeKptfAc8S9/
         7WZ0wgn4cRA2uRe2aYKpJCQEbF3aDqnsaL4oEeecagMchGNvBpsrfgRKZ/GCRK0/sJzZ
         GyoSCxbGcoo61r47SY1SntMuic6C1xNn3FXN6IS0N/QpBHI81PySz+VAHNaNYSBygxle
         /C3GMeiIC2ulMTtAgy4QGFIPPJfnZjMDkhO+wRbIrHkmqArGy0MWI+u4ag2VOBjw4ZUZ
         NdMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si10571777ybe.230.2020.11.23.00.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6qH-0007qM-9L
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6o4-0005jM-2q; Mon, 23 Nov 2020 03:02:40 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54618
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6o2-0004dh-J0; Mon, 23 Nov 2020 03:02:39 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 37D6A5FC79;
 Mon, 23 Nov 2020 09:02:37 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 01/17] target/arm: remove redundant tests
Date: Mon, 23 Nov 2020 10:02:21 +0200
Message-Id: <20201123080237.18465-1-remi.denis.courmont@huawei.com>
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
X-TUID: trrtFkG/ytwe

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
index 07492e9f9a..48b34080ce 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -447,14 +447,14 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
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
index 11b0803df7..346dc91a91 100644
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
2.29.2

