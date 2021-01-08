Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp332003lfq;
        Fri, 8 Jan 2021 01:08:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfftxVmalCx3sMqPl8WcEg+46u7YT8+XID/ic7SbJn5F9xDUiRDmMkambKeo6BPPkgOmrW
X-Received: by 2002:a25:ba88:: with SMTP id s8mr4434554ybg.183.1610096919639;
        Fri, 08 Jan 2021 01:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610096919; cv=none;
        d=google.com; s=arc-20160816;
        b=yVfO99gopbstLr1l8k58JjTGT0QgpnHdPVmpAG9O0CnPwDjoS3RfmuZc5DXUyLBI6+
         NFlOQYNxx+dGoN7+kQivWnoSztZgrVnt7xdAoPaiXwFLj7vqD4HS1/g9CWVsvf3Z9bYX
         KVJRBnjSOYjA1rH9CTnbut43VDEHQBZ0gknM/AyswA5ND0TUVWbi2rkJJTZ5lJc52u2o
         Bc47Wz5QsaFRTxI1NoLnZJxIHh13qbPTTbwHBeBDTx1RDa32fll2OME80oHeNyi2HdxW
         iAxEde82u68heB6ENMFYCtPAic+fGdeBtwR5NNjUWktXEfn86R/oYORbZrIPtSNUvZes
         gVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=iuSyTUM9QXFJyTodvb9RUOKS2oKxA9kJD7GNIV6zoQ8=;
        b=wBO2LmvU4nGk9XD5l1Yq7vPPq4kgsP5Nup9kXLm+/LpvtLM/C0YFKClMfpGyDvcjKz
         UJm1VaF86W2xrdyAP9+yxXQHDtkEUBahzEhj7om/t9BwUNN41r664kNz4/v0Emb2Z4Qf
         TnRRlcN4ycVAod/GilV1jaCMqXMW0rgjaJj1ev9E74/7QuFfm1W3Bgkwjfv7NQwx80bY
         FprDyo+HHb8IP2FkNhcveAhUvcabNaMVRqNFerH9stDdyk1XUJElhCE2Anaw3R7aY3/r
         kQyMjr49/Yo+hAjXIaTNZbdvK7EXyJVfdjxL25VFoRHFwiNuVXdhuUKsS5nziBPlwNEZ
         DyWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si10361789ybr.44.2021.01.08.01.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 01:08:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxnl9-0003qJ-0D
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 04:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kxnkz-0003pz-Dr; Fri, 08 Jan 2021 04:08:29 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:42254
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kxnku-00007E-LR; Fri, 08 Jan 2021 04:08:26 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id D41F85FC66;
 Fri,  8 Jan 2021 10:08:17 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCHv2 1/2] target/arm: ARMv8.4-TTST extension
Date: Fri,  8 Jan 2021 11:08:16 +0200
Message-Id: <20210108090817.6127-1-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001,
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
X-TUID: u6yBhRmadopH

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds for the Small Translation tables extension in AArch64 state.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 15 +++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..ad37ff61c6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3936,6 +3936,11 @@ static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, UAO) != 0;
 }
 
+static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, ST) != 0;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2d0d4cd1e1..bf54616c23 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10842,7 +10842,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi;
+    int select, tsz, tbi, max_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10877,7 +10877,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
     }
-    tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
+
+    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
+        max_tsz = 48 - using64k;
+    } else {
+        max_tsz = 39;
+    }
+
+    tsz = MIN(tsz, max_tsz);
     tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
 
     /* Present TBI as a composite with TBID.  */
@@ -11096,6 +11103,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         if (!aarch64 || stride == 9) {
             /* AArch32 or 4KB pages */
             startlevel = 2 - sl0;
+
+            if (cpu_isar_feature(aa64_st, cpu)) {
+                startlevel &= 3;
+            }
         } else {
             /* 16KB or 64KB pages */
             startlevel = 3 - sl0;
-- 
2.30.0

