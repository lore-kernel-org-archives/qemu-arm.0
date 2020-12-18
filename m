Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2349139lfq;
        Fri, 18 Dec 2020 06:34:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7ZyHcxhLbvy4Egub8AeVYSgbPKtjYMpnuyLnnaYu6LNsDtDJ7dzPuUgkwbkKwEYZpQUVX
X-Received: by 2002:a25:aaee:: with SMTP id t101mr5868042ybi.517.1608302091394;
        Fri, 18 Dec 2020 06:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608302091; cv=none;
        d=google.com; s=arc-20160816;
        b=bsodyGlPjPw8fFc4zQcB6f/ng/FKAU7TF2m7ymfc40LvN51HB8Tt4SvxRALkffWVWy
         NoWBLpGRMwNHc5Ou9YwmgavfWMp1prHnSchnsJeGHfuVKFxyEpPsYXxjo9V+OkJPzktG
         bh68J3G5cL6bG+8FEBOBXXdpKOfoNDSDe3F2qbtM95B8dNnUmduaVKRVko4b3tMRxPY9
         gQaz1wbs8PkVEuvtiELyn260lBIU9NRMh6ZKgKjAYlEz2AUGC9i3+0elyj1vyvISJ97q
         t8zarSGOQCNrT8MEFBj9T0v7MFGYZxhnc5IOM8gZAchPVBU78EJhSRuXevOxPba66K/A
         AKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=aW/fktrJgU+OulOQxP/gQdwVSZ2bOGMXODCllo6M6Hw=;
        b=bNiR71kEKGOjQkR1V7X3k6IbhfBIZqMMu0LztJfHMkgtLVudrlZxyzhUuU5syyVkYh
         thtmQefLAM7Xccpnlp+/i2rUfxnZOMJCFsAbTqr5aMS+rKZIjFV7oOwu9CpLAUyABAQM
         RUz6A1RT2iZTG9Cb7NFjQRProKLQH/TlEpkRScL1OokEqSHO4ZWsHCALlspnmFir46vR
         jUzl+oHy+8kFGpiA1y2psEjwDylMjWJzlg24WxxGq4kS8hZNnKlbuS056E2AQQul3y2i
         hvG/eFcStKBUSnG4NLlL9mMoRJs/8YZVqAmyyCeHYcM3AkbzL9N0o1Rwd1YIUflYJm4Q
         uyZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si7853521ybb.406.2020.12.18.06.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 06:34:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqGqI-0002gp-PE
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 09:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqGow-0001V7-1w; Fri, 18 Dec 2020 09:33:26 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56808
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqGot-0007YA-6e; Fri, 18 Dec 2020 09:33:25 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id BD0F65FD51;
 Fri, 18 Dec 2020 15:33:21 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 2/3] target/arm: ARMv8.4-TTST extension
Date: Fri, 18 Dec 2020 16:33:20 +0200
Message-Id: <20201218143321.102872-2-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7884934.NyiUUSuA9g@basile.remlab.net>
References: <7884934.NyiUUSuA9g@basile.remlab.net>
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
X-TUID: 0ABu9ODtFUj1

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds for the Small Translation tables extension in AArch64 state.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 13 ++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39abb2a36b..604b9cdd0e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3991,6 +3991,11 @@ static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
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
index b927e53ab0..c3a186db35 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10851,7 +10851,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t level,
             if (level == 0 && pamax <= 42) {
                 return false;
             }
-            if (level == 3) {
+            if (level == 3 && !cpu_isar_feature(aa64_st, cpu)) {
                 return false;
             }
             break;
@@ -10946,7 +10946,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi;
+    int select, tsz, tbi, max_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10981,7 +10981,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
-- 
2.29.2

